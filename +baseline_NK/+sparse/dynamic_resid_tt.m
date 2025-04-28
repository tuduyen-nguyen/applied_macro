function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 25
    T = [T; NaN(25 - size(T, 1), 1)];
end
T(1) = (y(32)-params(10)*y(2))^(-params(5));
T(2) = params(2)*y(71)/y(41);
T(3) = params(12)/2;
T(4) = 1+y(37)*(3*y(37)/y(7)-4)/y(7);
T(5) = params(12)*T(2)*y(87)*y(72);
T(6) = 1-y(67)/y(37);
T(7) = T(5)*T(6);
T(8) = (y(67)/y(37))^2;
T(9) = y(6)^params(4);
T(10) = y(54)*params(9)*T(9);
T(11) = y(33)^(1-params(4));
T(12) = y(37)/y(7);
T(13) = 1-T(3)*(T(12)-1)^2;
T(14) = y(65)*y(71)*params(2)*params(16)/y(41)/y(35);
T(15) = T(14)*y(69);
T(16) = params(26)*y(45)^params(27);
T(17) = y(35)^(-params(28));
T(18) = y(35)^(1-params(28));
T(19) = (y(39)-(steady_state(9)))^2;
T(20) = y(10)^params(13);
T(21) = (steady_state(10))*(y(39)/(steady_state(9)))^params(15);
T(22) = y(35)/(steady_state(5));
T(23) = T(22)^params(14);
T(24) = T(21)*T(23);
T(25) = T(24)^(1-params(13));
end
