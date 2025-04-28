function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = baseline_NK.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 19
    T = [T; NaN(19 - size(T, 1), 1)];
end
T(16) = getPowerDeriv(y(5),1-params(28),1);
T(17) = getPowerDeriv(y(14)*params(25)*T(7)/(params(26)*params(27)),1/(params(27)-1),1);
T(18) = getPowerDeriv(T(14),1-params(13),1);
T(19) = params(26)*getPowerDeriv(y(15),params(27),1);
end
