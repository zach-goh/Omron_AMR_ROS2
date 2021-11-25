import math

import rclpy
from rclpy.node import Node

from ament_index_python.packages import get_package_share_directory
pcl_processing_share = get_package_share_directory('pcl_processing')

from om_aiv_msg.msg import Status
from geometry_msgs.msg import Pose, PoseArray
from std_srvs.srv import Empty

DEGREE_TO_RAD_CONST = 57.2958


class CameraCalibration(Node):
    
    
    def __init__(self):
        super().__init__('camera_calibration')
        self.robot_odometry_subscriber = self.create_subscription(Status, 'ldarcl_status', self.status_callback, 10)
        self.aruco_subscriber = self.create_subscription(PoseArray, 'aruco_poses', self.aruco_callback, 10)
        self.calib_result_sub = self.create_subscription(Pose, 'calibrated_pose', self.calib_pose_callback, 10)
        
        self.store_poses_srv = self.create_service(Empty, 'store_poses', self.store_poses)
        
        self.marker_pose_pub = self.create_publisher(PoseArray, 'robot_to_marker', 10)
        self.robot_pose_pub = self.create_publisher(PoseArray, 'base_to_robot', 10)
        self.odom_pose_list = PoseArray()
        self.marker_pose_list = PoseArray()
        self.marker_pose = Pose()
        
    # get the euler angles from a ROS2 quaternion msg as a list
    def euler_from_quat(self, quat):
        t0 = +2.0 * (quat.w * quat.x + quat.y * quat.z)
        t1 = +1.0 - 2.0 * (quat.x * quat.x + quat.y * quat.y)
        roll_x = round(math.atan2(t0, t1), 5)
        
        t2 = +2.0 * (quat.w * quat.y - quat.z * quat.x)
        t2 = +1.0 if t2 > +1.0 else t2
        t2 = -1.0 if t2 < -1.0 else t2
        pitch_y = round(math.asin(t2), 5)
        
        t3 = +2.0 * (quat.w * quat.z + quat.x * quat.y)
        t4 = +1.0 - 2.0 * (quat.y * quat.y + quat.z * quat.z)
        yaw_z = round(math.atan2(t3, t4), 5)
        
        return ([roll_x, pitch_y, yaw_z])
    
    # function converts the yaw of the robot(theta) in radians and returns a normalized quaternion 
    def quat_from_yaw(self, yaw):
        roll = 0
        pitch = 0
        
        cy = math.cos(yaw * 0.5);
        sy = math.sin(yaw * 0.5);
        cp = math.cos(pitch * 0.5);
        sp = math.sin(pitch * 0.5);
        cr = math.cos(roll * 0.5);
        sr = math.sin(roll * 0.5);
        
        self.pos.orientation.w = cy * cp * cr + sy * sp * sr
        self.pos.orientation.x = cy * cp * sr - sy * sp * cr
        self.pos.orientation.y = sy * cp * sr + cy * sp * cr
        self.pos.orientation.z = sy * cp * cr - cy * sp * sr
    
    # get location data from status and convert to pose
    def status_callback(self, msg):
        self.pos = Pose()
        self.pos.position.x = msg.location.x / 1000
        self.pos.position.y = msg.location.y / 1000
        radian = msg.location.theta / DEGREE_TO_RAD_CONST
        self.quat_from_yaw(radian)
    
    # Write lines into config file in pcl_processing    
    def calib_pose_callback(self,msg):
        self.get_logger().info("Calibration result: " + str(msg))
        rpy = self.euler_from_quat(msg.orientation)
        with open(pcl_processing_share + "/config/camera_params.yaml", 'r+') as file:
            indentation = "    "
            lines = file.readlines()
            for i in range(0,len(lines)):
                if "camera_x_offset" in lines[i]:
                    lines[i] = indentation + "camera_x_offset: " + str(msg.position.x) + "\n"
                if "camera_y_offset" in lines[i]:
                    lines[i] = indentation + "camera_y_offset: " + str(msg.position.y) + "\n"
                if "camera_roll_offset" in lines[i]:
                    lines[i] = indentation + "camera_roll_offset: " + str(rpy[0]) + "\n"
                if "camera_pitch_offset" in lines[i]:
                    lines[i] = indentation + "camera_pitch_offset: " + str(rpy[1]) + "\n"
                if "camera_yaw_offset" in lines[i]:
                    lines[i] = indentation + "camera_yaw_offset: " + str(rpy[2]) + "\n"
            with open(pcl_processing_share + "/config/camera_params.yaml", 'w+') as writefile:
                writefile.writelines(lines)
        
        
    # get the only the first pose data from aruco node
    def aruco_callback(self, msg):
        self.marker_pose = msg.poses[0]
        
    # store in memory the current position of robot and the pose of the fiducial marker
    def store_poses(self, req, res):
        self.odom_pose_list.poses.append(self.pos)
        self.marker_pose_list.poses.append(self.marker_pose)
        
        self.robot_pose_pub.publish(self.odom_pose_list)
        self.marker_pose_pub.publish(self.marker_pose_list)
        self.get_logger().info("Stored current robot position and fiducial marker position")
        
        # # empty return to signal to rqt that the service call is done if not rqt will crash
        return res
        

def main(args=None):
    rclpy.init(args=args)
    camera_calibration = CameraCalibration()
    rclpy.spin(camera_calibration)
    camera_calibration.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
    