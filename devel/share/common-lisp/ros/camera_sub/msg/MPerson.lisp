; Auto-generated. Do not edit!


(cl:in-package camera_sub-msg)


;//! \htmlinclude MPerson.msg.html

(cl:defclass <MPerson> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (age
    :reader age
    :initarg :age
    :type cl:integer
    :initform 0))
)

(cl:defclass MPerson (<MPerson>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MPerson>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MPerson)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name camera_sub-msg:<MPerson> is deprecated: use camera_sub-msg:MPerson instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <MPerson>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader camera_sub-msg:name-val is deprecated.  Use camera_sub-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'age-val :lambda-list '(m))
(cl:defmethod age-val ((m <MPerson>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader camera_sub-msg:age-val is deprecated.  Use camera_sub-msg:age instead.")
  (age m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MPerson>) ostream)
  "Serializes a message object of type '<MPerson>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let* ((signed (cl:slot-value msg 'age)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MPerson>) istream)
  "Deserializes a message object of type '<MPerson>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'age) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MPerson>)))
  "Returns string type for a message object of type '<MPerson>"
  "camera_sub/MPerson")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MPerson)))
  "Returns string type for a message object of type 'MPerson"
  "camera_sub/MPerson")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MPerson>)))
  "Returns md5sum for a message object of type '<MPerson>"
  "83da5ca00b8e049b0559653a472c88a5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MPerson)))
  "Returns md5sum for a message object of type 'MPerson"
  "83da5ca00b8e049b0559653a472c88a5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MPerson>)))
  "Returns full string definition for message of type '<MPerson>"
  (cl:format cl:nil "string name~%int32 age~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MPerson)))
  "Returns full string definition for message of type 'MPerson"
  (cl:format cl:nil "string name~%int32 age~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MPerson>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MPerson>))
  "Converts a ROS message object to a list"
  (cl:list 'MPerson
    (cl:cons ':name (name msg))
    (cl:cons ':age (age msg))
))
