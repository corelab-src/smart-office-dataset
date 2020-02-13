classdef DataItem < handle
    %DATAITEM Class that represents a data item
    %   [Properties]
    %   Device      : Device that owns data item
    %   Location    : Location of parent device
    %   Type        : Type of data item
    %   Freshenss   : Freshness interval of data item
    %   Latency     : Retrieval latency of data item
    %   Range       : Valid value range of data item
    
    properties
        Device
        Location
        Type
        Freshness
        Latency
        Range
    end
    
    methods
        function obj = DataItem(Device,Location,Type,Freshness,Latency,Range)
            obj.Device = Device;
            obj.Location = Location;
            obj.Type = Type;
            obj.Freshness = Freshness;
            obj.Latency = Latency;
            obj.Range = Range;
        end
    end
end