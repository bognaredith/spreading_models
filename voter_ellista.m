function [osszeg,L1,z]=voter_ellista(t,n,M,d,L0)

L1=L0;
osszeg=zeros(1,t);

c=2;
z=1;
while (z<t+1) && (sum(L1)>0)
    meggyoz=zeros(2,n);
    for i=1:n
       j=1;
       while M(i,j)~=0
           if rand(1)<exp(-c)
                meggyoz(L1(i)+1,M(i,j))=meggyoz(L1(i)+1,M(i,j))+1;
           end
       j=j+1;
       end
       
%        sz=1;
%        while SZ(i,sz)~=0
%            if rand(1)<exp(-c*2)
%                meggyoz(L1(i)+1,SZ(i,sz))=meggyoz(L1(i)+1,SZ(i,sz))+1;
%            end
%            sz=sz+1;
%        end  

    end
    
    for i=1:n
        if (meggyoz(1,i)+meggyoz(2,i))~=0
            if rand(1)< (meggyoz(1,i))/(meggyoz(1,i)+meggyoz(2,i))
                L1(i)=0;
            else
                L1(i)=1;
            end
        end
    end
osszeg(1,z)=sum(L1);    
z=z+1;
end



end