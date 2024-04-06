function [x] = giaihpttt(A,b)  % Function name matches filename
  [L,U,P]=lu(A);
  Pb = P*b;
  y = L\Pb;
  x = U\y;
end



