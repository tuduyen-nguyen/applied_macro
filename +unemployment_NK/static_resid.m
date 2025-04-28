function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = unemployment_NK.static_resid_tt(T, y, x, params);
end
residual = zeros(34, 1);
    residual(1) = (y(9)) - (y(30)*T(1));
    residual(2) = (params(1)*y(1)) - (1);
    residual(3) = (y(15)) - (y(5)-params(10)-params(7)/y(9)+y(15)*params(1)*(1-params(6)));
    residual(4) = (y(3)) - ((1-params(6))*y(3)+y(14)*y(4));
    residual(5) = (y(6)) - (T(3)*T(4));
    residual(6) = (y(8)*y(32)) - (y(7)-y(7)*(1-params(2)));
    residual(7) = ((1-params(2))*y(13)+y(6)*params(3)*y(27)/y(7)) - (y(1)*y(13));
    residual(8) = (y(32)*y(13)) - (1+params(15)/2*y(32)*y(13)*(1+(-y(8))/y(8)));
    residual(9) = (y(16)) - (y(6)*(1-params(3))*y(27)/y(3)-y(5)+params(1)*(1-params(6))*y(16));
    residual(10) = (params(11)*y(14)^params(8)) - (y(16));
residual(11) = 1-params(14)+params(14)*y(10)-params(19)*y(11)*(y(11)-(y(11)))+(y(11)-(y(11)))*y(11)*params(1)*params(19);
    residual(12) = (y(15)*(1-y(31)*params(12))) - (y(16)*y(31)*params(12));
    residual(13) = (y(27)) - (y(10)-params(23)*y(18)^params(24)-y(20)*(1-params(25))*params(22)*(1-y(18))*T(5));
    residual(14) = ((y(20)*params(22)*T(6)/(params(23)*params(24)))^(1/(params(24)-1))) - (y(18));
    residual(15) = (y(6)) - (y(2)+y(8)+y(19)+y(6)*T(7)+y(4)*T(8));
    residual(16) = (y(4)) - (1-y(3));
    residual(17) = (y(1)) - (y(12)/y(11));
    residual(18) = (y(17)) - (T(6)*params(22)*(1-y(18)));
    residual(19) = (y(12)) - (T(9)*T(14)*y(33));
    residual(20) = (y(19)) - ((y(6))*params(9)*y(29));
    residual(21) = (y(20)) - (params(20)*y(34));
residual(22) = y(21);
residual(23) = y(22);
residual(24) = y(23);
    residual(25) = (y(24)) - (y(11)-(y(11)));
    residual(26) = (y(25)) - (y(12)-(y(12)));
    residual(27) = (y(26)) - (y(4)-(y(4)));
    residual(28) = (log(y(28))) - (log(y(28))*params(28)+x(1));
    residual(29) = (log(y(29))) - (log(y(29))*params(29)+x(2));
    residual(30) = (log(y(30))) - (log(y(30))*params(30)+x(3));
    residual(31) = (log(y(32))) - (log(y(32))*params(32)+x(5));
    residual(32) = (log(y(31))) - (log(y(31))*params(31)+x(4));
    residual(33) = (log(y(33))) - (log(y(33))*params(33)+x(6));
    residual(34) = (log(y(34))) - (log(y(34))*params(34)+x(7));

end
