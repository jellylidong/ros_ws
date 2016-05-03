// Generated by gencpp from file demo/AddTwoIntsRequest.msg
// DO NOT EDIT!


#ifndef DEMO_MESSAGE_ADDTWOINTSREQUEST_H
#define DEMO_MESSAGE_ADDTWOINTSREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace demo
{
template <class ContainerAllocator>
struct AddTwoIntsRequest_
{
  typedef AddTwoIntsRequest_<ContainerAllocator> Type;

  AddTwoIntsRequest_()
    : A(0)
    , B(0)  {
    }
  AddTwoIntsRequest_(const ContainerAllocator& _alloc)
    : A(0)
    , B(0)  {
    }



   typedef int64_t _A_type;
  _A_type A;

   typedef int64_t _B_type;
  _B_type B;




  typedef boost::shared_ptr< ::demo::AddTwoIntsRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::demo::AddTwoIntsRequest_<ContainerAllocator> const> ConstPtr;

}; // struct AddTwoIntsRequest_

typedef ::demo::AddTwoIntsRequest_<std::allocator<void> > AddTwoIntsRequest;

typedef boost::shared_ptr< ::demo::AddTwoIntsRequest > AddTwoIntsRequestPtr;
typedef boost::shared_ptr< ::demo::AddTwoIntsRequest const> AddTwoIntsRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::demo::AddTwoIntsRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::demo::AddTwoIntsRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace demo

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'demo': ['/home/vcoder/ros_ws/src/demo/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::demo::AddTwoIntsRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::demo::AddTwoIntsRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::demo::AddTwoIntsRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::demo::AddTwoIntsRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::demo::AddTwoIntsRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::demo::AddTwoIntsRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::demo::AddTwoIntsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "02f05bb5bde9ff0aeeed7cca0d2e13fc";
  }

  static const char* value(const ::demo::AddTwoIntsRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x02f05bb5bde9ff0aULL;
  static const uint64_t static_value2 = 0xeeed7cca0d2e13fcULL;
};

template<class ContainerAllocator>
struct DataType< ::demo::AddTwoIntsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "demo/AddTwoIntsRequest";
  }

  static const char* value(const ::demo::AddTwoIntsRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::demo::AddTwoIntsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 A\n\
int64 B\n\
";
  }

  static const char* value(const ::demo::AddTwoIntsRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::demo::AddTwoIntsRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.A);
      stream.next(m.B);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct AddTwoIntsRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::demo::AddTwoIntsRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::demo::AddTwoIntsRequest_<ContainerAllocator>& v)
  {
    s << indent << "A: ";
    Printer<int64_t>::stream(s, indent + "  ", v.A);
    s << indent << "B: ";
    Printer<int64_t>::stream(s, indent + "  ", v.B);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DEMO_MESSAGE_ADDTWOINTSREQUEST_H
