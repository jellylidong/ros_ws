#!/usr/bin/env python
import rospy
from kobuki_msgs.msg import KeyboardInput


def callback(data):
    rospy.loginfo(data)

def listener():
    rospy.init_node('key_sub', anonymous=True)
    rospy.Subscriber('key_pub', KeyboardInput, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
