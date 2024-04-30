% Hàm giải bằng phương pháp Euler thuận
function [x, y] = euler_thuan(dydx, x0, y0, h)
    x = x0:h:1;
    n = length(x);
    y = zeros(1, n);
    y(1) = y0;
    for i = 1:n-1
        y(i+1) = y(i) + h * dydx(x(i), y(i));
    end
end
