function [M, SZ,d S]=ER_ellista2(n,p)
%%ER(p) gráf éllistás ábrázolásban
%2 távolságra lévõ szomszédait is visszaadja

S=zeros(n,100);
M=zeros(n,100);
SZ=zeros(n,2000);
d=zeros(2,n);
seged=sparse(n,n);

for i=1:n
    for j=(i+1):n
        if rand(1)<p
            d(1,i)=d(1,i)+1;
            d(1,j)=d(1,j)+1;
            M(i,d(1,i))=j;
            M(j,d(1,j))=i;
            seged(i,j)=1;
            seged(j,i)=1;
            
            segedke=rand(1);
            w=(segedke< 0.2)*2+(segedke>0.2)*0.75;
            S(i,(d(1,i)))=w;
            S(j,(d(1,j)))=w;
        end
    end
end

% for i=1:n
%     szomsz=sparse(1,n);
%     for k=1:d(1,i)
%         szomsz=szomsz+seged(M(i,k),:);
%     end
%     szomsz=(szomsz>0);
%     szomsz=szomsz-seged(i,:);
%     szomsz(1,i)=0;
%     d(2,i)=sum(szomsz>0);
%     szel=(1:n).*szomsz;
%     szel=sort(szel,'descend');
%     SZ(i,1:(d(2,i)+1))=szel(:,1:(d(2,i)+1));
% end
end
    
        
