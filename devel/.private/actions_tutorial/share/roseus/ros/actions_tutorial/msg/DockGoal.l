;; Auto-generated. Do not edit!


(when (boundp 'actions_tutorial::DockGoal)
  (if (not (find-package "ACTIONS_TUTORIAL"))
    (make-package "ACTIONS_TUTORIAL"))
  (shadow 'DockGoal (find-package "ACTIONS_TUTORIAL")))
(unless (find-package "ACTIONS_TUTORIAL::DOCKGOAL")
  (make-package "ACTIONS_TUTORIAL::DOCKGOAL"))

(in-package "ROS")
;;//! \htmlinclude DockGoal.msg.html


(defclass actions_tutorial::DockGoal
  :super ros::object
  :slots (_isdocked ))

(defmethod actions_tutorial::DockGoal
  (:init
   (&key
    ((:isdocked __isdocked) 0)
    )
   (send-super :init)
   (setq _isdocked (round __isdocked))
   self)
  (:isdocked
   (&optional __isdocked)
   (if __isdocked (setq _isdocked __isdocked)) _isdocked)
  (:serialization-length
   ()
   (+
    ;; int32 _isdocked
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _isdocked
       (write-long _isdocked s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _isdocked
     (setq _isdocked (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get actions_tutorial::DockGoal :md5sum-) "b2a74e0e3231023d3b4fd74b241fc57d")
(setf (get actions_tutorial::DockGoal :datatype-) "actions_tutorial/DockGoal")
(setf (get actions_tutorial::DockGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Goal
int32 isdocked


")



(provide :actions_tutorial/DockGoal "b2a74e0e3231023d3b4fd74b241fc57d")

