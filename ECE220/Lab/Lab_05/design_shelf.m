function [A,B] = design_shelf(g,wc);
%g: The gain of the system
%wc: The cutoff frequency
%Output: Two vectors corresponding to the transfer function
%        of a low_shelf filter that meets the spec.
A = [1, wc*sqrt(2*g), g*wc^2];
B = [1, wc*sqrt(2), wc^2]; 
end
