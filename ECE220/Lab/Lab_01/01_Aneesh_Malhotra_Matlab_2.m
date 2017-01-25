function [t,r] = harmonics(w0,Cn,thetan,tmax,Tsample)

t = 0:Tsample:tmax;

r = zeros(size(t)); % ensures r is the correct size
for i = 1:length(Cn) 
    r = r + Cn(i)*cos((i-1)*w0.*t + thetan(i));
end

end
