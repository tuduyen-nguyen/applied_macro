function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 68);

T = unemployment_NK.dynamic_g1_tt(T, y, x, params, steady_state, it_);

T(65) = (-((-(params(1)*y(50)))*(y(22)+y(22))))/(y(22)*y(22)*y(22)*y(22));
T(66) = getPowerDeriv(y(19),1-params(25),2);
T(67) = getPowerDeriv(T(17),1/(params(24)-1),2);
T(68) = getPowerDeriv(T(23),1-params(16),2);

end
