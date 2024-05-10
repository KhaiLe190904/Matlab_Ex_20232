function [x_star, f_star, k] = golden_section(f, a, b, epsilon)
    k = 0;
    phi = (1 + sqrt(5)) / 2; % tỷ số vàng
    x1 = b - (b - a) / phi;
    x2 = a + (b - a) / phi;
    while abs(b - a) > epsilon
      k = k+1;
        if f(x1) < f(x2)
            b = x2;
            x2 = x1;
            x1 = b - (b - a) / phi;
        else
            a = x1;
            x1 = x2;
            x2 = a + (b - a) / phi;
        end
    end
    x_star = (a + b) / 2;
    f_star = f(x_star);
end
