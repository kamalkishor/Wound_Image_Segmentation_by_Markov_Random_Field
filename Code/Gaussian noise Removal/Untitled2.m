clc;
clear all;
src=double(imread('leg_ulcers_0017.jpg'));
figure, imshow(imread('leg_ulcers_0017.jpg'));
 covar=100;
d=blur_image(src, covar);
figure, imshow(uint8(d));