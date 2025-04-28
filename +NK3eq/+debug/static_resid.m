function [lhs, rhs] = static_resid(y, x, params)
T = NaN(0, 1);
lhs = NaN(6, 1);
rhs = NaN(6, 1);
lhs(1) = y(1);
rhs(1) = y(1)-1/params(2)*(y(3)-y(2))+y(4);
lhs(2) = y(2);
rhs(2) = y(2)*params(1)+y(1)*(1-params(7))*(1-params(1)*params(7))/params(7)*(params(2)+params(3))+y(5);
lhs(3) = y(3);
rhs(3) = y(3)*params(4)+(1-params(4))*(y(2)*params(5)+y(1)*params(6))+y(6);
lhs(4) = y(4);
rhs(4) = y(4)*params(8)+x(1);
lhs(5) = y(5);
rhs(5) = y(5)*params(9)+x(2);
lhs(6) = y(6);
rhs(6) = y(6)*params(10)+x(3);
end
