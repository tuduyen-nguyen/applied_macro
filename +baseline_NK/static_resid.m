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
    T = baseline_NK.static_resid_tt(T, y, x, params);
end
residual = zeros(30, 1);
    residual(1) = (y(11)) - (y(26)*T(1));
    residual(2) = (params(2)*y(1)) - (1);
    residual(3) = (y(11)*y(4)) - (params(7)*y(3)^params(6));
    residual(4) = (y(27)*y(12)) - (1+y(27)*y(12)*params(12)/2*(1+(-y(7))/y(7)));
    residual(5) = (y(5)) - (T(3)*T(4));
    residual(6) = (y(27)*y(7)) - (y(6)-y(6)*(1-params(3)));
    residual(7) = (y(12)*(1-params(3))+y(5)*params(4)*y(13)/y(6)) - (y(1)*y(12));
    residual(8) = (y(4)) - (y(5)*(1-params(4))*y(13)/y(3));
residual(9) = 1-params(11)+params(11)*y(8)-params(16)*y(9)*(y(9)-(y(9)))+(y(9)-(y(9)))*y(9)*params(2)*params(16);
    residual(10) = (y(13)) - (y(8)-T(5)-y(14)*(1-params(28))*params(25)*(1-y(15))*T(6));
    residual(11) = ((y(14)*params(25)*T(7)/(params(26)*params(27)))^(1/(params(27)-1))) - (y(15));
    residual(12) = (y(5)) - (y(2)+y(7)+y(17)+y(5)*T(5)+y(5)*params(16)/2*T(8));
    residual(13) = (y(16)) - (T(7)*params(25)*(1-y(15)));
    residual(14) = (y(1)) - (y(10)/y(9));
    residual(15) = (y(10)) - (T(9)*T(15)*y(28));
    residual(16) = (y(17)) - ((y(5))*params(8)*y(25));
    residual(17) = (y(14)) - (params(29)*y(29));
residual(18) = y(18);
residual(19) = y(19);
residual(20) = y(20);
    residual(21) = (y(21)) - (y(9)-(y(9)));
    residual(22) = (y(22)) - (y(10)-(y(10)));
    residual(23) = (y(23)) - (log(T(12)));
    residual(24) = (log(y(24))) - (log(y(24))*params(18)+x(1));
    residual(25) = (log(y(25))) - (log(y(25))*params(19)+x(2));
    residual(26) = (log(y(26))) - (log(y(26))*params(20)+x(3));
    residual(27) = (log(y(30))) - (log(y(30))*params(24)+x(7));
    residual(28) = (log(y(27))) - (log(y(27))*params(21)+x(4));
    residual(29) = (log(y(28))) - (log(y(28))*params(22)+x(5));
    residual(30) = (log(y(29))) - (log(y(29))*params(23)+x(6));

end
