function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(3, 1);
  residual(1)=(y(9))-(params(4)*y(3)+(1-params(4))*(y(8)*params(5)+y(7)*params(6))+y(12));
  residual(2)=(y(7))-(y(13)-1/params(2)*(y(9)-y(14))+y(10));
  residual(3)=(y(8))-(y(14)*params(1)+y(7)*(1-params(7))*(1-params(1)*params(7))/params(7)*(params(2)+params(3))+y(11));
if nargout > 3
    g1_v = NaN(11, 1);
g1_v(1)=(-params(4));
g1_v(2)=1;
g1_v(3)=1/params(2);
g1_v(4)=(-((1-params(4))*params(6)));
g1_v(5)=1;
g1_v(6)=(-((1-params(7))*(1-params(1)*params(7))/params(7)*(params(2)+params(3))));
g1_v(7)=(-((1-params(4))*params(5)));
g1_v(8)=1;
g1_v(9)=(-1);
g1_v(10)=(-(1/params(2)));
g1_v(11)=(-params(1));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 3, 9);
end
end
