function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(0, 1);
end
[T_order, T] = NK3eq.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(6, 1);
    residual(1) = (y(7)) - (y(13)-1/params(2)*(y(9)-y(14))+y(10));
    residual(2) = (y(8)) - (y(14)*params(1)+y(7)*(1-params(7))*(1-params(1)*params(7))/params(7)*(params(2)+params(3))+y(11));
    residual(3) = (y(9)) - (params(4)*y(3)+(1-params(4))*(y(8)*params(5)+y(7)*params(6))+y(12));
    residual(4) = (y(10)) - (params(8)*y(4)+x(1));
    residual(5) = (y(11)) - (params(9)*y(5)+x(2));
    residual(6) = (y(12)) - (params(10)*y(6)+x(3));
end
