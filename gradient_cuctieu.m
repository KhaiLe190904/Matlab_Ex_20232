function [x_star, f_star, k] = gradient_cuctieu(f, a, b, eps)
 k = 0;
 while abs(b-a) >= 2*eps
    x1 = a + (b-a)/2 - eps/2;
    x2 = a + (b-a)/2 + eps/2;
    f1 =f(x1); f2 =f(x2); k = k + 1;
    if f1 < f2 b = x2;
    elseif f1>f2 a = x1;
    else a = x1; b = x2;
    end
  end
  x_star = x1;
  f_star = f(x1);
end
