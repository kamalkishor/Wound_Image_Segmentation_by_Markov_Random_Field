function [E]=EnergyOfFeatureField(image,mu,sigma,class_num)
n=size(image,1);
E=zeros(n,class_num);
for i=1:class_num
    mu_i=mu(i,:);
    sigma_i=sigma(:,:,i);
    diff_i=image-repmat(mu_i,[n,1]);%creates a large matrix B consisting of an m-by-n tiling of copies of A. The size of B is [size(A,1)*m, (size(A,2)*n].
    %The statement repmat(A,n) creates an n-by-n tiling.
    
    %figure,imshow(diff_i);
    E(:,i)=sum(diff_i*inv(sigma_i).*diff_i,2)+log(det(sigma_i));
end
end