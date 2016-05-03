#!/usr/bin/env python

import roslib
roslib.load_manifest("demo")
import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from demo.srv import *
from shapeDetection import countShape



def handle_req(req):
    # print "Returning [%s + %s = %s]"%(req.a, req.b, (req.a + req.b))
    # return AddTwoIntsResponse(req.a + req.b)
    bridge = CvBridge()
    try:
      cv_image = bridge.imgmsg_to_cv2(req, "bgr8")
    except CvBridgeError as e:
      print(e)
    triangle, circle = countShape(cv_image)
    # if triangle == 1 and circle == 2:
    #     return True
    # else:
    #     return False
    return find_Me

def add_two_ints_server():
    rospy.init_node('find_me_server')
    s = rospy.Service('found_service', find_Me, handle_req)
    rospy.spin()

if __name__ == "__main__":
    add_two_ints_server()
