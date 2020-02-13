classdef LeafNode < ConditionTree
    %LEAFNODE Child class that represent a leaf node of a condition tree
    %   [Properties]
    %   DataItem    : Index of target data item
    %   CompOp      : Comparative operator
    %   Value       : Data item value to compare
    
    properties
        DataItem
        CompOp
        Value
    end
    
    methods
        function obj = LeafNode(DataItem,CompOp,Value)
            obj.DataItem = DataItem;
            obj.CompOp = CompOp;
            obj.Value = Value;
            
            obj.UniqueItems = DataItem;
        end
        
        function [ret, ui] = evaluate(obj,valid,value)
            if valid(obj.DataItem)
                ret = double(obj.CompOp(value(obj.DataItem),obj.Value));
                ui = obj.DataItem;
            else
                ret = -1;
                ui = [];
            end
        end
    end
end

