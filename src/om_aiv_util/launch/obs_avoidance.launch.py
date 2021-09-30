from launch import LaunchDescription
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory
import os
import os.path as osp

from launch import LaunchDescription
from launch_ros.actions import Node



#parameters_file_path = os.path.join(get_package_share_directory('om_aiv_util'), 'config', 'main_param.yaml')

def generate_launch_description():
    
    config = os.path.join(
        get_package_share_directory('pcl_processing'),
        'config',
        'camera_params.yaml'
        )
    
    pcl_filter_node = Node(
        package='pcl_processing',
        executable='pcl_filter',
        output='screen'
    )
    
    add_obstacle_node = Node(        
        package='om_aiv_navigation',
        executable='add_obstacle',
        output='screen'
    )
    
    point_add_server_node = Node(
        package='om_aiv_navigation',
        executable='point_add_server',
        output='screen'
    )
    
    check_box_node = Node(
        package='pcl_processing',
        executable='check_box',
        output='screen'
    )
    
    pcl_processing_node = Node(
        package='pcl_processing',
        executable='pcl_processing',
        parameters = [config],
        output='screen'
    )
    
    points_node = Node(
        package='tf2_ros',
        executable='static_transform_publisher',
        name='point_marker_publisher',
        output='log',
        arguments=['0.0', '0.0', '0.0', '0.0', '0.0', '0.0', 'main_body', 'obstacle_points']
    )

    return LaunchDescription([
        # pcl_filter_node,
        # check_box_node,
        add_obstacle_node,
        points_node,
        pcl_processing_node,
        # point_add_server_node,
        ])
