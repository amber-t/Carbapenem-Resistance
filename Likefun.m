function[out] = Likefun(r0,Re,Rn,Nn)
global year p is res t

r = ARmodel(r0,Re,Rn,Nn);



for i = 1:length(r)
    temp(i) = log(nchoosek(is(i),res(i)))+res(i)*log(r(i))+(is(i)- ...
                                                      res(i))*log(1-r(i));
end
out = temp
%out = prod(temp)
