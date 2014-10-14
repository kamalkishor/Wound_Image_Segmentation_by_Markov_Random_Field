clc;
clear all;
src=double(imread('original.jpg'));
figure, imshow(imread('original.jpg'));
 covar=100;
d=blur_image(src, covar);
figure, imshow(uint8(d));