function[out] = Likefun(x)
global year p is res t model

r = ARmodel(x);
rf = res./is;
out = sum(r-rf).^2;

% for i = 1:length(r)
%     %    Binomial
%     temp(i) =    log(nchoosek(is(i),res(i)))+res(i)*log(r(i))+(is(i)-res(i))*log(1-r(i));
%     %    Poisson
%     %temp(i) = -is(i)*r(i)+res(i)*log(r(i))-log(factorial(res(i)));
% end
% out = -sum(temp)
