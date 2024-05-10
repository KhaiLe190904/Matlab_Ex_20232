function [x_star, f_star] = fibonacci_method(f, a, b, epsilon)
    phi = (1 + sqrt(5)) / 2; % tỷ số vàng
    N = estimate_N(a, b, epsilon); % Ước lượng số lần lặp N
    fib_N = fibonacci(N); % Tính số Fibonacci thứ N
    x1 = b - (b - a) / phi;
    x2 = a + (b - a) / phi;
    for k = 1:N-2
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

function N = estimate_N(a, b, epsilon)
    % Ước lượng số lần lặp N
    N = 0;
    fib_N = 1;
    while (b - a) / epsilon > fib_N
        N = N + 1;
        fib_N = fibonacci(N);
    end
end

function fib = fibonacci(n)
    % Hàm tính số Fibonacci thứ n
    if n <= 0
        fib = 0;
    elseif n == 1
        fib = 1;
    else
        fib = fibonacci(n - 1) + fibonacci(n - 2);
    end
end

