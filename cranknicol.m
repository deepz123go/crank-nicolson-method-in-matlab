clear all;
close all;
clc;
a= input('diffusivity');
b= input('enter boundary');
T= zeros(100,100);
k=zeros(1,98);
m=zeros(98,98);
m1=zeros(98,98);
for c=1:2                                                   %time iteration
for i= 1:100
    for j= 1:100                                  
        if i==1 || j==1 || i==100 || j==100  
           T(i,j)=b;
        end
    end
end
A=(a)/2;
B=1+(2*A);
for r=2:99
    for i=1:98
         k1=-T(r,i+1)-(A*(T(r+1,i+1)-(2*T(r,i+1))+T(r-1,i+1)));
        if i+1==2
            k2=k1-(A*T(r,i));
        elseif i+1==99
               k2=k1-(A*T(r,i+2));
        else
              k2=k1;
        end
        k(1,i)=k2;
        m(98,98)=-B;
        for j=1:97
            if i==j
               m(j,j)=-B;
               m(i+1,j)=A;
               m(i,j+1)=A;
            end
        end 
    end
    m1=inv(m);
    x=reshape(k,98,1);
    x1=m1*x;
    for p=2:99
        T(r,p)=x1(p-1,1);
    end 
end
for r=2:99
    for i=1:98
         k1=-T(i+1,r)-(A*(T(i+1,r+1)-(2*T(i+1,r))+T(i+1,r-1)));
        if i+1==2
            k2=k1-(A*T(i,r));
        elseif i+1==99
               k2=k1-(A*T(i+2,r));
        else
              k2=k1;
        end
        k(1,i)=k2;
        m(98,98)=-B;
        for j=1:97
            if i==j
               m(j,j)=-B;
               m(i+1,j)=A;
               m(i,j+1)=A;
            end
        end 
    end
    m1=inv(m);
    x=reshape(k,98,1);
    x1=m1*x;
    for p=2:99
        T(p,r)=x1(p-1,1);
    end 
end
end
T

    
    