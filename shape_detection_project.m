format long
clear all
clc
%vid = videoinput('winvideo');
%i = getsnapshot(vid);
i=imread('t2.dib');
imshow(i);
a=rgb2gray(i);
threshold = graythresh(a); % To compute a global threshold
BW = im2bw(a, threshold); % Converts grayscale image to Binary image
BW = ~ BW; % Inverts the image
imshow(BW)
%bw = imcontour(bw,3);
%imshow(bw)
bw=edge(BW,'sobel'); %returns a binary image BW containing 1s where it finds edges else zeros.
imshow(bw);
bw = bwareaopen(bw,30); % removes all connected components that have fewer than 30 pixels from the binary image
se = strel('disk',2); % to create a flat structuring element
bw = imclose(bw,se); % performs morphological closing on the grayscale or binary image
bw = imfill(bw,'holes'); % fills holes in the input binary image
imshow(bw);
L = bwlabel(bw); % returns the label matrix L
s  = regionprops(L, 'centroid'); %Calculate centroids for connected components in the image
dt  = regionprops(L, 'area'); % Calculate the area
cv = regionprops(L, 'perimeter'); % Calculate the perimeter
dim = size(s) %returns a row vector whose elements contain the length of the dimension of s.
BW_filled = imfill(bw,'holes');
boundaries = bwboundaries(BW_filled); %traces the exterior boundaries of objects
imshow(bw);
figure;imshow(i);
hold on;
for k=1:dim(1)
    b= boundaries{k};
    dim = size(b)
    for i=1:dim(1)
        distance{k}(1,i) = sqrt ( ( b(i,2) - s(k).Centroid(1) )^2 + ( b(i,1) - s(k).Centroid(2) )^2 )
    end 
    a=max(distance{k});
    b=min(distance{k});
    c=dt(k).Area;
    difference=a-b;
    square = c/(4*b^2)
    rectangle = c/(4*b*(a^2-b^2)^0.5)
    triangle = (c*3^0.5)/((a+b)^2)
    elipse = c/(a*b*pi)
    diamond = (c*( a^2 - b^2 )^0.5) / (2*a^2*b)
    if difference < 10
            text(s(k).Centroid(1)-20,s(k).Centroid(2),'circle')
    elseif (square < 1.05 ) & (square > 0.95 )
            text(s(k).Centroid(1)-20,s(k).Centroid(2),'square')
    elseif (elipse < 1.05 ) & (elipse > 0.95 )
            text(s(k).Centroid(1)-20,s(k).Centroid(2),'ellipse')
    elseif (diamond < 1.05 ) & (diamond > 0.95 )
            text(s(k).Centroid(1)-20,s(k).Centroid(2),'diamond')
    elseif ((rectangle <1.2) & (rectangle >0.95))
            text(s(k).Centroid(1)-20,s(k).Centroid(2),'rectangle','Color','white')
    elseif  (triangle < 1.05 ) & (triangle > 0.95 )
            text(s(k).Centroid(1)-20,s(k).Centroid(2),'triangle')
    end
end