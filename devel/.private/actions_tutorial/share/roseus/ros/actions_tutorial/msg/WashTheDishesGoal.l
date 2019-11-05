;; Auto-generated. Do not edit!


(when (boundp 'actions_tutorial::WashTheDishesGoal)
  (if (not (find-package "ACTIONS_TUTORIAL"))
    (make-package "ACTIONS_TUTORIAL"))
  (shadow 'WashTheDishesGoal (find-package "ACTIONS_TUTORIAL")))
(unless (find-package "ACTIONS_TUTORIAL::WASHTHEDISHESGOAL")
  (make-package "ACTIONS_TUTORIAL::WASHTHEDISHESGOAL"))

(in-package "ROS")
;;//! \htmlinclude WashTheDishesGoal.msg.html


(defclass actions_tutorial::WashTheDishesGoal
  :super ros::object
  :slots (_number_of_minutes ))

(defmethod actions_tutorial::WashTheDishesGoal
  (:init
   (&key
    ((:number_of_minutes __number_of_minutes) 0)
    )
   (send-super :init)
   (setq _number_of_minutes (round __number_of_minutes))
   self)
  (:number_of_minutes
   (&optional __number_of_minutes)
   (if __number_of_minutes (setq _number_of_minutes __number_of_minutes)) _number_of_minutes)
  (:serialization-length
   ()
   (+
    ;; int32 _number_of_minutes
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _number_of_minutes
       (write-long _number_of_minutes s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _number_of_minutes
     (setq _number_of_minutes (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get actions_tutorial::WashTheDishesGoal :md5sum-) "08fc95c12e8d6b627afb5f6c3337b8ec")
(setf (get actions_tutorial::WashTheDishesGoal :datatype-) "actions_tutorial/WashTheDishesGoal")
(setf (get actions_tutorial::WashTheDishesGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Goal
int32 number_of_minutes


")



(provide :actions_tutorial/WashTheDishesGoal "08fc95c12e8d6b627afb5f6c3337b8ec")

