function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 64);

T = unemployment_NK.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(27) = (-y(15))/(y(1)*y(1));
T(28) = getPowerDeriv(y(15),(-params(4)),1);
T(29) = 1/y(1);
T(30) = getPowerDeriv(y(16),1-params(3),1);
T(31) = (-y(19))/(y(3)*y(3));
T(32) = (-(y(48)*y(50)*params(1)*params(19)/y(22)))/(y(19)*y(19));
T(33) = y(51)*T(32);
T(34) = getPowerDeriv(y(19),(-params(25)),1);
T(35) = getPowerDeriv(y(19),1-params(25),1);
T(36) = y(33)*params(22)*T(35)/(params(23)*params(24));
T(37) = getPowerDeriv(T(17),1/(params(24)-1),1);
T(38) = 1/(steady_state(6))*getPowerDeriv(y(19)/(steady_state(6)),params(17),1);
T(39) = T(21)*T(38);
T(40) = getPowerDeriv(T(23),1-params(16),1);
T(41) = 1/y(3);
T(42) = y(50)*params(1)*params(19)/y(22)/y(19);
T(43) = y(51)*T(42);
T(44) = getPowerDeriv(y(4),params(3),1);
T(45) = params(26)*y(41)*T(44);
T(46) = (-y(21))/(y(5)*y(5));
T(47) = y(5)*y(21)*(-(3*y(21)))/(y(5)*y(5))-y(21)*(3*y(21)/y(5)-4);
T(48) = 1/y(5);
T(49) = 3*y(21)/y(5)-4+y(21)*3/y(5);
T(50) = (-y(49))/(y(21)*y(21));
T(51) = 2*y(49)/y(21);
T(52) = T(50)*T(51);
T(53) = 1/y(21);
T(54) = params(15)*y(52)*T(2)*y(56)*(-T(53));
T(55) = T(51)*T(53);
T(56) = (-(params(1)*y(50)))/(y(22)*y(22));
T(57) = y(48)*(-(y(50)*params(1)*params(19)))/(y(22)*y(22))/y(19);
T(58) = y(51)*T(57);
T(59) = params(1)/y(22);
T(60) = y(48)*params(1)*params(19)/y(22)/y(19);
T(61) = y(51)*T(60);
T(62) = (steady_state(12))*1/(steady_state(11))*getPowerDeriv(y(24)/(steady_state(11)),params(18),1);
T(63) = getPowerDeriv(y(6),params(16),1);
T(64) = params(11)/(1+params(8))*getPowerDeriv(y(27),1+params(8),1);

end
