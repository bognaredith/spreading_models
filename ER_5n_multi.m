function [M1,T,d,M2,M3,M4,M5,d2,d3,d4,d5,S]=ER_5n_multi(n)
%SBM graph of n node with given C contact matrix, and b age group distribution
%Input: n number of nodes

b=[110 120 290 320 160];
a=round(b.*round(n/1000,1));

C=[5.3580 1.0865 3.0404 2.4847 0.8150;
    0.9507 10.2827 2.8148 3.6215 0.7752;
    1.1201 1.1852 6.5220 4.1938 0.9016;
    0.8027 1.3372 3.6776 5.2632 1.3977;
    0.5187 0.5638 1.5573 2.7531 2.0742];
matrix=[a;a;a;a;a]-eye(5);
P=C./matrix;

M1=zeros(n,500);
T0=[1*ones(1,a(1)), 2*ones(1,a(2)), 3*ones(1,a(3)), 4*ones(1,a(4)),5*ones(1,a(5))];
T=T0(randperm(n));

segedke=rand(1,n);
S=(T<4).*(segedke<0.1)+(T>3).*(segedke<0.3);


d=zeros(6,n);
M2=zeros(n,500);
M3=zeros(n,500);
M4=zeros(n,500);
M5=zeros(n,500);

d2=zeros(6,n);
d3=zeros(6,n);
d4=zeros(6,n);
d5=zeros(6,n);

K2=[0.2 1 1 1 1;
    1 0.2 1 1 1;
    1 1 1 1 1;
    1 1 1 1 1;
    1 1 1 1 1];
K3=[1 1 1 1 1;
    1 1 1 1 1;
    1 1 0.4 0.4 1;
    1 1 0.4 0.4 1;
    1 1 1 1 1];
K4=0.8*[0.2 1 1 1 1;
    1 0.2 1 1 1;
    1 1 0.4 0.4 1;
    1 1 0.4 0.4 1;
    1 1 1 1 1];
K5=0.6*[0.2 1 1 1 1;
    1 0.2 1 1 1;
    1 1 0.4 0.4 1;
    1 1 0.4 0.4 1;
    1 1 1 1 1];


for i=1:n
    for j=(i+1):n
        if rand(1)<P(T(i),T(j))
            M1(i,(d(6,i)+1))=j;
            M1(j,(d(6,j)+1))=i;
            d(6,i)=d(6,i)+1;
            d(6,j)=d(6,j)+1;
            d(T(j),i)=d(T(j),i)+1;
            d(T(i),j)=d(T(i),j)+1;
            
  
            seged1=rand(1);
            
            if seged1< K2(T(i),T(j))
                M2(i,(d2(6,i)+1))=j;
                M2(j,(d2(6,j)+1))=i;
                d2(6,i)=d2(6,i)+1;
                d2(6,j)=d2(6,j)+1;
                d2(T(j),i)=d2(T(j),i)+1;
                d2(T(i),j)=d2(T(i),j)+1;
            end
            
            if seged1< K3(T(i),T(j))
                M3(i,(d3(6,i)+1))=j;
                M3(j,(d3(6,j)+1))=i;
                d3(6,i)=d3(6,i)+1;
                d3(6,j)=d3(6,j)+1;
                d3(T(j),i)=d3(T(j),i)+1;
                d3(T(i),j)=d3(T(i),j)+1;
            end
            
            if seged1< K4(T(i),T(j))
                M4(i,(d4(6,i)+1))=j;
                M4(j,(d4(6,j)+1))=i;
                d4(6,i)=d4(6,i)+1;
                d4(6,j)=d4(6,j)+1;
                d4(T(j),i)=d4(T(j),i)+1;
                d4(T(i),j)=d4(T(i),j)+1;
                
                if seged1< K5(T(i),T(j))
                M5(i,(d5(6,i)+1))=j;
                M5(j,(d5(6,j)+1))=i;
                d5(6,i)=d5(6,i)+1;
                d5(6,j)=d5(6,j)+1;
                d5(T(j),i)=d5(T(j),i)+1;
                d5(T(i),j)=d5(T(i),j)+1;
               
                end
                
                
                
            end
            
            
        end
    end
end


end
