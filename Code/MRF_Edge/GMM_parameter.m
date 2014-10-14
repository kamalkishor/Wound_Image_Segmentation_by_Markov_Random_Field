function[mu,sigma]=GMM_parameter(image,segmentation,class_num)
[n,d]=size(image);
mu=zeros(class_num,d);
sigma=zeros(d,d,class_num);
   for i=1:class_num
       Im_i=image(segmentation==i,:);
       [sigma(:,:,i),mu(i,:)]=covmatrix(Im_i);
    end
end