; Auto-generated. Do not edit!


(cl:in-package om_aiv_navigation-msg)


;//! \htmlinclude QueueDropoffGoal.msg.html

(cl:defclass <QueueDropoffGoal> (roslisp-msg-protocol:ros-message)
  ((goal_queueDropoff
    :reader goal_queueDropoff
    :initarg :goal_queueDropoff
    :type cl:string
    :initform ""))
)

(cl:defclass QueueDropoffGoal (<QueueDropoffGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <QueueDropoffGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'QueueDropoffGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name om_aiv_navigation-msg:<QueueDropoffGoal> is deprecated: use om_aiv_navigation-msg:QueueDropoffGoal instead.")))

(cl:ensure-generic-function 'goal_queueDropoff-val :lambda-list '(m))
(cl:defmethod goal_queueDropoff-val ((m <QueueDropoffGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader om_aiv_navigation-msg:goal_queueDropoff-val is deprecated.  Use om_aiv_navigation-msg:goal_queueDropoff instead.")
  (goal_queueDropoff m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <QueueDropoffGoal>) ostream)
  "Serializes a message object of type '<QueueDropoffGoal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'goal_queueDropoff))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'goal_queueDropoff))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <QueueDropoffGoal>) istream)
  "Deserializes a message object of type '<QueueDropoffGoal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'goal_queueDropoff) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'goal_queueDropoff) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<QueueDropoffGoal>)))
  "Returns string type for a message object of type '<QueueDropoffGoal>"
  "om_aiv_navigation/QueueDropoffGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QueueDropoffGoal)))
  "Returns string type for a message object of type 'QueueDropoffGoal"
  "om_aiv_navigation/QueueDropoffGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<QueueDropoffGoal>)))
  "Returns md5sum for a message object of type '<QueueDropoffGoal>"
  "ba4a241c8636596603c5fc2db568cb7a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'QueueDropoffGoal)))
  "Returns md5sum for a message object of type 'QueueDropoffGoal"
  "ba4a241c8636596603c5fc2db568cb7a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<QueueDropoffGoal>)))
  "Returns full string definition for message of type '<QueueDropoffGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%string goal_queueDropoff~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'QueueDropoffGoal)))
  "Returns full string definition for message of type 'QueueDropoffGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%string goal_queueDropoff~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <QueueDropoffGoal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'goal_queueDropoff))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <QueueDropoffGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'QueueDropoffGoal
    (cl:cons ':goal_queueDropoff (goal_queueDropoff msg))
))
