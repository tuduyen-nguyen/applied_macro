function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(25, 1);
end
[T_order, T] = baseline_NK.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(30, 1);
    residual(1) = (y(41)) - (y(56)*T(1));
    residual(2) = (T(2)*y(31)) - (1);
    residual(3) = (y(41)*y(34)) - (params(7)*y(33)^params(6));
    residual(4) = (y(57)*y(42)) - (1+y(57)*y(42)*T(3)*T(4)+T(7)*T(8));
    residual(5) = (y(35)) - (T(10)*T(11));
    residual(6) = (y(57)*y(37)*T(13)) - (y(36)-y(6)*(1-params(3)));
    residual(7) = (y(72)*(1-params(3))+params(4)*y(73)*y(65)/y(36)) - (y(31)*y(42));
    residual(8) = (y(34)) - (y(35)*(1-params(4))*y(43)/y(33));
residual(9) = 1-params(11)+params(11)*y(38)-params(16)*y(39)*(y(39)-(steady_state(9)))+T(15)*(y(69)-(steady_state(9)));
    residual(10) = (y(43)) - (y(38)-T(16)-y(44)*(1-params(28))*params(25)*(1-y(45))*T(17));
    residual(11) = ((y(44)*params(25)*T(18)/(params(26)*params(27)))^(1/(params(27)-1))) - (y(45));
    residual(12) = (y(35)) - (y(32)+y(37)+y(47)+y(35)*T(16)+y(35)*params(16)/2*T(19));
    residual(13) = (y(46)) - (T(18)*params(25)*(1-y(45)));
    residual(14) = (y(31)) - (y(40)/y(69));
    residual(15) = (y(40)) - (T(20)*T(25)*y(58));
    residual(16) = (y(47)) - ((steady_state(5))*params(8)*y(55));
    residual(17) = (y(44)) - (params(29)*y(59));
    residual(18) = (y(48)) - (log(y(35)/y(5)));
    residual(19) = (y(49)) - (log(y(32)/y(2)));
    residual(20) = (y(50)) - (log(T(12)));
    residual(21) = (y(51)) - (y(39)-(steady_state(9)));
    residual(22) = (y(52)) - (y(40)-(steady_state(10)));
    residual(23) = (y(53)) - (log(T(22)));
    residual(24) = (log(y(54))) - (params(18)*log(y(24))+x(1));
    residual(25) = (log(y(55))) - (params(19)*log(y(25))+x(2));
    residual(26) = (log(y(56))) - (params(20)*log(y(26))+x(3));
    residual(27) = (log(y(60))) - (params(24)*log(y(30))+x(7));
    residual(28) = (log(y(57))) - (params(21)*log(y(27))+x(4));
    residual(29) = (log(y(58))) - (params(22)*log(y(28))+x(5));
    residual(30) = (log(y(59))) - (params(23)*log(y(29))+x(6));
end
