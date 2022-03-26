#!/usr/bin/env python

from collections import deque

import numpy as np
import rospy
from second_package.msg import Signal
from second_package.srv import GetWindowMedian, GetWindowMedianResponse


class SignalFilter:
    def __init__(self):
        # Initializing node with the "signal_filter" name in this process
        rospy.init_node("signal_filter")
        # Creating subscriber for the signal and publisher for filtered one
        self.signal_sub = rospy.Subscriber("signal", Signal, self.signal_callback)
        self.signal_pub = rospy.Publisher("filtered_signal", Signal, queue_size=10)

        self.median_srv = rospy.Service(
            "get_median", GetWindowMedian, self.handle_get_median
        )

        # Buffer to store last 5 signal values
        self.signal_window = deque([], 5)

    def signal_callback(self, signal):
        # Logging recieved data
        rospy.loginfo("Recieved {}\nAt {}".format(signal.signal, signal.header.stamp))

        # Filtering signal with the moving average and
        # publishing filtered signal
        self.signal_window.append(signal.signal)
        # TODO: use Butterworth filter
        filtered_signal_value = sum(self.signal_window) / len(self.signal_window)
        filtered_signal = Signal()
        filtered_signal.signal = filtered_signal_value
        filtered_signal.header.stamp = rospy.Time.now()

        self.signal_pub.publish(filtered_signal)

    def handle_get_median(self, request):
        median = np.median(self.signal_window)
        response = GetWindowMedianResponse()
        response.median = median
        response.success = True
        return response

    def spin(self):
        # Pass control to ROS
        try:
            rospy.spin()
        except rospy.ROSInterruptException:
            rospy.logerr("Ctrl+C was pressed!")


if __name__ == "__main__":
    SignalFilter().spin()
