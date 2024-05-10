f = @(x) exp(x) + exp(-x) - 3*x^2 + x;

% Phương pháp cơ bản
[x_star_basic, f_star_basic, k] = gradient_cuctieu(f, 2, 4, 0.001);
fprintf('Basic Method: x* = %f, f* = %f, so buoc lap: %d\n', x_star_basic, f_star_basic, k);
% Phương pháp Fibonacci
[x_star_fibonacci, f_star_fibonacci] = fibonacci_method(f, 2, 4, 10); % Chọn N tùy ý
disp(['Fibonacci Method: x* = ', num2str(x_star_fibonacci), ', f* = ', num2str(f_star_fibonacci)]);
% Phương pháp Lát cắt vàng
[x_star_golden, f_star_golden, k_golden] = golden_section(f, 2, 4, 0.001);
fprintf('Golden Method: x* = %f, f* = %f, so buoc lap: %d\n', x_star_golden, f_star_golden, k_golden);

