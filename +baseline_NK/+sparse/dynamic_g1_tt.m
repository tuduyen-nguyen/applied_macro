function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = baseline_NK.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 30
    T = [T; NaN(30 - size(T, 1), 1)];
end
T(26) = getPowerDeriv(y(32)-params(10)*y(2),(-params(5)),1);
T(27) = getPowerDeriv(y(35),1-params(28),1);
T(28) = getPowerDeriv(y(44)*params(25)*T(18)/(params(26)*params(27)),1/(params(27)-1),1);
T(29) = getPowerDeriv(T(24),1-params(13),1);
T(30) = params(26)*getPowerDeriv(y(45),params(27),1);
end
