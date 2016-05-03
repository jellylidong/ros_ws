#!/usr/bin/env python
import roslib
roslib.load_manifest("camera_sub")


import rospy
from camera_sub.msg import Num
from camera_sub.msg import MPerson

def talker():
    pub = rospy.Publisher('custom_chatter', MPerson)
    rospy.init_node('custom_talker', anonymous=True)
    r = rospy.Rate(100) #10hz
    msg = MPerson()
    msg.name = "ROS User"
    msg.age = 4

    while not rospy.is_shutdown():
        #raw_input("enter:")
        # if len(name) == 0:
        rospy.loginfo(msg)
        pub.publish(msg)
        r.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException: pass
