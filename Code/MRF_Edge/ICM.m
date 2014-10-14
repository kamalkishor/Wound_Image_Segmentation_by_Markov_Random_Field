function segmentation=ICM(image,class_num,potential,maxItr)
[width,height,bands]=size(image);
 image=imstack2vectors(image);
 %figure,imshow(image);
 [segmentation,c]=kmeans(image,class_num); %http://www.mathworks.in/help/toolbox/stats/kmeans.html
% segmentation=reshape(id,[width height]);
%figure,imshow(segmentation);
 clear c;
 iter=0;
 while(iter<maxItr)
     [mu,sigma]=GMM_parameter(image,segmentation,class_num);
    Ef=EnergyOfFeatureField(image,mu,sigma,class_num);
   %figure,imshow(Ef);
    E1=EnergyOfLabelField(segmentation,potential,width,height,class_num);
      E=Ef+E1;
    
    [tm,segmentation]=min(E,[],2);
    iter=iter+1;
 end
 %figure,imshow(segmentation);
 segmentation=reshape(segmentation,[width height]);
 figure,imshow(segmentation);
end