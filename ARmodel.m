function[out] = ARmodel(r0,Re,Rn,Nn)
global year p is res t
m(1) = (p(1)*r0*Re + (1-p(1))*r0*Rn)-((1-p(1))*(1-r0)*Nn);
r(1) = exp(m(1))/((1/r0)-1+exp(m(1)));


for i = 2:t
    m(i) = (p(i)*r(i-1)*Re + (1-p(i))*r(i-1)*Rn)-((1-p(i))*(1-r(i- ...
                                                      1))*Nn);
    r(i) = exp(m(i)*i)/((1/r0)-1+exp(m(i)*i));
end

out = [r0,r];
