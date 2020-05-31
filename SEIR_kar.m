function [data, data2]=SEIR_kar(n,M1,T,t,R0,S,M2,M3,M4,M5)
%SEIR model with self-isolation and restrictions


segedke1=rand(1,n);
segedke2=rand(1,n);
S=2*(T<5).*(segedke1<0.05)+2*(T==5).*(segedke1<0.2)+(segedke2<0.1);



%%
maxi=size(M1);

susp=ones(1,n);
vac=zeros(2,n);
imm=zeros(1,n);
expo=zeros(1,n);
inf=zeros(2,n);
rec=zeros(1,n);
data2=zeros(5,t);
data=zeros(6,t);
car=zeros(2,n);

szigoritasok=[0,0,0,60,90];
enyhitesek=[150 0 0 110 0];

kezdinf=10;
randoms=randi(n,1,kezdinf);
for k=1:kezdinf
    inf(1,randoms(1,k))=1;
    inf(2,randoms(1,k))=5;
    susp(1,randoms(1,k))=0;
    expo(1,randoms(1,k))=1;
end
M=M1;
for iter=1:t
    
if iter==szigoritasok(2)
    M=M2;
else if iter==szigoritasok(3)
    M=M3;
else if iter==szigoritasok(4)
    M=M4;
else if iter==szigoritasok(5)
    M=M5;    
    end
    end
    end
end

if iter==enyhitesek(2)
    M=M2;
else if iter==enyhitesek(3)
    M=M3;
else if iter==enyhitesek(4)
    M=M4;
else if iter==enyhitesek(5)
    M=M5;
else if iter==enyhitesek(1)
    M=M1;
    end
    end
    end
    end
end

    for i=1:n
        if (inf(1,i)==1)&& (car(1,i)==0)
            j=1;
            while (j<=maxi(2))&&(M(i,j)~=0)
                if (rand(1)< R0/(5*12.8113)) && (susp(M(i,j))==1) && (car(1,M(i,j))==0)
                    susp(1,M(i,j))=0;
                    expo(1,M(i,j))=iter+ceil(random('exponential',5,1,1));
                end
                j=j+1;
            end
            
            %ramdom megfertõz valakit
            if rand(1)<0.05
                rf=floor(n*rand(1))+1;
                if susp(rf)==1
                    susp(rf)=0;
                    expo(rf)=iter+ceil(random('exponential',5,1,1));
                end
            end
            
            
        else if expo(1,i)==iter
                inf(1,i)=1;
                inf(2,i)=iter+round(2*rand(1)+4);
            end
        end
       
        if (inf(1,i)==1)&& (S(1,i)>0)&&(iter==expo(1,i)+2)
            car(1,i)=1;
            car(2,i)=iter+14;
            l=1;
            if S(1,i)>1
                while M(i,l)~=0
                    if (rand(1)< 0.5) && (rec(1,M(i,l))==0)
                        car(1,M(i,l))=1;
                        car(2,M(i,l))=iter+14;
                    end
                    l=l+1;
                end
            end
            
            
        end
        
        if inf(2,i)==iter
               inf(1,i)=0;
               rec(1,i)=1;
        end
    
        if car(2,i)==iter
            car(1,i)=0;
            car(2,i)=0;
        end
        
    end



% subplot(6,1,1);
% imagesc(susp);
%subplot(6,1,2);
%imagesc(expo);
%subplot(6,1,3);
%imagesc(inf(1,:));
%subplot(6,1,4);
%imagesc(rec);
%subplot(6,1,5);
%imagesc(vac(1,:));
%subplot(6,1,6);
%imagesc(imm);
%pause(0.05);

data(1,iter)=sum(susp);
data(2,iter)=sum(expo>0);
data(3,iter)=sum(inf(1,:));
data(4,iter)=sum(rec);
data(5,iter)=sum(car(1,:));
data(6,iter)=sum(inf(1,:).*(S>1));


data2(1,iter)=sum(inf(1,:).*(T==1));
data2(2,iter)=sum(inf(1,:).*(T==2));
data2(3,iter)=sum(inf(1,:).*(T==3));
data2(4,iter)=sum(inf(1,:).*(T==4));
data2(5,iter)=sum(inf(1,:).*(T==5));
end
end