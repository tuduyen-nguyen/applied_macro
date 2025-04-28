function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 25);

T(1) = (y(14)-params(10)*y(1))^(-params(5));
T(2) = params(2)*y(46)/y(23);
T(3) = params(12)/2;
T(4) = 1+y(19)*(3*y(19)/y(4)-4)/y(4);
T(5) = params(12)*T(2)*y(49)*y(47);
T(6) = 1-y(44)/y(19);
T(7) = T(5)*T(6);
T(8) = (y(44)/y(19))^2;
T(9) = y(3)^params(4);
T(10) = y(36)*params(9)*T(9);
T(11) = y(15)^(1-params(4));
T(12) = y(19)/y(4);
T(13) = 1-T(3)*(T(12)-1)^2;
T(14) = y(43)*y(46)*params(2)*params(16)/y(23)/y(17);
T(15) = T(14)*y(45);
T(16) = params(26)*y(27)^params(27);
T(17) = y(17)^(-params(28));
T(18) = y(17)^(1-params(28));
T(19) = (y(21)-(steady_state(9)))^2;
T(20) = y(5)^params(13);
T(21) = (steady_state(10))*(y(21)/(steady_state(9)))^params(15);
T(22) = y(17)/(steady_state(5));
T(23) = T(22)^params(14);
T(24) = T(21)*T(23);
T(25) = T(24)^(1-params(13));

end
