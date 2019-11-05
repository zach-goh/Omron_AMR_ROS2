// Auto-generated. Do not edit!

// (in-package actions_tutorial.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class WashTheDishesGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.number_of_minutes = null;
    }
    else {
      if (initObj.hasOwnProperty('number_of_minutes')) {
        this.number_of_minutes = initObj.number_of_minutes
      }
      else {
        this.number_of_minutes = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WashTheDishesGoal
    // Serialize message field [number_of_minutes]
    bufferOffset = _serializer.int32(obj.number_of_minutes, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WashTheDishesGoal
    let len;
    let data = new WashTheDishesGoal(null);
    // Deserialize message field [number_of_minutes]
    data.number_of_minutes = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'actions_tutorial/WashTheDishesGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '08fc95c12e8d6b627afb5f6c3337b8ec';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    # Goal
    int32 number_of_minutes
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WashTheDishesGoal(null);
    if (msg.number_of_minutes !== undefined) {
      resolved.number_of_minutes = msg.number_of_minutes;
    }
    else {
      resolved.number_of_minutes = 0
    }

    return resolved;
    }
};

module.exports = WashTheDishesGoal;