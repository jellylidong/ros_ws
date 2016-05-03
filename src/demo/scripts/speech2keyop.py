#!/usr/bin/env python
import sys
import rospy
from kobuki_msgs.msg import KeyboardInput
from sensor_msgs.msg import Image

import roslib
roslib.load_manifest("demo")
from demo.srv import *

from cv_bridge import CvBridge, CvBridgeError
from shapeDetection import countShape
import cv2

try:
    import apiai
except ImportError:
    sys.path.append(os.path.join(os.path.dirname(os.path.realpath(__file__)), os.pardir))
    import apiai

import os
import threading
import thread
import pyaudio
import time
import ast


def initPublisher():
    pub = rospy.Publisher('/keyop/teleop', KeyboardInput)
    rospy.init_node('custom_key_pub', anonymous=True)
    r = rospy.Rate(10) #10hz
    r.sleep()
    return pub, r



publisher, rate = initPublisher()
img  = 0
#ROS key map
KeyCode_Right = 67
KeyCode_Left = 68
KeyCode_Up = 65
KeyCode_Down = 66
KeyCode_Space = 32
KeyCode_Enable = 101
KeyCode_Disable = 100


CHUNK = 512
FORMAT = pyaudio.paInt16
CHANNELS = 1
RATE = 44100
RECORD_SECONDS = 2

CLIENT_ACCESS_TOKEN = '7c4551dc1d9845618e1426665c93c989'
SUBSCRIPTION_KEY = '0122ce8ac2f7463ab2a1befb8966fe56'



bridge = CvBridge()

triangle = 0
circle = 0
global sub_once

def s2t():
    resampler = apiai.Resampler(source_samplerate=RATE)

    vad = apiai.VAD()

    ai = apiai.ApiAI(CLIENT_ACCESS_TOKEN, SUBSCRIPTION_KEY)

    request = ai.voice_request()

    request.lang = 'en' # optional, default value equal 'en'

    def callback(in_data, frame_count, time_info, status):
        frames, data = resampler.resample(in_data, frame_count)
        state = vad.processFrame(frames)
        request.send(data)

        if (state == 1):
            return in_data, pyaudio.paContinue
        else:
            return in_data, pyaudio.paComplete

    p = pyaudio.PyAudio()

    stream = p.open(format=FORMAT,
                    channels=CHANNELS, 
                    rate=RATE, 
                    input=True,
                    output=False,
                    frames_per_buffer=CHUNK,
                    stream_callback=callback)

    stream.start_stream()

    print ("Say!")

    try:
        while stream.is_active():
            time.sleep(0.1)
    except Exception:
        raise e
    except KeyboardInterrupt:
        pass

    stream.stop_stream()
    stream.close()
    p.terminate()

    print ("Wait for response...")
    response = request.getresponse()
    
    res = response.read()
    resDict = ast.literal_eval(res)
    print resDict["result"]['resolvedQuery']
    #print (response.read())

    return resDict["result"]['resolvedQuery']

def publishViaCmd(key):
    os.system("rostopic pub -1 /keyop/teleop kobuki_msgs/KeyboardInput " + str(key))

def publishViaCode(key):
    publisher.publish(key)

def callback(data):
    if triangle >= 1 and circle >= 1:
        sub_once.unregister()
        return
    print "call back running"
    print type(data)
    try:
      cv_image = bridge.imgmsg_to_cv2(data, "bgr8")
      if triangle >= 1 and circle >= 1:
          sub_once.unregister()
          return
    except CvBridgeError as e:
        sub_once.unregister()
        print(e)
    global triangle
    global circle
    triangle, circle = countShape(cv_image)
    print triangle, circle
    sub_once.unregister()
    rate.sleep()


# def lookAtMe():
#     while True:
#         rospy.Subscriber("/camera/rgb/image_raw",Image,callback)
#         rospy.wait_for_service('found_service') #service name
#         found = False
#         try:
#             findMe = rospy.ServiceProxy('found_service', find_Me) #service name, service file name
#             found = findMe(img) #send img to fimdMe service
#             if found:
#                 print "I got you !"
#                 break
#         except rospy.ServiceException, e:
#             print "Service call failed: %s"%e

def lookAtMe():
    print "running"
    # bridge = CvBridge()
    while  not (triangle >= 1 or circle >= 1):
        global sub_once
        sub_once = rospy.Subscriber("/camera/rgb/image_raw",Image,callback)
        # try:
        #   cv_image = bridge.imgmsg_to_cv2(img, "bgr8")
        # except CvBridgeError as e:
        #   print(e)
        # # print type(img)
        # triangle, circle = countShape(cv_image)
        # print triangle, circle
        # if triangle >= 1 and circle >= 1:
        #     break





def t2k(txt, publish=publishViaCmd):
    print "the text is ", txt
    if 'straight' in txt or 'str' in txt:
        print "straight"
        publish(KeyCode_Up)
        time.sleep(0.1)

    if "ba" in txt:
        print "back"
        publish(KeyCode_Down)

    if "le" in txt:
        print "left"
        publish(KeyCode_Left)
        time.sleep(0.1)
    if "ri" in txt:
        print "right"
        publish(KeyCode_Right)
        time.sleep(0.1)

    if "sto" in txt or "sta" in txt:
        print "stop"
        publish(KeyCode_Disable)
        time.sleep(0.5)
        publish(KeyCode_Enable)
        time.sleep(0.5
                   )

    if "loo" in txt and "me" in txt:
        publish(KeyCode_Disable)
        time.sleep(0.5)
        publish(KeyCode_Enable)
        time.sleep(0.5)
        publish(KeyCode_Left)
        lookAtMe()
        publish(KeyCode_Disable)
        time.sleep(0.5)
        publish(KeyCode_Enable)

    if "ex" in txt:
        exit()





# text = s2t()
# t2k(text)


while True:
    cmd = raw_input("Press Enter to continue, pre e to exit:")
    if cmd == "e":
        exit()
    text = s2t()
    t2k(text, publish=publishViaCode)
    rate.sleep()


