clear all
close all
%% Loading and initializing data
load US_data
t = length(Years)
pathogen_specific_consump = ConsumptionBreakdown'*Consumption;
KP(3,:) = pathogen_specific_consump(1,:);
PA(3,:) = pathogen_specific_consump(2,:);
AB(3,:) = pathogen_specific_consump(3,:);
EA(3,:) = pathogen_specific_consump(4,:);

%% Maximize the likelihood for pathogens
A = KP; % Which pathogen ?
global I R C
I = A(1,:); R = A(2,:); C = A(3,:); theta = -0.1;;
out = fminsearch(compute_loglik,0.01,2)


%% Functions
function r = resistance_frequency(t,r0,ks)
    global I R C
    m = ks*sum(C(1:t))+theta*t;
    r = exp(m)/((1/r0)-1+exp(m));
end


function loglik = compute_loglik(r0,ks)
    global I R C
    for t = 1:length(I)
        temp(t) = log(nchoosek(I(t),round(R(t))))+...
                  R*resistance_frequency(t,r0,ks)+...
                  (I-R)*resistance_frequency(t,r0,ks);
    end
    loglik = -sum(temp);
end
