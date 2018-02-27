; Auto-generated. Do not edit!


(cl:in-package pcl_processor-msg)


;//! \htmlinclude safeguard.msg.html

(cl:defclass <safeguard> (roslisp-msg-protocol:ros-message)
  ((decision
    :reader decision
    :initarg :decision
    :type cl:fixnum
    :initform 0)
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (oriX
    :reader oriX
    :initarg :oriX
    :type cl:float
    :initform 0.0)
   (oriY
    :reader oriY
    :initarg :oriY
    :type cl:float
    :initform 0.0)
   (oriZ
    :reader oriZ
    :initarg :oriZ
    :type cl:float
    :initform 0.0)
   (placX
    :reader placX
    :initarg :placX
    :type cl:float
    :initform 0.0)
   (placY
    :reader placY
    :initarg :placY
    :type cl:float
    :initform 0.0)
   (placZ
    :reader placZ
    :initarg :placZ
    :type cl:float
    :initform 0.0))
)

(cl:defclass safeguard (<safeguard>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <safeguard>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'safeguard)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_processor-msg:<safeguard> is deprecated: use pcl_processor-msg:safeguard instead.")))

(cl:ensure-generic-function 'decision-val :lambda-list '(m))
(cl:defmethod decision-val ((m <safeguard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_processor-msg:decision-val is deprecated.  Use pcl_processor-msg:decision instead.")
  (decision m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <safeguard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_processor-msg:distance-val is deprecated.  Use pcl_processor-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'oriX-val :lambda-list '(m))
(cl:defmethod oriX-val ((m <safeguard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_processor-msg:oriX-val is deprecated.  Use pcl_processor-msg:oriX instead.")
  (oriX m))

(cl:ensure-generic-function 'oriY-val :lambda-list '(m))
(cl:defmethod oriY-val ((m <safeguard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_processor-msg:oriY-val is deprecated.  Use pcl_processor-msg:oriY instead.")
  (oriY m))

(cl:ensure-generic-function 'oriZ-val :lambda-list '(m))
(cl:defmethod oriZ-val ((m <safeguard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_processor-msg:oriZ-val is deprecated.  Use pcl_processor-msg:oriZ instead.")
  (oriZ m))

(cl:ensure-generic-function 'placX-val :lambda-list '(m))
(cl:defmethod placX-val ((m <safeguard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_processor-msg:placX-val is deprecated.  Use pcl_processor-msg:placX instead.")
  (placX m))

(cl:ensure-generic-function 'placY-val :lambda-list '(m))
(cl:defmethod placY-val ((m <safeguard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_processor-msg:placY-val is deprecated.  Use pcl_processor-msg:placY instead.")
  (placY m))

(cl:ensure-generic-function 'placZ-val :lambda-list '(m))
(cl:defmethod placZ-val ((m <safeguard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_processor-msg:placZ-val is deprecated.  Use pcl_processor-msg:placZ instead.")
  (placZ m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <safeguard>) ostream)
  "Serializes a message object of type '<safeguard>"
  (cl:let* ((signed (cl:slot-value msg 'decision)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'oriX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'oriY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'oriZ))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'placX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'placY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'placZ))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <safeguard>) istream)
  "Deserializes a message object of type '<safeguard>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'decision) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'oriX) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'oriY) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'oriZ) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'placX) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'placY) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'placZ) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<safeguard>)))
  "Returns string type for a message object of type '<safeguard>"
  "pcl_processor/safeguard")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'safeguard)))
  "Returns string type for a message object of type 'safeguard"
  "pcl_processor/safeguard")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<safeguard>)))
  "Returns md5sum for a message object of type '<safeguard>"
  "e86bdfc6acd13ece55ca0ed104f5b4b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'safeguard)))
  "Returns md5sum for a message object of type 'safeguard"
  "e86bdfc6acd13ece55ca0ed104f5b4b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<safeguard>)))
  "Returns full string definition for message of type '<safeguard>"
  (cl:format cl:nil "int8 decision~%float64 distance~%float64 oriX~%float64 oriY~%float64 oriZ~%float64 placX~%float64 placY~%float64 placZ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'safeguard)))
  "Returns full string definition for message of type 'safeguard"
  (cl:format cl:nil "int8 decision~%float64 distance~%float64 oriX~%float64 oriY~%float64 oriZ~%float64 placX~%float64 placY~%float64 placZ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <safeguard>))
  (cl:+ 0
     1
     8
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <safeguard>))
  "Converts a ROS message object to a list"
  (cl:list 'safeguard
    (cl:cons ':decision (decision msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':oriX (oriX msg))
    (cl:cons ':oriY (oriY msg))
    (cl:cons ':oriZ (oriZ msg))
    (cl:cons ':placX (placX msg))
    (cl:cons ':placY (placY msg))
    (cl:cons ':placZ (placZ msg))
))
