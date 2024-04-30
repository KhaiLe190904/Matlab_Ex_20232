% Hàm giải bằng phương pháp Runge-Kutta bậc 2
function [x, y] = runge_kutta_2(dydx, x0, y0, h)
    x = x0:h:1;
    n = length(x);
    y = zeros(1, n);
    y(1) = y0;
    for i = 1:n-1
        k1 = h * dydx(x(i), y(i));
        k2 = h * dydx(x(i) + h, y(i) + k1);
        y(i+1) = y(i) + 0.5 * (k1 + k2);
    end
end
