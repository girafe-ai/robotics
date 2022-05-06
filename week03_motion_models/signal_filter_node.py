#!/usr/bin/env python

from collections import deque

import rospy
from std_msgs.msg import Float32


class SignalFilter:
    def __init__(self):
        # Initializing node with the "signal_filter" name in this process
        rospy.init_node("signal_filter")
        # Creating subscriber for the signal and publisher for filtered one
        self.signal_sub = rospy.Subscriber("signal", Float32, self.signal_callback)
        self.signal_pub = rospy.Publisher("filtered_signal", Float32, queue_size=10)

        # Buffer to store last 5 signal values
        self.signal_window = deque([], 5)

    def signal_callback(self, signal):
        # Logging recieved data
        rospy.loginfo("Recieved {}".format(signal.data))

        # Filtering signal with the moving average and
        # publishing filtered signal
        self.signal_window.append(signal.data)
        filtered_signal = sum(self.signal_window) / len(self.signal_window)

        self.signal_pub.publish(filtered_signal)

    def spin(self):
        # Pass control to ROS
        try:
            rospy.spin()
        except rospy.ROSInterruptException:
            rospy.logerr("Ctrl+C was pressed!")


if __name__ == "__main__":
    SignalFilter().spin()
