function [root, saiso, steps] = ppdaycung(f, a, c, epsilon)
    steps = 0;
    while (abs(c - a) >= epsilon)
        b = a - f(a) * (c - a) / (f(c) - f(a));
        a = c;
        c = b;
        steps = steps + 1;
    end
    root = c;
    saiso = abs(c - a);
end
