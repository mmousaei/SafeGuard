// Auto-generated. Do not edit!

// (in-package pcl_processor.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class safeguard {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.decision = null;
      this.distance = null;
      this.oriX = null;
      this.oriY = null;
      this.oriZ = null;
      this.placX = null;
      this.placY = null;
      this.placZ = null;
    }
    else {
      if (initObj.hasOwnProperty('decision')) {
        this.decision = initObj.decision
      }
      else {
        this.decision = 0;
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
      if (initObj.hasOwnProperty('oriX')) {
        this.oriX = initObj.oriX
      }
      else {
        this.oriX = 0.0;
      }
      if (initObj.hasOwnProperty('oriY')) {
        this.oriY = initObj.oriY
      }
      else {
        this.oriY = 0.0;
      }
      if (initObj.hasOwnProperty('oriZ')) {
        this.oriZ = initObj.oriZ
      }
      else {
        this.oriZ = 0.0;
      }
      if (initObj.hasOwnProperty('placX')) {
        this.placX = initObj.placX
      }
      else {
        this.placX = 0.0;
      }
      if (initObj.hasOwnProperty('placY')) {
        this.placY = initObj.placY
      }
      else {
        this.placY = 0.0;
      }
      if (initObj.hasOwnProperty('placZ')) {
        this.placZ = initObj.placZ
      }
      else {
        this.placZ = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type safeguard
    // Serialize message field [decision]
    bufferOffset = _serializer.int8(obj.decision, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = _serializer.float64(obj.distance, buffer, bufferOffset);
    // Serialize message field [oriX]
    bufferOffset = _serializer.float64(obj.oriX, buffer, bufferOffset);
    // Serialize message field [oriY]
    bufferOffset = _serializer.float64(obj.oriY, buffer, bufferOffset);
    // Serialize message field [oriZ]
    bufferOffset = _serializer.float64(obj.oriZ, buffer, bufferOffset);
    // Serialize message field [placX]
    bufferOffset = _serializer.float64(obj.placX, buffer, bufferOffset);
    // Serialize message field [placY]
    bufferOffset = _serializer.float64(obj.placY, buffer, bufferOffset);
    // Serialize message field [placZ]
    bufferOffset = _serializer.float64(obj.placZ, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type safeguard
    let len;
    let data = new safeguard(null);
    // Deserialize message field [decision]
    data.decision = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [oriX]
    data.oriX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [oriY]
    data.oriY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [oriZ]
    data.oriZ = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [placX]
    data.placX = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [placY]
    data.placY = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [placZ]
    data.placZ = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 57;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pcl_processor/safeguard';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e86bdfc6acd13ece55ca0ed104f5b4b1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 decision
    float64 distance
    float64 oriX
    float64 oriY
    float64 oriZ
    float64 placX
    float64 placY
    float64 placZ
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new safeguard(null);
    if (msg.decision !== undefined) {
      resolved.decision = msg.decision;
    }
    else {
      resolved.decision = 0
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    if (msg.oriX !== undefined) {
      resolved.oriX = msg.oriX;
    }
    else {
      resolved.oriX = 0.0
    }

    if (msg.oriY !== undefined) {
      resolved.oriY = msg.oriY;
    }
    else {
      resolved.oriY = 0.0
    }

    if (msg.oriZ !== undefined) {
      resolved.oriZ = msg.oriZ;
    }
    else {
      resolved.oriZ = 0.0
    }

    if (msg.placX !== undefined) {
      resolved.placX = msg.placX;
    }
    else {
      resolved.placX = 0.0
    }

    if (msg.placY !== undefined) {
      resolved.placY = msg.placY;
    }
    else {
      resolved.placY = 0.0
    }

    if (msg.placZ !== undefined) {
      resolved.placZ = msg.placZ;
    }
    else {
      resolved.placZ = 0.0
    }

    return resolved;
    }
};

module.exports = safeguard;
