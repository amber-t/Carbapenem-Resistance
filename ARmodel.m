function[out] = ARmodel(x)
global year p is res t model

switch model
    case 1
      % Original Model
      vals = num2cell(x);
      [r0,a] = deal(vals{:});
      for i = 1:t
          m(i) = a*i;
          r(i) = exp(m(i)*i)/((1/r0)-1+exp(m(i)*i));
      end
  case 2
    % Model 1
    vals = num2cell(x);
    [r0,a] = deal(vals{:});
    for i = 1:t
        m(i) = a*p(i)*i;
        r(i) = exp(m(i)*i)/((1/r0)-1+exp(m(i)*i));
    end
  case 3
    % Model 2
    vals = num2cell(x);
    [r0,a,b] = deal(vals{:});
    for i = 1:t
        m(i) = (a*p(i)-b*(1-p(i)))*i;
        r(i) = exp(m(i)*i)/((1/r0)-1+exp(m(i)*i));
    end
  case 4
    %Model 3
    vals = num2cell(x);
    [r0,Re,Rn,Nn] = deal(vals{:});
    m(1) = (p(1)*r0*Re + (1-p(1))*r0*Rn)-((1-p(1))*(1-r0)*Nn);
    r(1) = exp(m(1))/((1/r0)-1+exp(m(1)));
    for i = 2:t
        m(i) = (p(i)*r(i-1)*Re + (1-p(i))*r(i-1)*Rn)-((1-p(i))*(1-r(i- ...
                                                          1))*Nn);
        r(i) = exp(m(i)*i)/((1/r0)-1+exp(m(i)*i));
    end
end

out = r;
