function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = unemployment_NK.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 64
    T = [T; NaN(64 - size(T, 1), 1)];
end
T(27) = (-y(36))/(y(2)*y(2));
T(28) = getPowerDeriv(y(36),(-params(4)),1);
T(29) = 1/y(2);
T(30) = getPowerDeriv(y(37),1-params(3),1);
T(31) = (-y(40))/(y(6)*y(6));
T(32) = (-(y(74)*y(77)*params(1)*params(19)/y(43)))/(y(40)*y(40));
T(33) = y(79)*T(32);
T(34) = getPowerDeriv(y(40),(-params(25)),1);
T(35) = getPowerDeriv(y(40),1-params(25),1);
T(36) = y(54)*params(22)*T(35)/(params(23)*params(24));
T(37) = getPowerDeriv(T(17),1/(params(24)-1),1);
T(38) = 1/(steady_state(6))*getPowerDeriv(y(40)/(steady_state(6)),params(17),1);
T(39) = T(21)*T(38);
T(40) = getPowerDeriv(T(23),1-params(16),1);
T(41) = 1/y(6);
T(42) = y(77)*params(1)*params(19)/y(43)/y(40);
T(43) = y(79)*T(42);
T(44) = getPowerDeriv(y(7),params(3),1);
T(45) = params(26)*y(62)*T(44);
T(46) = (-y(42))/(y(8)*y(8));
T(47) = y(8)*y(42)*(-(3*y(42)))/(y(8)*y(8))-y(42)*(3*y(42)/y(8)-4);
T(48) = 1/y(8);
T(49) = 3*y(42)/y(8)-4+y(42)*3/y(8);
T(50) = (-y(76))/(y(42)*y(42));
T(51) = 2*y(76)/y(42);
T(52) = T(50)*T(51);
T(53) = 1/y(42);
T(54) = params(15)*y(81)*T(2)*y(100)*(-T(53));
T(55) = T(51)*T(53);
T(56) = (-(params(1)*y(77)))/(y(43)*y(43));
T(57) = y(74)*(-(y(77)*params(1)*params(19)))/(y(43)*y(43))/y(40);
T(58) = y(79)*T(57);
T(59) = params(1)/y(43);
T(60) = y(74)*params(1)*params(19)/y(43)/y(40);
T(61) = y(79)*T(60);
T(62) = (steady_state(12))*1/(steady_state(11))*getPowerDeriv(y(45)/(steady_state(11)),params(18),1);
T(63) = getPowerDeriv(y(12),params(16),1);
T(64) = params(11)/(1+params(8))*getPowerDeriv(y(48),1+params(8),1);
end
