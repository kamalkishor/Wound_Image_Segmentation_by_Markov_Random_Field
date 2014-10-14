%**************************************************************************
%                 Kamal Kishor Sharma y10uc139
%        Wound image segmentation by Markov Random Field
%**************************************************************************

clear all;
close all;
clc;

RGB = imread('haemangioma_1_4.jpg');

f1 = figure(); imshow(RGB);

[r c z] = size(RGB);
 RGB = RGB(floor(r*0.2):r,:,:);
 [r c z] = size(RGB);%f2 = figure(); imshow(RGB);
I = zeros(r,c);

for i=1:r
    for j=1:c
        if((RGB(i,j,1)>0 && RGB(i,j,1)<250)&&(RGB(i,j,2)>30 && RGB(i,j,2)<150)&&(RGB(i,j,3)>20 && RGB(i,j,3)<80))
             I(i,j)=1;
        end
    end
end
f2 = figure(); imshow(I);
bw = imfill(I,'holes');

f3 = figure(); imshow(bw);
se = strel('rectangle',[3,3]);
se1 = strel('rectangle',[10,5]);
bw = imopen(bw,se);
bw = imdilate(bw,se1);
f4 = figure(); imshow(bw);

 %preprocessing is over now , now extracting the segments 
 
 [r c] = size(bw);