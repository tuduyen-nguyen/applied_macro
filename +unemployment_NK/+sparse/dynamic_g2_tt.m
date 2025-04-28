function [T_order, T] = dynamic_g2_tt(y, x, params, steady_state, T_order, T)
if T_order >= 2
    return
end
[T_order, T] = unemployment_NK.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
T_order = 2;
if size(T, 1) < 68
    T = [T; NaN(68 - size(T, 1), 1)];
end
T(65) = (-((-(params(1)*y(77)))*(y(43)+y(43))))/(y(43)*y(43)*y(43)*y(43));
T(66) = getPowerDeriv(y(40),1-params(25),2);
T(67) = getPowerDeriv(T(17),1/(params(24)-1),2);
T(68) = getPowerDeriv(T(23),1-params(16),2);
end
