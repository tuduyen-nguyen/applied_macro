function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(0, 1);
end
[T_order, T] = NK3eq.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(6, 1);
    residual(1) = (y(1)) - (y(1)-1/params(2)*(y(3)-y(2))+y(4));
    residual(2) = (y(2)) - (y(2)*params(1)+y(1)*(1-params(7))*(1-params(1)*params(7))/params(7)*(params(2)+params(3))+y(5));
    residual(3) = (y(3)) - (y(3)*params(4)+(1-params(4))*(y(2)*params(5)+y(1)*params(6))+y(6));
    residual(4) = (y(4)) - (y(4)*params(8)+x(1));
    residual(5) = (y(5)) - (y(5)*params(9)+x(2));
    residual(6) = (y(6)) - (y(6)*params(10)+x(3));
end
