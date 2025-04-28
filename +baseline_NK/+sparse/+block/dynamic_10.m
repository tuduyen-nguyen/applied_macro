function [y, T] = dynamic_10(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(53)=log(y(35)/(steady_state(5)));
  y(52)=y(40)-(steady_state(10));
  y(51)=y(39)-(steady_state(9));
  y(50)=log(y(37)/y(7));
  y(49)=log(y(32)/y(2));
  y(48)=log(y(35)/y(5));
  y(46)=T(1)*params(25)*(1-y(45));
end
