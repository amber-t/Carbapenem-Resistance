function[out] = Likefun(x)
global year p is res t

r0 = x(1);
Re = x(2);
Rn = x(3);
Nn  = x(4);
r = ARmodel(r0,Re,Rn,Nn);
rf = res./is;
out = sum(log10(r)-log10(rf)).^2;

% for i = 1:length(r)
%     % temp(i) =
%     % log(nchoosek(is(i),res(i)))+res(i)*log(r(i))+(is(i)-res(i))*log(1-r(i));
%     temp(i) = -is(i)*r(i)+res(i)*log(r(i))-log(factorial(res(i)));
% end
% out = -prod(temp)
% %out = prod(temp)
