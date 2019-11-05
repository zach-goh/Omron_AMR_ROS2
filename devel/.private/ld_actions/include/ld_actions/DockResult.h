// Generated by gencpp from file ld_actions/DockResult.msg
// DO NOT EDIT!


#ifndef LD_ACTIONS_MESSAGE_DOCKRESULT_H
#define LD_ACTIONS_MESSAGE_DOCKRESULT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ld_actions
{
template <class ContainerAllocator>
struct DockResult_
{
  typedef DockResult_<ContainerAllocator> Type;

  DockResult_()
    : docking_status()  {
    }
  DockResult_(const ContainerAllocator& _alloc)
    : docking_status(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > , typename ContainerAllocator::template rebind<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::other >  _docking_status_type;
  _docking_status_type docking_status;





  typedef boost::shared_ptr< ::ld_actions::DockResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ld_actions::DockResult_<ContainerAllocator> const> ConstPtr;

}; // struct DockResult_

typedef ::ld_actions::DockResult_<std::allocator<void> > DockResult;

typedef boost::shared_ptr< ::ld_actions::DockResult > DockResultPtr;
typedef boost::shared_ptr< ::ld_actions::DockResult const> DockResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ld_actions::DockResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ld_actions::DockResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace ld_actions

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'actionlib_msgs': ['/opt/ros/melodic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg'], 'ld_actions': ['/home/tthmatt/ld_ROS/devel/.private/ld_actions/share/ld_actions/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::ld_actions::DockResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ld_actions::DockResult_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ld_actions::DockResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ld_actions::DockResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ld_actions::DockResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ld_actions::DockResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ld_actions::DockResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a47488ee9e6264003cfa058af9eb8e93";
  }

  static const char* value(const ::ld_actions::DockResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa47488ee9e626400ULL;
  static const uint64_t static_value2 = 0x3cfa058af9eb8e93ULL;
};

template<class ContainerAllocator>
struct DataType< ::ld_actions::DockResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ld_actions/DockResult";
  }

  static const char* value(const ::ld_actions::DockResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ld_actions::DockResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# Result\n"
"string[] docking_status\n"
"\n"
;
  }

  static const char* value(const ::ld_actions::DockResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ld_actions::DockResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.docking_status);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DockResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ld_actions::DockResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ld_actions::DockResult_<ContainerAllocator>& v)
  {
    s << indent << "docking_status[]" << std::endl;
    for (size_t i = 0; i < v.docking_status.size(); ++i)
    {
      s << indent << "  docking_status[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.docking_status[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // LD_ACTIONS_MESSAGE_DOCKRESULT_H