#!/usr/bin/env python

import sys
import rospy
from om_aiv_util.srv import *

def op_two_ints_client(x, y):
    rospy.wait_for_service('analogInputList')
    rospy.wait_for_service('analogInputQueryRaw')
    rospy.wait_for_service('analogInputQueryVoltage')
    try:
        service1 = rospy.ServiceProxy('analogInputList', Service)
        service2 = rospy.ServiceProxy('analogInputQueryRaw', Service)
        service3 = rospy.ServiceProxy('analogInputQueryVoltage', Service)
        resp1 = service1(x)
        print "resp1", resp1
        resp2 = service1(x)
        print "resp2", resp2
        resp3 = service1(x)
        print "resp3", resp3

    except rospy.ServiceException, e:
        print "Service call failed: %s"%e

def usage():
    return "%s [x y]"%sys.argv[0]

if __name__ == "__main__":
    if len(sys.argv) == 3:
        x = int(sys.argv[1])
        y = int(sys.argv[2])
    else:
        print usage()
        sys.exit(1)
    # print "Requesting %s+%s"%(x, y)
    # print "%s + %s = %s"%(x, y, add_two_ints_client(x, y))
    op_two_ints_client(x, y)
