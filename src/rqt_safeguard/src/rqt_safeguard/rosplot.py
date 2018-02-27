#!/usr/bin/env python
#
# Software License Agreement (BSD License)
#
# Copyright (c) 2009, Willow Garage, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of Willow Garage, Inc. nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#

import string
import sys
import threading
import time

import rosgraph
import roslib.message
import roslib.names
import rospy
from std_msgs.msg import Bool
from pcl_processor.msg import safeguard



class RosPlotException(Exception):
    pass


def _get_topic_type(topic):
    """
    subroutine for getting the topic type
    (nearly identical to rostopic._get_topic_type, except it returns rest of name instead of fn)

    :returns: topic type, real topic name, and rest of name referenced
      if the topic points to a field within a topic, e.g. /rosout/msg, ``str, str, str``
    """
    try:
        master = rosgraph.Master('/rosplot')
        val = master.getTopicTypes()
    except:
        raise RosPlotException("unable to get list of topics from master")
    matches = [(t, t_type) for t, t_type in val if t == topic or topic.startswith(t + '/')]
    if matches:
        t, t_type = matches[0]
        if t_type == roslib.names.ANYTYPE:
            return None, None, None
        if t_type == topic:
            return t_type, None
        return t_type, t, topic[len(t):]
    else:
        return None, None, None


def get_topic_type(topic):
    """
    Get the topic type (nearly identical to rostopic.get_topic_type, except it doesn't return a fn)

    :returns: topic type, real topic name, and rest of name referenced
      if the \a topic points to a field within a topic, e.g. /rosout/msg, ``str, str, str``
    """
    topic_type, real_topic, rest = _get_topic_type(topic)
    if topic_type:
        return topic_type, real_topic, rest
    else:
        return None, None, None


class ROSData(object):
    """
    Subscriber to ROS topic that buffers incoming data
    """

    def __init__(self, topic, start_time):
        self.name = topic
        self.start_time = start_time
        self.error = None

        # self._widget = PlotWidget(initial_topics=self._args.topics, start_paused=self._args.start_paused)

        self.lock = threading.Lock()
        self.decision = []
        self.oriX = []
        self.oriY = []
        self.oriZ = []
        self.placX = []
        self.placY = []
        self.placZ = []


        topic_type, real_topic, fields = get_topic_type(topic)
        if topic_type is not None:
            self.field_evals_decision = generate_field_evals_decision(fields)
            self.field_evals_oriX = generate_field_evals_oriX(fields)
            self.field_evals_oriY = generate_field_evals_oriY(fields)
            self.field_evals_oriZ = generate_field_evals_oriZ(fields)
            self.field_evals_placX = generate_field_evals_placX(fields)
            self.field_evals_placY = generate_field_evals_placY(fields)
            self.field_evals_placZ = generate_field_evals_placZ(fields)
            data_class = roslib.message.get_message_class(topic_type)
            self.sub = rospy.Subscriber(real_topic, safeguard, self._ros_cb)
        else:
            self.error = RosPlotException("Can not resolve topic type of %s" % topic)

    def close(self):
        self.sub.unregister()

    def _ros_cb(self, msg):
        """
        ROS subscriber callback
        :param msg: ROS message data
        """
        try:
            self.lock.acquire()
            try:
                self.decision = self._get_data_decision(msg)
                # #944: use message header time if present

                self.oriX = self._get_data_oriX(msg)
                self.oriY = self._get_data_oriY(msg)
                self.oriZ = self._get_data_oriZ(msg)
                
                self.placX = self._get_data_placX(msg)
                self.placY = self._get_data_placY(msg)
                self.placZ = self._get_data_placZ(msg)

                # if msg.__class__._has_header:
                #     self.buff_x.append(msg.header.stamp.to_sec() - self.start_time)
                # else:
                #     self.buff_x.append(rospy.get_time() - self.start_time)
                #self.axes[index].plot(datax, buff_y)
            except AttributeError as e:
                self.error = RosPlotException("Invalid topic spec [%s]: %s" % (self.name, str(e)))
        finally:
            self.lock.release()

    def next_dx(self):
        """
        Get the next data in the series

        :returns: [decision], [ydata]
        """
        if self.error:
            raise self.error
        try:
            self.lock.acquire()
            decision = self.decision
            oriX = self.oriX
            self.decision = []
            self.oriX = []
        finally:
            self.lock.release()
        return decision, oriX

    def next_yz(self):
        """
        Get the next data in the series

        :returns: [decision], [ydata]
        """
        if self.error:
            raise self.error
        try:
            self.lock.acquire()
            oriY = self.oriY
            oriZ = self.oriZ
            self.oriY = []
            self.oriZ = []
        finally:
            self.lock.release()
        return oriY, oriZ

    def next_pxy(self):
        """
        Get the next data in the series

        :returns: [decision], [ydata]
        """
        if self.error:
            raise self.error
        try:
            self.lock.acquire()
            placX = self.placX
            placY = self.placY
            self.placX = []
            self.placY = []
        finally:
            self.lock.release()
        return placX, placY

    def next_pz(self):
        """
        Get the next data in the series

        :returns: [decision], [ydata]
        """
        if self.error:
            raise self.error
        try:
            self.lock.acquire()
            placZ = self.placZ
            self.placZ = []
        finally:
            self.lock.release()
        return placZ

    def _get_data_decision(self, msg):
        val = msg
        try:
            if not self.field_evals_decision:
                if isinstance(val, Bool):
                    # extract boolean field from bool messages
                    val = val.data
                return float(val)
            for f in self.field_evals_decision:
                val = f(val)
            return float(val)
        except IndexError:
            self.error = RosPlotException("[%s] index error for: %s" % (self.name, str(val).replace('\n', ', ')))
        except TypeError:
            self.error = RosPlotException("[%s] value was not numeric: %s" % (self.name, val))

    def _get_data_oriX(self, msg):
        val = msg
        try:
            if not self.field_evals_oriX:
                if isinstance(val, Bool):
                    # extract boolean field from bool messages
                    val = val.data
                return float(val)
            for f in self.field_evals_oriX:
                val = f(val)
            return float(val)
        except IndexError:
            self.error = RosPlotException("[%s] index error for: %s" % (self.name, str(val).replace('\n', ', ')))
        except TypeError:
            self.error = RosPlotException("[%s] value was not numeric: %s" % (self.name, val))

    def _get_data_oriY(self, msg):
        val = msg
        try:
            if not self.field_evals_oriY:
                if isinstance(val, Bool):
                    # extract boolean field from bool messages
                    val = val.data
                return float(val)
            for f in self.field_evals_oriY:
                val = f(val)
            return float(val)
        except IndexError:
            self.error = RosPlotException("[%s] index error for: %s" % (self.name, str(val).replace('\n', ', ')))
        except TypeError:
            self.error = RosPlotException("[%s] value was not numeric: %s" % (self.name, val))

    def _get_data_oriZ(self, msg):
        val = msg
        try:
            if not self.field_evals_oriZ:
                if isinstance(val, Bool):
                    # extract boolean field from bool messages
                    val = val.data
                return float(val)
            for f in self.field_evals_oriZ:
                val = f(val)
            return float(val)
        except IndexError:
            self.error = RosPlotException("[%s] index error for: %s" % (self.name, str(val).replace('\n', ', ')))
        except TypeError:
            self.error = RosPlotException("[%s] value was not numeric: %s" % (self.name, val))


    def _get_data_placX(self, msg):
        val = msg
        try:
            if not self.field_evals_placX:
                if isinstance(val, Bool):
                    # extract boolean field from bool messages
                    val = val.data
                return float(val)
            for f in self.field_evals_placX:
                val = f(val)
            return float(val)
        except IndexError:
            self.error = RosPlotException("[%s] index error for: %s" % (self.name, str(val).replace('\n', ', ')))
        except TypeError:
            self.error = RosPlotException("[%s] value was not numeric: %s" % (self.name, val))

    def _get_data_placY(self, msg):
        val = msg
        try:
            if not self.field_evals_placY:
                if isinstance(val, Bool):
                    # extract boolean field from bool messages
                    val = val.data
                return float(val)
            for f in self.field_evals_placY:
                val = f(val)
            return float(val)
        except IndexError:
            self.error = RosPlotException("[%s] index error for: %s" % (self.name, str(val).replace('\n', ', ')))
        except TypeError:
            self.error = RosPlotException("[%s] value was not numeric: %s" % (self.name, val))

    def _get_data_placZ(self, msg):
        val = msg
        try:
            if not self.field_evals_placZ:
                if isinstance(val, Bool):
                    # extract boolean field from bool messages
                    val = val.data
                return float(val)
            for f in self.field_evals_placZ:
                val = f(val)
            return float(val)
        except IndexError:
            self.error = RosPlotException("[%s] index error for: %s" % (self.name, str(val).replace('\n', ', ')))
        except TypeError:
            self.error = RosPlotException("[%s] value was not numeric: %s" % (self.name, val))



def _array_eval(field_name, slot_num):
    """
    :param field_name: name of field to index into, ``str``
    :param slot_num: index of slot to return, ``str``
    :returns: fn(msg_field)->msg_field[slot_num]
    """
    def fn(f):
        return getattr(f, field_name).__getitem__(slot_num)
    return fn


def _field_eval_decision(field_name):
    """
    :param field_name: name of field to return, ``str``
    :returns: fn(msg_field)->msg_field.field_name
    """
    def fn(f):
        return getattr(f, 'decision')
    return fn

def _field_eval_oriX(field_name):
    """
    :param field_name: name of field to return, ``str``
    :returns: fn(msg_field)->msg_field.field_name
    """
    def fn(f):
        return getattr(f, 'oriX')
    return fn

def _field_eval_oriY(field_name):
    """
    :param field_name: name of field to return, ``str``
    :returns: fn(msg_field)->msg_field.field_name
    """
    def fn(f):
        return getattr(f, 'oriY')
    return fn

def _field_eval_oriZ(field_name):
    """
    :param field_name: name of field to return, ``str``
    :returns: fn(msg_field)->msg_field.field_name
    """
    def fn(f):
        return getattr(f, 'oriZ')
    return fn

def _field_eval_placX(field_name):
    """
    :param field_name: name of field to return, ``str``
    :returns: fn(msg_field)->msg_field.field_name
    """
    def fn(f):
        return getattr(f, 'placX')
    return fn

def _field_eval_placY(field_name):
    """
    :param field_name: name of field to return, ``str``
    :returns: fn(msg_field)->msg_field.field_name
    """
    def fn(f):
        return getattr(f, 'placY')
    return fn

def _field_eval_placZ(field_name):
    """
    :param field_name: name of field to return, ``str``
    :returns: fn(msg_field)->msg_field.field_name
    """
    def fn(f):
        return getattr(f, 'placZ')
    return fn



def generate_field_evals_decision(fields):
    try:
        evals = []
        fields = [f for f in fields.split('/') if f]
        for f in fields:
            if '[' in f:
                field_name, rest = f.split('[')
                slot_num = string.atoi(rest[:rest.find(']')])
                evals.append(_array_eval(field_name, slot_num))
            else:
                evals.append(_field_eval_decision(f))       
        return evals
    except Exception as e:
        raise RosPlotException("cannot parse field reference [%s]: %s" % (fields, str(e)))

def generate_field_evals_oriX(fields):
    try:
        evals = []
        fields = [f for f in fields.split('/') if f]
        for f in fields:
            if '[' in f:
                field_name, rest = f.split('[')
                slot_num = string.atoi(rest[:rest.find(']')])
                evals.append(_array_eval(field_name, slot_num))
            else:
                evals.append(_field_eval_oriX(f))       
        return evals
    except Exception as e:
        raise RosPlotException("cannot parse field reference [%s]: %s" % (fields, str(e)))

def generate_field_evals_oriY(fields):
    try:
        evals = []
        fields = [f for f in fields.split('/') if f]
        for f in fields:
            if '[' in f:
                field_name, rest = f.split('[')
                slot_num = string.atoi(rest[:rest.find(']')])
                evals.append(_array_eval(field_name, slot_num))
            else:
                evals.append(_field_eval_oriY(f))       
        return evals
    except Exception as e:
        raise RosPlotException("cannot parse field reference [%s]: %s" % (fields, str(e)))

def generate_field_evals_oriZ(fields):
    try:
        evals = []
        fields = [f for f in fields.split('/') if f]
        for f in fields:
            if '[' in f:
                field_name, rest = f.split('[')
                slot_num = string.atoi(rest[:rest.find(']')])
                evals.append(_array_eval(field_name, slot_num))
            else:
                evals.append(_field_eval_oriZ(f))     
        return evals
    except Exception as e:
        raise RosPlotException("cannot parse field reference [%s]: %s" % (fields, str(e)))


def generate_field_evals_placX(fields):
    try:
        evals = []
        fields = [f for f in fields.split('/') if f]
        for f in fields:
            if '[' in f:
                field_name, rest = f.split('[')
                slot_num = string.atoi(rest[:rest.find(']')])
                evals.append(_array_eval(field_name, slot_num))
            else:
                evals.append(_field_eval_placX(f))       
        return evals
    except Exception as e:
        raise RosPlotException("cannot parse field reference [%s]: %s" % (fields, str(e)))

def generate_field_evals_placY(fields):
    try:
        evals = []
        fields = [f for f in fields.split('/') if f]
        for f in fields:
            if '[' in f:
                field_name, rest = f.split('[')
                slot_num = string.atoi(rest[:rest.find(']')])
                evals.append(_array_eval(field_name, slot_num))
            else:
                evals.append(_field_eval_placY(f))        
        return evals
    except Exception as e:
        raise RosPlotException("cannot parse field reference [%s]: %s" % (fields, str(e)))

def generate_field_evals_placZ(fields):
    try:
        evals = []
        fields = [f for f in fields.split('/') if f]
        for f in fields:
            if '[' in f:
                field_name, rest = f.split('[')
                slot_num = string.atoi(rest[:rest.find(']')])
                evals.append(_array_eval(field_name, slot_num))
            else:
                evals.append(_field_eval_placZ(f))        
        return evals
    except Exception as e:
        raise RosPlotException("cannot parse field reference [%s]: %s" % (fields, str(e)))
