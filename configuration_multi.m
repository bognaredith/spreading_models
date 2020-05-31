function [M1, T,aktd,M2,M3,M4,M5,d2,d3,d4,d5,S]=configuration_multi(n,d)

%%configuration model for age-grouped nodes

b=[110 120 290 320 160];
a=round(b.*round(n/1000,1));
hat=[0, cumsum(a)];
T=[repmat(1,1,a(1)),repmat(2,1,a(2)),repmat(3,1,a(3)),repmat(4,1,a(4)),repmat(5,1,a(5))];
aktd=zeros(6,n);
M1=zeros(n,500);

M2=zeros(n,500);
M3=zeros(n,500);
M4=zeros(n,500);
M5=zeros(n,500);

d2=zeros(6,n);
d3=zeros(6,n);
d4=zeros(6,n);
d5=zeros(6,n);


%gráfcsökkentések
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
%ha ugyanaz a típus mindkét csúcs:
segedke1=rand(1,n);
segedke2=rand(1,n);
S=2*(T<5).*(segedke1<0.05)+2*(T==5).*(segedke1<0.2)+(segedke2<0.1);



for i=1:5
    seged=zeros(0);
    for k=(hat(i)+1):hat(i+1)
        seged=[seged, repmat(k,1,d(i,k))];
    end
    seged=seged(randperm(length(seged)));
    for szaml=1:2:(length(seged)-1)
        aktd(i,seged(szaml))=aktd(i,seged(szaml))+1;
        aktd(i,seged(szaml+1))=aktd(i,seged(szaml+1))+1;
        aktd(6,seged(szaml))=aktd(6,seged(szaml))+1;
        aktd(6,seged(szaml+1))=aktd(6,seged(szaml+1))+1;
        M1(seged(szaml),aktd(6,seged(szaml)))=seged(szaml+1);
        M1(seged(szaml+1),aktd(6,seged(szaml+1)))=seged(szaml);
       
        segedke=rand(1);
            
            if segedke< K2(i,i)
            d2(i,seged(szaml))=d2(i,seged(szaml))+1;
            d2(i,seged(szaml+1))=d2(i,seged(szaml+1))+1;
            d2(6,seged(szaml))=d2(6,seged(szaml))+1;
            d2(6,seged(szaml+1))=d2(6,seged(szaml+1))+1;
            M2(seged(szaml),d2(6,seged(szaml)))=seged(szaml+1);
            M2(seged(szaml+1),d2(6,seged(szaml+1)))=seged(szaml);
            end
            
            if segedke< K3(i,i)
            d3(i,seged(szaml))=d3(i,seged(szaml))+1;
            d3(i,seged(szaml+1))=d3(i,seged(szaml+1))+1;
            d3(6,seged(szaml))=d3(6,seged(szaml))+1;
            d3(6,seged(szaml+1))=d3(6,seged(szaml+1))+1;
            M3(seged(szaml),d3(6,seged(szaml)))=seged(szaml+1);
            M3(seged(szaml+1),d3(6,seged(szaml+1)))=seged(szaml);
            end
            
            
            if segedke< K4(i,i)
            d4(i,seged(szaml))=d4(i,seged(szaml))+1;
            d4(i,seged(szaml+1))=d4(i,seged(szaml+1))+1;
            d4(6,seged(szaml))=d4(6,seged(szaml))+1;
            d4(6,seged(szaml+1))=d4(6,seged(szaml+1))+1;
            M4(seged(szaml),d4(6,seged(szaml)))=seged(szaml+1);
            M4(seged(szaml+1),d4(6,seged(szaml+1)))=seged(szaml);
            
            
                if segedke< K5(i,i)
                d5(i,seged(szaml))=d5(i,seged(szaml))+1;
                d5(i,seged(szaml+1))=d5(i,seged(szaml+1))+1;
                d5(6,seged(szaml))=d5(6,seged(szaml))+1;
                d5(6,seged(szaml+1))=d5(6,seged(szaml+1))+1;
                M5(seged(szaml),d5(6,seged(szaml)))=seged(szaml+1);
                M5(seged(szaml+1),d5(6,seged(szaml+1)))=seged(szaml);
                end
            
            
            
            end
        
        
    end
            
end
%ha más típus

for i=1:5
    for j=(i+1):5
        seged1=zeros(0);
        seged2=zeros(0);
        for k=(hat(i)+1):hat(i+1)
            seged1=[seged1, repmat(k,1,d(j,k))];
        end
        
        for k=(hat(j)+1):hat(j+1)
            seged2=[seged2, repmat(k,1,d(i,k))];
        end
        
        seged1=seged1(randperm(length(seged1)));
        %seged2=seged2(randperm(length(seged2))); elég egyszer megkeverni
    
        for m=1:length(seged1)
            aktd(j,seged1(m))=aktd(j,seged1(m))+1;
            aktd(6,seged1(m))=aktd(6,seged1(m))+1;
            M1(seged1(m),aktd(6,seged1(m)))=seged2(m);
            
            aktd(i,seged2(m))=aktd(i,seged2(m))+1;
            aktd(6,seged2(m))=aktd(6,seged2(m))+1;
            M1(seged2(m),aktd(6,seged2(m)))=seged1(m);
            
            
            segedke=rand(1);
             if segedke<K2(i,j)
                d2(j,seged1(m))=d2(j,seged1(m))+1;
                d2(6,seged1(m))=d2(6,seged1(m))+1;
                M2(seged1(m),d2(6,seged1(m)))=seged2(m);
            
                d2(i,seged2(m))=d2(i,seged2(m))+1;
                d2(6,seged2(m))=d2(6,seged2(m))+1;
                M2(seged2(m),d2(6,seged2(m)))=seged1(m);
                 
             end
             
             if segedke<K3(i,j)
                d3(j,seged1(m))=d3(j,seged1(m))+1;
                d3(6,seged1(m))=d3(6,seged1(m))+1;
                M3(seged1(m),d3(6,seged1(m)))=seged2(m);
            
                d3(i,seged2(m))=d3(i,seged2(m))+1;
                d3(6,seged2(m))=d3(6,seged2(m))+1;
                M3(seged2(m),d3(6,seged2(m)))=seged1(m);
                 
             end
             
             if segedke<K4(i,j)
                d4(j,seged1(m))=d4(j,seged1(m))+1;
                d4(6,seged1(m))=d4(6,seged1(m))+1;
                M4(seged1(m),d4(6,seged1(m)))=seged2(m);
            
                d4(i,seged2(m))=d4(i,seged2(m))+1;
                d4(6,seged2(m))=d4(6,seged2(m))+1;
                M4(seged2(m),d4(6,seged2(m)))=seged1(m);
                
                if segedke<K5(i,j)
                d5(j,seged1(m))=d5(j,seged1(m))+1;
                d5(6,seged1(m))=d5(6,seged1(m))+1;
                M5(seged1(m),d5(6,seged1(m)))=seged2(m);
            
                d5(i,seged2(m))=d5(i,seged2(m))+1;
                d5(6,seged2(m))=d5(6,seged2(m))+1;
                M5(seged2(m),d5(6,seged2(m)))=seged1(m);
                 
                end
                
                
                 
             end
            
            
            
        end
            
    end
end

end