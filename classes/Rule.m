classdef Rule < handle
    %RULE Summary of this class goes here
    %   [Properties]
    %   Event       : Index of event that triggers rule
    %   Condition   : Condition tree of rule
    %   Deadline    : Relative deadline of rule
    
    properties
        Event
        Condition
        Deadline
    end
    
    methods
        function obj = Rule(Event,Condition,Deadline)
            if isa(Condition, 'ConditionTree')
                obj.Event = Event;
                obj.Condition = Condition;
                obj.Deadline = Deadline;
            else
                error('The type of Condition is not ContionTree')
            end
        end
    end
end

