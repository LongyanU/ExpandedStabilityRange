clear;
clc
close all

global v ratio M h tau



h=15;
tau=0.004;
M=3;

ratio=0.8;

x0=0.001*ones(1,M+2);%系数的初值是0

options = optimset('Algorithm','levenberg-marquardt','TolFun',10^-10,'TolX',10^-10,'MaxFunEvals',2000,'MaxIter',200);
ii=1;

aa=-2*ones(1,M+1);
bb=2*ones(1,M+1);

x0=0.1*ones(1,M+2);%系数的初值是0

options = optimset('Algorithm','levenberg-marquardt','TolFun',10^-10,'TolX',10^-10,'MaxFunEvals',2000,'MaxIter',200);
aa=-2*ones(1,M+1);
bb=2*ones(1,M+1);

ii=1;
for v=10:10:4790

    r=v*tau/h
    [x,resnorm] = lsqnonlin(@myfun2,x0,[],[],options);   % Invoke optimizer
    
    temp=0;
    for i=1:M
        temp=temp+2*x(i)*(-1)^(i-1);
    end
    
    temp=temp-4*x(M+1); %%%%%%%%%%%%%%%%
    temp=(1-4*x(M+2))/temp;
    
    r1(ii)=r;
    s2(ii)=sqrt(temp);
    ii=ii+1;
    
end

figure;
hold on;plot(r1,real(s2),'b','linewidth',2);
hold on;plot(r1,r1,'r','linewidth',2);


% legend('previous implicit FD scheme', 'implicit-explicit FD scheme','r')
xlabel('r')
ylabel('Stability')
% grid on


axis([0 1.27 0 1.6])
box on
grid on
legend( 's','r')
save Stability.mat