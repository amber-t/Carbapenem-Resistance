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





% Data;
D = [0., 0., 0., 0., 0., 0.01, 0.01, 0.02, 0.05, 0.05, 0.05, 0.07, ...
     0.1; 0.13, 0.16, 0.18, 0.19, 0.2, 0.17, 0.18, 0.17, 0.18, 0.17, ...
     0.2, 0.19, 0.25; 0.09, 0.14, 0.2, 0.18, 0.18, 0.23, 0.21, 0.35, ...
     0.39, 0.5, 0.44, 0.37, 0.43];
% Fit
F = [0.00251598, 0.00319394, 0.004264, 0.00573169, 0.00786866, ...
     0.0111078,0.0162281, 0.0239894, 0.0363311, 0.0558016, ...
     0.0853531,0.13088, 0.196644;0.166277, 0.168367, 0.170929, ...
     0.173587,0.176475, 0.179669, 0.183247,0.187019, 0.191132, ...
     0.195528,0.200072, 0.204917, 0.209925;0.146049, ...
     0.16125, 0.18136, 0.203944, 0.230436, 0.261981, 0.29989,0.342346, ...
     0.390857, 0.44425, 0.499848, 0.558075, 0.615586];
% Projections
SQ = [0.196644,0.28463,0.392739,0.512493,0.630829,0.735279,0.818671,0.880077,0.922653;0.209925, 0.215021, 0.220207, 0.225482, 0.230846, ...
0.236298, 0.241839, 0.247468, 0.253184;0.615586,0.670038, 0.720282, ...
0.765553, 0.805475, 0.84002, 0.869424,0.894106,0.91458]

I = [0.196644, 0.28463, 0.37648, 0.461046, 0.530847, 0.582858, ...
     0.616989,0.634217, 0.635343;0.209925, 0.215021, 0.219468, ...
     0.223233,0.226288,0.228613,0.23019, 0.231008, 0.231062; ...
     0.615586,0.670038, 0.713465, 0.746985, 0.771946, 0.789593, ...
     0.800916, 0.806589,0.806959];
%Years
Yo = 2000:1:2012;
Yp = 2012:1:2020;

% Plot
pathogens = {'Klebsiella pneumoniae','Pseudomonas aeruginosa', ...
             'Acinetobacter baumanni'}
close all
figure('units','normalized','outerposition',[0 0 1 1])
for i = 1:3
    subplot(3,1,i)
    plot(Yo,D(i,:),'k.',Yo,F(i,:),'b',Yp,SQ(i,:),'b--',Yp,I(i,:), ...
         'c','LineWidth',1.5,'MarkerSize',20)
    box('off')
    title(pathogens(i),'FontSize',16,'FontWeight','Normal');
    if i == 1
        h = legend('Resistance frequency','Model fit',['Status ' ...
                            'Quo'],'Intervention','Location','northwest')
        set(h,'FontSize',16)
        legend('boxoff')
    end
end
[ax1,h1]=suplabel('Time (in years)');
[ax2,h2]=suplabel('Frequency of carbapenem resistance','y');
 % [ax3,h2]=suplabel('super Y label (right)','yy');
[ax4,h3]=suplabel('United States'  ,'t');
set(h1,'FontSize',20)
set(h2,'FontSize',20)
set(h3,'FontSize',30,'FontWeight','Normal')






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
