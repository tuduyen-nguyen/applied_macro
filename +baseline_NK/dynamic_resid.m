function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = baseline_NK.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(30, 1);
    residual(1) = (y(23)) - (y(38)*T(1));
    residual(2) = (T(2)*y(13)) - (1);
    residual(3) = (y(23)*y(16)) - (params(7)*y(15)^params(6));
    residual(4) = (y(39)*y(24)) - (1+y(39)*y(24)*T(3)*T(4)+T(7)*T(8));
    residual(5) = (y(17)) - (T(10)*T(11));
    residual(6) = (y(39)*y(19)*T(13)) - (y(18)-y(3)*(1-params(3)));
    residual(7) = (y(47)*(1-params(3))+params(4)*y(48)*y(43)/y(18)) - (y(13)*y(24));
    residual(8) = (y(16)) - (y(17)*(1-params(4))*y(25)/y(15));
residual(9) = 1-params(11)+params(11)*y(20)-params(16)*y(21)*(y(21)-(steady_state(9)))+T(15)*(y(45)-(steady_state(9)));
    residual(10) = (y(25)) - (y(20)-T(16)-y(26)*(1-params(28))*params(25)*(1-y(27))*T(17));
    residual(11) = ((y(26)*params(25)*T(18)/(params(26)*params(27)))^(1/(params(27)-1))) - (y(27));
    residual(12) = (y(17)) - (y(14)+y(19)+y(29)+y(17)*T(16)+y(17)*params(16)/2*T(19));
    residual(13) = (y(28)) - (T(18)*params(25)*(1-y(27)));
    residual(14) = (y(13)) - (y(22)/y(45));
    residual(15) = (y(22)) - (T(20)*T(25)*y(40));
    residual(16) = (y(29)) - ((steady_state(5))*params(8)*y(37));
    residual(17) = (y(26)) - (params(29)*y(41));
    residual(18) = (y(30)) - (log(y(17)/y(2)));
    residual(19) = (y(31)) - (log(y(14)/y(1)));
    residual(20) = (y(32)) - (log(T(12)));
    residual(21) = (y(33)) - (y(21)-(steady_state(9)));
    residual(22) = (y(34)) - (y(22)-(steady_state(10)));
    residual(23) = (y(35)) - (log(T(22)));
    residual(24) = (log(y(36))) - (params(18)*log(y(6))+x(it_, 1));
    residual(25) = (log(y(37))) - (params(19)*log(y(7))+x(it_, 2));
    residual(26) = (log(y(38))) - (params(20)*log(y(8))+x(it_, 3));
    residual(27) = (log(y(42))) - (params(24)*log(y(12))+x(it_, 7));
    residual(28) = (log(y(39))) - (params(21)*log(y(9))+x(it_, 4));
    residual(29) = (log(y(40))) - (params(22)*log(y(10))+x(it_, 5));
    residual(30) = (log(y(41))) - (params(23)*log(y(11))+x(it_, 6));

end
