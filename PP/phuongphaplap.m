function [root, steps] = phuongphaplap(g, x0, epsilon)
    x = x0;
    steps = 0;
    while true
        xNew = g(x);
        if abs(g(xNew)-g(x)) <= epsilon
            break;
        end
        x = xNew;
        steps = steps + 1;
    end
    root = x;
end

