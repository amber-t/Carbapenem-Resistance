clear all
close all
%% Loading and initializing data
load US_data
t = length(Years)
pathogen_specific_consump = ConsumptionBreakdown'*Consumption
KP(3,:) = pathogen_specific_consump(1,:);
PA(3,:) = pathogen_specific_consump(2,:);
AB(3,:) = pathogen_specific_consump(3,:);
EA(3,:) = pathogen_specific_consump(4,:);

%% Maximize the likelihood for pathogens
A = KP; % Which pathogen ?
global I R C
I = A(1,:); R = A(2,:); C = A(3,:);
out = fminsearch(@(r0,ks),compute_loglik(r0,ks,theta,C,I,R),0.01,


%% Functions
function r = resistance_frequency(t,r0,ks,theta)
    m = ks*sum(C[1:t])+theta*t;
    r = exp(m)/((1/r0)-1+exp(m));
end


function loglik = compute_loglik(r0,ks,theta)
    for i = 1:length(I)
        temp(i) = log(nchoosek(I,R))+...
                  R*resistance_frequency(t,r0,ks,theta,C)+...
                  (I-R)*resistance_frequency(t,r0,ks,theta,C);
    end
    loglik = -sum(temp);
end
