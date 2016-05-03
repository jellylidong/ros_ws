; Auto-generated. Do not edit!


(cl:in-package demo-srv)


;//! \htmlinclude find_Me-request.msg.html

(cl:defclass <find_Me-request> (roslisp-msg-protocol:ros-message)
  ((image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass find_Me-request (<find_Me-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <find_Me-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'find_Me-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name demo-srv:<find_Me-request> is deprecated: use demo-srv:find_Me-request instead.")))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <find_Me-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader demo-srv:image-val is deprecated.  Use demo-srv:image instead.")
  (image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <find_Me-request>) ostream)
  "Serializes a message object of type '<find_Me-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <find_Me-request>) istream)
  "Deserializes a message object of type '<find_Me-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<find_Me-request>)))
  "Returns string type for a service object of type '<find_Me-request>"
  "demo/find_MeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'find_Me-request)))
  "Returns string type for a service object of type 'find_Me-request"
  "demo/find_MeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<find_Me-request>)))
  "Returns md5sum for a message object of type '<find_Me-request>"
  "2fa1f59afa4c021be31b726df9e5e8ef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'find_Me-request)))
  "Returns md5sum for a message object of type 'find_Me-request"
  "2fa1f59afa4c021be31b726df9e5e8ef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<find_Me-request>)))
  "Returns full string definition for message of type '<find_Me-request>"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'find_Me-request)))
  "Returns full string definition for message of type 'find_Me-request"
  (cl:format cl:nil "sensor_msgs/Image image~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <find_Me-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <find_Me-request>))
  "Converts a ROS message object to a list"
  (cl:list 'find_Me-request
    (cl:cons ':image (image msg))
))
;//! \htmlinclude find_Me-response.msg.html

(cl:defclass <find_Me-response> (roslisp-msg-protocol:ros-message)
  ((found
    :reader found
    :initarg :found
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass find_Me-response (<find_Me-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <find_Me-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'find_Me-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name demo-srv:<find_Me-response> is deprecated: use demo-srv:find_Me-response instead.")))

(cl:ensure-generic-function 'found-val :lambda-list '(m))
(cl:defmethod found-val ((m <find_Me-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader demo-srv:found-val is deprecated.  Use demo-srv:found instead.")
  (found m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <find_Me-response>) ostream)
  "Serializes a message object of type '<find_Me-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'found) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <find_Me-response>) istream)
  "Deserializes a message object of type '<find_Me-response>"
    (cl:setf (cl:slot-value msg 'found) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<find_Me-response>)))
  "Returns string type for a service object of type '<find_Me-response>"
  "demo/find_MeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'find_Me-response)))
  "Returns string type for a service object of type 'find_Me-response"
  "demo/find_MeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<find_Me-response>)))
  "Returns md5sum for a message object of type '<find_Me-response>"
  "2fa1f59afa4c021be31b726df9e5e8ef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'find_Me-response)))
  "Returns md5sum for a message object of type 'find_Me-response"
  "2fa1f59afa4c021be31b726df9e5e8ef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<find_Me-response>)))
  "Returns full string definition for message of type '<find_Me-response>"
  (cl:format cl:nil "bool found~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'find_Me-response)))
  "Returns full string definition for message of type 'find_Me-response"
  (cl:format cl:nil "bool found~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <find_Me-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <find_Me-response>))
  "Converts a ROS message object to a list"
  (cl:list 'find_Me-response
    (cl:cons ':found (found msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'find_Me)))
  'find_Me-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'find_Me)))
  'find_Me-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'find_Me)))
  "Returns string type for a service object of type '<find_Me>"
  "demo/find_Me")