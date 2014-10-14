function XN=NeiX(X)
[s,t,K]=size(X);
 Xu1=zeros(s,t,K);
 Xu1(2:s,2:t,:)=X(1:s-1,1:t-1,:); %d-down, 1-left, r-right, u-up
%Neix Function assign the potential of a clique being well classified depending on its neighbors.

%Xu, Xur, Xr, Xdr, Xd Xd1 and X1 store the neighbors labels. 
Xu=zeros(s,t,K);
Xu(2:s,:,:)=X(1:s-1,:,:);

Xur=zeros(s,t,K);
Xur(2:s,1:t-1,:)=X(1:s-1,2:t,:);

Xr=zeros(s,t,K);
Xr(:,1:t-1,:)=X(:,2:t,:);

Xdr=zeros(s,t,K);
Xdr(1:s-1,1:t-1,:)=X(2:s,2:t,:);

Xd=zeros(s,t,K);
Xd(1:s-1,:,:)=X(2:s,:,:);

Xd1=zeros(s,t,K);
Xd1(1:s-1,2:t,:)=X(2:s,1:t-1,:);

X1=zeros(s,t,K);
X1(:,2:t,:)=X(:,1:t-1,:);
XN=sum(cat(3,Xu1==X,Xu==X,Xur==X,Xr==X,Xdr==X,Xd==X,Xd1==X,X1==X),3)/8; 
%figure,imshow(XN);
end