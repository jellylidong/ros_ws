#!/usr/bin/env python
import roslib
roslib.load_manifest("camera_sub")

import rospy
from camera_sub.msg import Num
from camera_sub.msg import MPerson

def callback(data):
    rospy.loginfo("%s is age: %d" % (data.name, data.age))

def listener():
    rospy.init_node('custom_listener', anonymous=True)
    rospy.Subscriber("custom_chatter", MPerson, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
