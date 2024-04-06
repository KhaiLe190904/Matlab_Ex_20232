function [root, error, steps] = ppcattuyen(f, x1, x2, epsilon)
    steps = 0;
    while abs(f(x2)) > epsilon
        x3 = x1 - f(x1) * (x2 - x1) / (f(x2) - f(x1));
        x1 = x2;
        x2 = x3;
        steps = steps + 1;
    end
    root = x2;
    error = abs(f(x2));
end
