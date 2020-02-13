classdef InternalNode < ConditionTree
    %INTERNALNODE Child class that represent an internal node of a condition tree
    %   [Properties]
    %   LeftTree    : Left child tree of internal node
    %   BinOp       : Binary operator that relates LeftTree and RightTree
    %                 ('&&' or '||')
    %   RightTree   : Right child tree of internal node
    
    properties
        LeftTree
        BinOp
        RightTree
    end
    
    methods
        function obj = InternalNode(LeftTree,BinOp,RightTree)
            if ~isa(LeftTree,'ConditionTree') || ~isa(RightTree,'ConditionTree')
            	error('The type of LeftTree or RightTree is not ConditionTree');
            end
            
            obj.LeftTree = LeftTree;
            obj.BinOp = BinOp;
            obj.RightTree = RightTree;

            obj.UniqueItems = unique([LeftTree.UniqueItems RightTree.UniqueItems]);
        end
        
        function [ret, ui] = evaluate(obj,valid,value)
            % Get the evaluation result of the left child tree
            [left_ret, left_ui] = obj.LeftTree.evaluate(valid,value);
            
            if isequal(obj.BinOp, @or) && left_ret == 1
                % No need to check the result of the right child tree
                ret = 1;
                ui = left_ui;
            elseif isequal(obj.BinOp, @and) && left_ret == 0
                % No need to check the result of the right child tree
                ret = 0;
                ui = left_ui;
            else
                % Get the evaluation result of the right child tree
                [right_ret, right_ui] = obj.RightTree.evaluate(valid,value);
                
                if isequal(obj.BinOp, @or) && right_ret == 1
                    ret = 1;
                    ui = union(left_ui, right_ui);
                elseif isequal(obj.BinOp, @and) && right_ret == 0
                    ret = 0;
                    ui = union(left_ui, right_ui);
                elseif left_ret == -1 || right_ret == -1
                    % No way to determine the evaluation result
                    ret = -1;
                    ui = [];
                else
                    ret = double(obj.BinOp(left_ret, right_ret));
                    ui = union(left_ui, right_ui);
                end
            end
        end
    end
end