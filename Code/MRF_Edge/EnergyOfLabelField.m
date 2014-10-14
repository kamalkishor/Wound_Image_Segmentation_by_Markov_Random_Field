function [E]=EnergyOfLabelField(segmentation,potential,width,height,class_num)
n=size(segmentation,1);
segmentation=reshape(segmentation,[width height]);
%figure,imshow(segmentation);

pplu=NeiX(segmentation); 
figure,imshow(pplu);
Nei8=imstack2vectors(pplu); 
%figure,imshow(Nei8);
E=zeros(n,class_num);
for i=1:class_num
    E(:,i)=sum(Nei8~=i,2);
    %figure,imshow(E);
end
E=E*potential; 
end