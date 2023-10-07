function [lowBound,highBound] = lowHighBoundVsNCalc(n,H,e)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

lowBound = 2.^(n*(H+e));

highBound = (1-e)*2.^(n*(H-e));

end