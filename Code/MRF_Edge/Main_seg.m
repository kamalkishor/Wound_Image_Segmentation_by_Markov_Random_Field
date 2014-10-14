%**************************************************************************
%                 Kamal Kishor Sharma y10uc139
%                   LNMIIT, Jaipur.
%        Wound image segmentation by Markov Random Field
% This is main function. 2. ICM 3.Imagestack2vectors. 4. GMM_parameters. 5.
% Covariance Matrix. 6.Energy of feature field. 7.Energy of label field. 8.
% NeiX
%
%**************************************************************************
clc
clear

I=imread('foot_ulcer_0028.jpg');figure,imshow(I);
I=double(I);
class_num=3;
potential=0.5;
maxItr=20;
%figure,imshow(I);
seg=ICM(I,class_num,potential,maxItr);

%figure,imshow((I));