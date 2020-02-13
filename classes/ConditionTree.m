classdef (Abstract) ConditionTree
    %CONDITIONTREE Abstract class that represents a condition tree
    %   [Property]
    %   UniqueItems     : A set of data items that condition tree uses
    
    properties 
        UniqueItems
    end
    
    methods
        %EVALUTE Evaluate whether the corresponding condition is satisfied
        %   or not with valid data item values
        %   [Arguments]
        %   valid   : Mask that indicates which data item is valid (fresh)
        %   value   : List of values of data items
        %   [Return Values]
        %   ret     : Evaluation result
        %             (1 = true, 0 = false, -1 = fail to evaluate)
        %   ui      : Set of necessary data items 
        [ret, ui] = evalaute(obj,valid,value)
    end
end