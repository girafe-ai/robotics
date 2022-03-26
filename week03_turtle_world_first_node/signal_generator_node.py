#!/usr/bin/env python

import numpy as np
import rospy
from std_msgs.msg import Float32


class SignalGenerator:
    def __init__(self):
        # Creaytin publisher for the signal
        self.signal_pub = rospy.Publisher("signal", Float32, queue_size=10)

    def generate_and_publish_signal(self):
        # Generation and publishing sine signal
        # dependent on current system time
        seconds = rospy.get_time()
        new_signal_value = np.sin(seconds) + 0.2 * np.random.randn()

        self.signal_pub.publish(new_signal_value)

        rospy.loginfo("Published {}".format(new_signal_value))

    def launch_signal_generator(self):
        # Initializing node with the "signal_generator" name
        rospy.init_node("signal_generator")

        # Setting node (publishing) rate
        rate = rospy.Rate(10)
        while not rospy.is_shutdown():
            self.generate_and_publish_signal()
            # Using sleep to keep the desired rate
            rate.sleep()

    def spin(self):
        try:
            self.launch_signal_generator()
        except rospy.ROSInterruptException:
            rospy.logerr("Ctrl+C was pressed!")


if __name__ == "__main__":
    SignalGenerator().spin()
