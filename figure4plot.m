
clear;
clc
close all;

load('figure4a.mat')
plotimage(-Seismic_Vx(:,45:end-45));
title('')
xlabel('x/dx')
ylabel('travel time/dt')

load('figure4b.mat')
plotimage(-Seismic_Vx(:,45:end-45));
title('')
xlabel('x/dx')
ylabel('travel time/dt')