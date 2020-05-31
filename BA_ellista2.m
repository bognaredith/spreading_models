function [M SZ d S]=BA_ellista2(n,m)
%%BA(n,m) gráf éllistás ábrázolásban
%minden lépésben várható értékben! m db élet veszünk hozzá pref.
%csatlakozásnak megfelelõen
%2 távolságra lévõ szomszédait is visszaadja

%összes él: n*(n-1)/2
%3db él: 3*n

indit=100;
[M1 SZ1 d1 S1]=ER_ellista2(indit,m/(indit-1));

S=zeros(n,500);
M=zeros(n,500);
SZ=sparse(n,n);
d=zeros(2,n);
M(1:indit,1:100)=M1;
S(1:indit,1:100)=S1;
d(1,1:indit)=d1(1,:);
seged=sparse(n,n);

for i=indit+1:n
    D=sum(d(1,:));
    for j=1:(i-1)
        if rand(1)<m*d(1,j)/D
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