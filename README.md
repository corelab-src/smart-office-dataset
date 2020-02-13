Smart Office Dataset
===============

# Overview

This smart office dataset includes sensor data acquired from IoT devices during 144 hours on our smart office testbed. During the 144 hours, one agent (irregularly) conducts a set of prescribed actions such as open the window.

![Floor Plan of Our Smart Office Testbed](documents/testbed.pdf)

In the testbed, we use the following 19 IoT devices:
1. 2 x SmartSense Motion Sensor
2. 2 x SmartSense Multipurpose Sensor
3. 3 x Temperature-Humidify Sensor
4. 3 x Ultrasonic Sensor
5. 3 x Light Sensor
6. 3 x Sound Sensor
7. 1 x Philips Hue
8. 2 x Belkin Wemo Switch
  
This smart office dataset also includes randomly generated rules that use the data items. 

# Requirement

- Matlab R2018a or higher: the dataset employs Matlab classes to represent data items, events, and rules

# Class Definition
* [`DataItem`](classes/DataItem.m)
  - `Device`   : Device that owns data item
  - `Location` : Location of parent device
  - `Type`     : Type of data item
  - `Freshenss`: Freshness interval of data item
  - `Latency`  : Retrieval latency of data item
  - `Range`    : Valid value range of data item
 
* [`Event`](classes/Event.m)
  - `DataItem` : Data item that triggers event
  - `Value`    : Value of data item that triggers event
 
* [`Rule`](classes/Rule.m)
  - `Event`    : Index of event that triggers rule
  - `Condition`: Condition tree of rule
  - `Deadline` : Relative deadline of rule
 
* [`ConditionTree`](classes/ConditionTree.m)
  - Abstract class that represents a condition tree
  - Note that `InternalNode` and `LeafNode` inherit `ConditionTree` 

* [`InternalNode`](classes/InternalNode.m)
  - `LeftTree` : Left child tree of internal node
  - `BinOp`    : Binary operator that relates LeftTree and RightTree ('&&' or '||')
  - `RightTree`: Right child tree of internal node
 
* [`LeafNode`](classes/LeafNode.m)
  - `DataItem` : Index of target data item
  - `CompOp`   : Comparative operator
  - `Value`    : Data item value to compare
 
# Dataset Description

## Data Items
* [`ItemList.mat`](dataset/ItemList.mat): List of 26 data items in the testbed
* [`ItemValue.mat`](dataset/ItemValue.mat): Acquired values of the data items

## Events
* [`EventList.mat`](dataset/EvetList.mat): List of 10 events

## Rules
* [`RuleTable_Large.mat`](dataset/RuleTable_Large.mat): List of 200 rules using the entire set of the data items
* [`RuleTable_Small.mat`](dataset/RuleTable_Small.mat): List of 200 rules using the partial set of the data items

