clear all
data = xlsread('DataSheet.xlsx','United States');
%data = data(:,6:end);
global year p is res t model
year = data(1,:);
p = data(2,:);
is = data(3,:);
res = round(data(4,:));
t = length(data(1,:));


r0 = 0.4
Re = 11
Rn = 0.11
Nn  = 0.0011
init = {[r0,Re],[r0,Re],[r0,Re,Rn],[r0,Re,Rn,Nn]};
% ARmodel(init)
% Likefun(init)

modelset = 4;
modelnames = {'Original','Model 1','Model 2','Model 3'}
for model = modelset;
[fit,fvalue]= fminsearchbnd(@Likefun,init{model})
bestfit(model,:) = ARmodel(fit)
clear fit fvalue
end

model = 1
ARmodel([0.4,11])





plot(year,res./is,'-bo',year,bestfit(4,:),'k','Linewidth',2)










% Data = [0., 0., 0., 0., 0., 0.01, 0.01, 0.02, 0.05, 0.05, 0.05, 0.07, ...
%         0.1];
% Fit = [0.00551239,0.00622752,0.00755398,0.00884032, 0.011577, ...
%        0.0144709,0.0196904,0.0278052,0.0405228,0.0541579, 0.0786158, 0.113772,0.201065];

% t = 2000:2012

% close all
% fig1 = figure('Position',[100,100,1500,400])
% plot(t,Data,'o',t,Fit,'k','Linewidth',2)
% hold on
% tp = 2012:2020

% %Projections
% ProjO = [0.201065,0.253771, 0.314848, 0.383079, 0.45625, 0.531359, 0.605074, 0.674301,0.736674];
% Proj1 = [0.201065,0.253771, 0.27951, 0.302007, 0.320558, 0.334648, 0.343927, ...
%          0.348185, 0.347332];
% plot(tp,ProjO,'b-',tp,Proj1,'c-','Linewidth',2)


% ARmodel(12,3,4,1,2)
