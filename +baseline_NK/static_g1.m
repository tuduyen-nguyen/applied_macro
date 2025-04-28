function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = baseline_NK.static_g1_tt(T, y, x, params);
end
g1 = zeros(30, 30);
g1(1,2)=(-(y(26)*(1-params(10))*getPowerDeriv(y(2)-y(2)*params(10),(-params(5)),1)));
g1(1,11)=1;
g1(1,26)=(-T(1));
g1(2,1)=params(2);
g1(3,3)=(-(params(7)*getPowerDeriv(y(3),params(6),1)));
g1(3,4)=y(11);
g1(3,11)=y(4);
g1(4,12)=y(27)-(1+(-y(7))/y(7))*y(27)*params(12)/2;
g1(4,27)=y(12)-(1+(-y(7))/y(7))*y(12)*params(12)/2;
g1(5,3)=(-(T(3)*getPowerDeriv(y(3),1-params(4),1)));
g1(5,5)=1;
g1(5,6)=(-(T(4)*y(24)*params(9)*getPowerDeriv(y(6),params(4),1)));
g1(5,24)=(-(T(4)*params(9)*T(2)));
g1(6,6)=(-(1-(1-params(3))));
g1(6,7)=y(27);
g1(6,27)=y(7);
g1(7,1)=(-y(12));
g1(7,5)=params(4)*y(13)/y(6);
g1(7,6)=(-(y(5)*params(4)*y(13)))/(y(6)*y(6));
g1(7,12)=1-params(3)-y(1);
g1(7,13)=y(5)*params(4)/y(6);
g1(8,3)=(-((-(y(5)*(1-params(4))*y(13)))/(y(3)*y(3))));
g1(8,4)=1;
g1(8,5)=(-((1-params(4))*y(13)/y(3)));
g1(8,13)=(-(y(5)*(1-params(4))/y(3)));
g1(9,8)=params(11);
g1(9,9)=(y(9)-(y(9)))*params(2)*params(16)-params(16)*(y(9)-(y(9)));
g1(10,5)=y(14)*(1-params(28))*params(25)*(1-y(15))*getPowerDeriv(y(5),(-params(28)),1);
g1(10,8)=(-1);
g1(10,13)=1;
g1(10,14)=T(6)*(1-y(15))*(1-params(28))*params(25);
g1(10,15)=(-((-T(19))-T(6)*(-(y(14)*(1-params(28))*params(25)))));
g1(11,5)=y(14)*params(25)*T(16)/(params(26)*params(27))*T(17);
g1(11,14)=T(17)*params(25)*T(7)/(params(26)*params(27));
g1(11,15)=(-1);
g1(12,2)=(-1);
g1(12,5)=1-(T(5)+T(8)*params(16)/2);
g1(12,7)=(-1);
g1(12,15)=(-(y(5)*T(19)));
g1(12,17)=(-1);
g1(13,5)=(-(params(25)*(1-y(15))*T(16)));
g1(13,15)=(-(T(7)*(-params(25))));
g1(13,16)=1;
g1(14,1)=1;
g1(14,9)=(-((-y(10))/(y(9)*y(9))));
g1(14,10)=(-(1/y(9)));
g1(15,5)=(-(y(28)*T(9)*T(11)*((y(5))-y(5))/((y(5))*(y(5)))*getPowerDeriv(T(12),params(14),1)*T(18)));
g1(15,9)=(-(y(28)*T(9)*T(18)*T(13)*(y(10))*((y(9))-y(9))/((y(9))*(y(9)))*getPowerDeriv(y(9)/(y(9)),params(15),1)));
g1(15,10)=1-y(28)*(T(15)*getPowerDeriv(y(10),params(13),1)+T(9)*T(18)*T(10)*T(13));
g1(15,28)=(-(T(9)*T(15)));
g1(16,5)=(-(params(8)*y(25)));
g1(16,17)=1;
g1(16,25)=(-((y(5))*params(8)));
g1(17,14)=1;
g1(17,29)=(-params(29));
g1(18,18)=1;
g1(19,19)=1;
g1(20,20)=1;
g1(21,21)=1;
g1(22,22)=1;
g1(23,5)=(-(((y(5))-y(5))/((y(5))*(y(5)))/T(12)));
g1(23,23)=1;
g1(24,24)=1/y(24)-params(18)*1/y(24);
g1(25,25)=1/y(25)-params(19)*1/y(25);
g1(26,26)=1/y(26)-params(20)*1/y(26);
g1(27,30)=1/y(30)-params(24)*1/y(30);
g1(28,27)=1/y(27)-params(21)*1/y(27);
g1(29,28)=1/y(28)-params(22)*1/y(28);
g1(30,29)=1/y(29)-params(23)*1/y(29);

end
