function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(10)=params(8)*y(4)+x(1);
  y(11)=params(9)*y(5)+x(2);
  y(12)=params(10)*y(6)+x(3);
end
