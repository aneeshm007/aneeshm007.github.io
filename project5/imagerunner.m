function out = imagerunner(file,p)
%Must Define Q
%file must be square



Q = [16 11 10 16 24 40 51 61
     12 12 14 19 26 58 60 55
     14 13 16 24 40 57 69 56
     14 17 22 29 51 87 80 62
     18 22 37 56 68 109 103 77
     24 35 55 64 81 104 113 92
     49 64 78 87 103 121 120 101
     72 92 95 98 112 100 103 99]

X = imread(file);

X = double(X);
r = X(:,:,1);
g = X(:,:,2);
b = X(:,:,3);

X = 0.216*r + 0.7152*g + 0.0722*b;


[m,n] = size(X);



for i = 1:8:m
    for j = 1:8:n
        block = X(i:i+7,j:j+7);
        comp = imagecomp(block,Q);
        X(i:i+7,j:j+7) = comp;
       
    end
end

figure
imagesc(uint8(X)); colormap(gray)

title(['P = ', num2str(p)])

out = X;