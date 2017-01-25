function [A,B] = design_shelf(g,wc,a);
%g: The gain of the system
%wc: The cutoff frequency
%a: A boolean 0/1. 0 indiactes a low shelf and 1 indicates a high shelf
%Output: Two vectors corresponding to the transfer function
%        of a low_shelf filter that meets the spec.
if a ~= 1 & a ~= 0
    error('a must be either 1 or 0!') 
elseif a == 0
    A = [1, wc*sqrt(2*g), g*wc^2];
    B = [1, wc*sqrt(2), wc^2]; 

elseif a==1 
    A = [g, wc*sqrt(2*g), wc^2];
    B = [1, wc*sqrt(2), wc^2];
end

