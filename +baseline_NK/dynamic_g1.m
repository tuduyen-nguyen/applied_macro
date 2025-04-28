function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = baseline_NK.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(30, 56);
g1(1,1)=(-(y(38)*(-params(10))*T(26)));
g1(1,14)=(-(y(38)*T(26)));
g1(1,23)=1;
g1(1,38)=(-T(1));
g1(2,13)=T(2);
g1(2,23)=y(13)*(-(params(2)*y(46)))/(y(23)*y(23));
g1(2,46)=y(13)*params(2)/y(23);
g1(3,15)=(-(params(7)*getPowerDeriv(y(15),params(6),1)));
g1(3,16)=y(23);
g1(3,23)=y(16);
g1(4,4)=(-(y(39)*y(24)*T(3)*(y(4)*y(19)*(-(3*y(19)))/(y(4)*y(4))-y(19)*(3*y(19)/y(4)-4))/(y(4)*y(4))));
g1(4,19)=(-(y(39)*y(24)*T(3)*(3*y(19)/y(4)-4+y(19)*3/y(4))/y(4)+T(8)*T(5)*(-((-y(44))/(y(19)*y(19))))+T(7)*(-y(44))/(y(19)*y(19))*2*y(44)/y(19)));
g1(4,44)=(-(T(8)*T(5)*(-(1/y(19)))+T(7)*2*y(44)/y(19)*1/y(19)));
g1(4,23)=(-(T(8)*T(6)*params(12)*y(47)*y(49)*(-(params(2)*y(46)))/(y(23)*y(23))));
g1(4,46)=(-(T(8)*T(6)*params(12)*y(47)*y(49)*params(2)/y(23)));
g1(4,24)=y(39)-T(4)*y(39)*T(3);
g1(4,47)=(-(T(8)*T(6)*params(12)*T(2)*y(49)));
g1(4,39)=y(24)-T(4)*y(24)*T(3);
g1(4,49)=(-(T(8)*T(6)*params(12)*T(2)*y(47)));
g1(5,15)=(-(T(10)*getPowerDeriv(y(15),1-params(4),1)));
g1(5,17)=1;
g1(5,3)=(-(T(11)*y(36)*params(9)*getPowerDeriv(y(3),params(4),1)));
g1(5,36)=(-(T(11)*params(9)*T(9)));
g1(6,3)=1-params(3);
g1(6,18)=(-1);
g1(6,4)=y(39)*y(19)*(-(T(3)*(-y(19))/(y(4)*y(4))*2*(T(12)-1)));
g1(6,19)=y(39)*T(13)+y(39)*y(19)*(-(T(3)*2*(T(12)-1)*1/y(4)));
g1(6,39)=y(19)*T(13);
g1(7,13)=(-y(24));
g1(7,43)=params(4)*y(48)/y(18);
g1(7,18)=(-(params(4)*y(48)*y(43)))/(y(18)*y(18));
g1(7,24)=(-y(13));
g1(7,47)=1-params(3);
g1(7,48)=params(4)*y(43)/y(18);
g1(8,15)=(-((-(y(17)*(1-params(4))*y(25)))/(y(15)*y(15))));
g1(8,16)=1;
g1(8,17)=(-((1-params(4))*y(25)/y(15)));
g1(8,25)=(-(y(17)*(1-params(4))/y(15)));
g1(9,17)=(y(45)-(steady_state(9)))*y(45)*(-(y(43)*y(46)*params(2)*params(16)/y(23)))/(y(17)*y(17));
g1(9,43)=(y(45)-(steady_state(9)))*y(45)*y(46)*params(2)*params(16)/y(23)/y(17);
g1(9,20)=params(11);
g1(9,21)=(-(params(16)*y(21)+params(16)*(y(21)-(steady_state(9)))));
g1(9,45)=T(15)+T(14)*(y(45)-(steady_state(9)));
g1(9,23)=(y(45)-(steady_state(9)))*y(45)*y(43)*(-(y(46)*params(2)*params(16)))/(y(23)*y(23))/y(17);
g1(9,46)=(y(45)-(steady_state(9)))*y(45)*y(43)*params(2)*params(16)/y(23)/y(17);
g1(10,17)=y(26)*(1-params(28))*params(25)*(1-y(27))*getPowerDeriv(y(17),(-params(28)),1);
g1(10,20)=(-1);
g1(10,25)=1;
g1(10,26)=T(17)*(1-y(27))*(1-params(28))*params(25);
g1(10,27)=(-((-T(30))-T(17)*(-(y(26)*(1-params(28))*params(25)))));
g1(11,17)=y(26)*params(25)*T(27)/(params(26)*params(27))*T(28);
g1(11,26)=T(28)*params(25)*T(18)/(params(26)*params(27));
g1(11,27)=(-1);
g1(12,14)=(-1);
g1(12,17)=1-(T(16)+T(19)*params(16)/2);
g1(12,19)=(-1);
g1(12,21)=(-(y(17)*params(16)/2*2*(y(21)-(steady_state(9)))));
g1(12,27)=(-(y(17)*T(30)));
g1(12,29)=(-1);
g1(13,17)=(-(params(25)*(1-y(27))*T(27)));
g1(13,27)=(-(T(18)*(-params(25))));
g1(13,28)=1;
g1(14,13)=1;
g1(14,45)=(-((-y(22))/(y(45)*y(45))));
g1(14,22)=(-(1/y(45)));
g1(15,17)=(-(y(40)*T(20)*T(21)*1/(steady_state(5))*getPowerDeriv(T(22),params(14),1)*T(29)));
g1(15,21)=(-(y(40)*T(20)*T(29)*T(23)*(steady_state(10))*1/(steady_state(9))*getPowerDeriv(y(21)/(steady_state(9)),params(15),1)));
g1(15,5)=(-(y(40)*T(25)*getPowerDeriv(y(5),params(13),1)));
g1(15,22)=1;
g1(15,40)=(-(T(20)*T(25)));
g1(16,29)=1;
g1(16,37)=(-((steady_state(5))*params(8)));
g1(17,26)=1;
g1(17,41)=(-params(29));
g1(18,2)=(-((-y(17))/(y(2)*y(2))/(y(17)/y(2))));
g1(18,17)=(-(1/y(2)/(y(17)/y(2))));
g1(18,30)=1;
g1(19,1)=(-((-y(14))/(y(1)*y(1))/(y(14)/y(1))));
g1(19,14)=(-(1/y(1)/(y(14)/y(1))));
g1(19,31)=1;
g1(20,4)=(-((-y(19))/(y(4)*y(4))/T(12)));
g1(20,19)=(-(1/y(4)/T(12)));
g1(20,32)=1;
g1(21,21)=(-1);
g1(21,33)=1;
g1(22,22)=(-1);
g1(22,34)=1;
g1(23,17)=(-(1/(steady_state(5))/T(22)));
g1(23,35)=1;
g1(24,6)=(-(params(18)*1/y(6)));
g1(24,36)=1/y(36);
g1(24,50)=(-1);
g1(25,7)=(-(params(19)*1/y(7)));
g1(25,37)=1/y(37);
g1(25,51)=(-1);
g1(26,8)=(-(params(20)*1/y(8)));
g1(26,38)=1/y(38);
g1(26,52)=(-1);
g1(27,12)=(-(params(24)*1/y(12)));
g1(27,42)=1/y(42);
g1(27,56)=(-1);
g1(28,9)=(-(params(21)*1/y(9)));
g1(28,39)=1/y(39);
g1(28,53)=(-1);
g1(29,10)=(-(params(22)*1/y(10)));
g1(29,40)=1/y(40);
g1(29,54)=(-1);
g1(30,11)=(-(params(23)*1/y(11)));
g1(30,41)=1/y(41);
g1(30,55)=(-1);

end
