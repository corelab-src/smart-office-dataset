classdef Event < handle
    %EVENT Class that represents an event
    %   [Properties]
    %   DataItem    : Data item that triggers event
    %   Value       : Value of data item that triggers event
    
    properties
        DataItem
        Value
    end
    
    methods
        function obj = Event(DataItem,Value) 
            obj.DataItem = DataItem;
            obj.Value = Value;
        end
    end
end

