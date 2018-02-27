;; Auto-generated. Do not edit!


(when (boundp 'pcl_processor::safeguard)
  (if (not (find-package "PCL_PROCESSOR"))
    (make-package "PCL_PROCESSOR"))
  (shadow 'safeguard (find-package "PCL_PROCESSOR")))
(unless (find-package "PCL_PROCESSOR::SAFEGUARD")
  (make-package "PCL_PROCESSOR::SAFEGUARD"))

(in-package "ROS")
;;//! \htmlinclude safeguard.msg.html


(defclass pcl_processor::safeguard
  :super ros::object
  :slots (_decision _distance _oriX _oriY _oriZ _placX _placY _placZ ))

(defmethod pcl_processor::safeguard
  (:init
   (&key
    ((:decision __decision) 0)
    ((:distance __distance) 0.0)
    ((:oriX __oriX) 0.0)
    ((:oriY __oriY) 0.0)
    ((:oriZ __oriZ) 0.0)
    ((:placX __placX) 0.0)
    ((:placY __placY) 0.0)
    ((:placZ __placZ) 0.0)
    )
   (send-super :init)
   (setq _decision (round __decision))
   (setq _distance (float __distance))
   (setq _oriX (float __oriX))
   (setq _oriY (float __oriY))
   (setq _oriZ (float __oriZ))
   (setq _placX (float __placX))
   (setq _placY (float __placY))
   (setq _placZ (float __placZ))
   self)
  (:decision
   (&optional __decision)
   (if __decision (setq _decision __decision)) _decision)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:oriX
   (&optional __oriX)
   (if __oriX (setq _oriX __oriX)) _oriX)
  (:oriY
   (&optional __oriY)
   (if __oriY (setq _oriY __oriY)) _oriY)
  (:oriZ
   (&optional __oriZ)
   (if __oriZ (setq _oriZ __oriZ)) _oriZ)
  (:placX
   (&optional __placX)
   (if __placX (setq _placX __placX)) _placX)
  (:placY
   (&optional __placY)
   (if __placY (setq _placY __placY)) _placY)
  (:placZ
   (&optional __placZ)
   (if __placZ (setq _placZ __placZ)) _placZ)
  (:serialization-length
   ()
   (+
    ;; int8 _decision
    1
    ;; float64 _distance
    8
    ;; float64 _oriX
    8
    ;; float64 _oriY
    8
    ;; float64 _oriZ
    8
    ;; float64 _placX
    8
    ;; float64 _placY
    8
    ;; float64 _placZ
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _decision
       (write-byte _decision s)
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _oriX
       (sys::poke _oriX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _oriY
       (sys::poke _oriY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _oriZ
       (sys::poke _oriZ (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _placX
       (sys::poke _placX (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _placY
       (sys::poke _placY (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _placZ
       (sys::poke _placZ (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _decision
     (setq _decision (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _decision 127) (setq _decision (- _decision 256)))
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _oriX
     (setq _oriX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _oriY
     (setq _oriY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _oriZ
     (setq _oriZ (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _placX
     (setq _placX (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _placY
     (setq _placY (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _placZ
     (setq _placZ (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get pcl_processor::safeguard :md5sum-) "e86bdfc6acd13ece55ca0ed104f5b4b1")
(setf (get pcl_processor::safeguard :datatype-) "pcl_processor/safeguard")
(setf (get pcl_processor::safeguard :definition-)
      "int8 decision
float64 distance
float64 oriX
float64 oriY
float64 oriZ
float64 placX
float64 placY
float64 placZ

")



(provide :pcl_processor/safeguard "e86bdfc6acd13ece55ca0ed104f5b4b1")


