; Auto-generated. Do not edit!


(cl:in-package actions_tutorial-msg)


;//! \htmlinclude DockGoal.msg.html

(cl:defclass <DockGoal> (roslisp-msg-protocol:ros-message)
  ((isdocked
    :reader isdocked
    :initarg :isdocked
    :type cl:integer
    :initform 0))
)

(cl:defclass DockGoal (<DockGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DockGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DockGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name actions_tutorial-msg:<DockGoal> is deprecated: use actions_tutorial-msg:DockGoal instead.")))

(cl:ensure-generic-function 'isdocked-val :lambda-list '(m))
(cl:defmethod isdocked-val ((m <DockGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader actions_tutorial-msg:isdocked-val is deprecated.  Use actions_tutorial-msg:isdocked instead.")
  (isdocked m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DockGoal>) ostream)
  "Serializes a message object of type '<DockGoal>"
  (cl:let* ((signed (cl:slot-value msg 'isdocked)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DockGoal>) istream)
  "Deserializes a message object of type '<DockGoal>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'isdocked) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DockGoal>)))
  "Returns string type for a message object of type '<DockGoal>"
  "actions_tutorial/DockGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DockGoal)))
  "Returns string type for a message object of type 'DockGoal"
  "actions_tutorial/DockGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DockGoal>)))
  "Returns md5sum for a message object of type '<DockGoal>"
  "b2a74e0e3231023d3b4fd74b241fc57d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DockGoal)))
  "Returns md5sum for a message object of type 'DockGoal"
  "b2a74e0e3231023d3b4fd74b241fc57d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DockGoal>)))
  "Returns full string definition for message of type '<DockGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%int32 isdocked~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DockGoal)))
  "Returns full string definition for message of type 'DockGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%int32 isdocked~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DockGoal>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DockGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'DockGoal
    (cl:cons ':isdocked (isdocked msg))
))