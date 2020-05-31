function [d,F,F2]=fokszamok_confi(n,alpha)
%crates 5 degrees for a node corresponding to edges in age groups
b=[110 120 290 320 160];
a=round(b.*round(n/1000,1));
kum=[1, cumsum(a)+1];
C=[5.3580 1.0865 3.0404 2.4847 0.8150;
    0.9507 10.2827 2.8148 3.6215 0.7752;
    1.1201 1.1852 6.5220 4.1938 0.9016;
    0.8027 1.3372 3.6776 5.2632 1.3977;
    0.5187 0.5638 1.5573 2.7531 2.0742];
T0=[1*ones(1,a(1)), 2*ones(1,a(2)), 3*ones(1,a(3)), 4*ones(1,a(4)),5*ones(1,a(5))];


d=zeros(6,n);
d(1,:)=[random('Generalized Pareto',1/alpha, (alpha-1)/alpha*5.3580/alpha, (alpha-1)/alpha*5.3580,1,a(1)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*0.9507/alpha, (alpha-1)/alpha*0.9507,1,a(2)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*1.1201/alpha, (alpha-1)/alpha*1.1201,1,a(3)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*0.8027/alpha, (alpha-1)/alpha*0.8027,1,a(4)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*0.5187/alpha, (alpha-1)/alpha*0.5187,1,a(5))];
d(2,:)=[random('Generalized Pareto',1/alpha, (alpha-1)/alpha*1.0865/alpha, (alpha-1)/alpha*1.0865,1,a(1)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*10.2827/alpha, (alpha-1)/alpha*10.2827,1,a(2)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*1.1852/alpha, (alpha-1)/alpha*1.1852,1,a(3)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*1.3372/alpha, (alpha-1)/alpha*1.3372,1,a(4)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*0.5638/alpha, (alpha-1)/alpha*0.5638,1,a(5))];
d(3,:)=[random('Generalized Pareto',1/alpha, (alpha-1)/alpha*3.0404/alpha, (alpha-1)/alpha*3.0404,1,a(1)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*2.8148/alpha, (alpha-1)/alpha*2.8148,1,a(2)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*6.5220/alpha, (alpha-1)/alpha*6.5220,1,a(3)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*3.6776/alpha, (alpha-1)/alpha*3.6776,1,a(4)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*1.5573/alpha, (alpha-1)/alpha*1.5573,1,a(5))];
d(4,:)=[random('Generalized Pareto',1/alpha, (alpha-1)/alpha*2.4847/alpha, (alpha-1)/alpha*2.4847,1,a(1)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*3.6215/alpha, (alpha-1)/alpha*3.6215,1,a(2)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*4.1938/alpha, (alpha-1)/alpha*4.1938,1,a(3)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*5.2632/alpha, (alpha-1)/alpha*5.2632,1,a(4)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*2.7531/alpha, (alpha-1)/alpha*2.7531,1,a(5))];
d(5,:)=[random('Generalized Pareto',1/alpha, (alpha-1)/alpha*0.8150/alpha, (alpha-1)/alpha*0.8150,1,a(1)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*0.7752/alpha, (alpha-1)/alpha*0.7752,1,a(2)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*0.9016/alpha, (alpha-1)/alpha*0.9016,1,a(3)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*1.3977/alpha, (alpha-1)/alpha*1.3977,1,a(4)),random('Generalized Pareto',1/alpha, (alpha-1)/alpha*2.0742/alpha, (alpha-1)/alpha*2.0742,1,a(5))];
d=round(d);

d(6,:)=sum(d);


O=[ sum(d(1:5,kum(1):kum(2)-1)')',sum(d(1:5,kum(2):kum(3)-1)')',sum(d(1:5,kum(3):kum(4)-1)')',sum(d(1:5,kum(4):kum(5)-1)')',sum(d(1:5,kum(5):kum(6)-1)')'];

U=[ mean(d(1:5,kum(1):kum(2)-1)')',mean(d(1:5,kum(2):kum(3)-1)')',mean(d(1:5,kum(3):kum(4)-1)')',mean(d(1:5,kum(4):kum(5)-1)')',mean(d(1:5,kum(5):kum(6)-1)')'];

F=zeros(5,5);

for i=1:5
    for j=1:5
        F(i,j)=sum(d(i,kum(j):kum(j+1)-1));
    end
end

for i=1:5
    for j=(i+1):5
        kul=F(i,j)-F(j,i);
        if kul>0
            while kul>0
                d(j,kum(i+1)-1-kul)=d(j,kum(i+1)-1-kul)+1;
                kul=kul-1;
            end
        else kul=-kul;
            while kul>0
                d(i,kum(j+1)-1-kul)=d(i,kum(j+1)-1-kul)+1;
                kul=kul-1;
            
        end
        
    end
end

end

F2=zeros(5,5);

for i=1:5
    for j=1:5
        F2(i,j)=sum(d(i,kum(j):kum(j+1)-1));
    end
end
d(6,:)=sum(d(1:5,:));
end