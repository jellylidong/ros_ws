#!/usr/bin/env python
import rospy
from kobuki_msgs.msg import KeyboardInput

def talker():
    pub = rospy.Publisher('key_pub', KeyboardInput)
    rospy.init_node('custom_key_pub', anonymous=True)
    r = rospy.Rate(1) #10hz
    msg = KeyboardInput().KeyCode_Right

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
