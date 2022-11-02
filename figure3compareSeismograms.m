clear;
clc;
close all;

load('figure3a.mat')
% figure;plot(-seis_recordp(1:2:1250*2,250),'r','linewidth',2)
plotimage(-seis_recordp(1:1250*2,80:end-80))
xlabel('x/dx')
ylabel('Travel time/dt')
% grid on
title('')

load('figure3b.mat')
% hold on;plot(-seis_recordp(3:1250,250),'k','linewidth',2)
plotimage(-seis_recordp(1:1250,80:end-80))
xlabel('x/dx')
ylabel('Travel time/dt')
% grid on
title('')