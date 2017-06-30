function out = yuvrunner(file,p)


Q=p*8./hilb(8); %Only use for a linear matrix
% 
% Q = [16 11 10 16 24 40 51 61
%      12 12 14 19 26 58 60 55
%      14 13 16 24 40 57 69 56
%      14 17 22 29 51 87 80 62
%      18 22 37 56 68 109 103 77
%      24 35 55 64 81 104 113 92
%      49 64 78 87 103 121 120 101
%      72 92 95 98 112 100 103 99];
%  Q = p*Q;

X = imread(file);

X = double(X);
r = X(:,:,1);
g = X(:,:,2);
b = X(:,:,3);

Y = 0.299*r + 0.587*g + 0.114*b;
U = b - Y;
V = r - Y;

[m,n] = size(r);



for i = 1:8:m
    for j = 1:8:n
        try
        
        block = Y(i:i+7,j:j+7);
        comp = imagecomp(block,Q);
        Y(i:i+7,j:j+7) = comp;
        catch
            continue
        end
    end
end


for i = 1:8:m
    for j = 1:8:n
        try
        block = U(i:i+7,j:j+7);
        comp = imagecomp(block,Q);
        U(i:i+7,j:j+7) = comp;
        catch
            continue
        end
       
    end
end


for i = 1:8:m
    for j = 1:8:n
        try
        block = V(i:i+7,j:j+7);
        comp = imagecomp(block,Q);
        V(i:i+7,j:j+7) = comp;
        catch
            continue
        end
       
    end
end

r = V + Y;
b = U + Y;
g = (Y - 0.299*r - 0.114*b)/(0.587);
X(:,:,1) = r;
X(:,:,2) = g;
X(:,:,3) = b;


imagesc(uint8(X));

title(['P = ', num2str(p)])

out = X;