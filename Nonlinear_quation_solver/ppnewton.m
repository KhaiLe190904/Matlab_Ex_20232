function [root, saiso, steps] = ppnewton(f, f_prime, x0, epsilon)
    steps = 0;
    while abs(f(x0)) > epsilon
        x0 = x0 - f(x0) / f_prime(x0);
        steps = steps + 1;
    end
    root = x0;
    saiso = abs(f(x0));
end
