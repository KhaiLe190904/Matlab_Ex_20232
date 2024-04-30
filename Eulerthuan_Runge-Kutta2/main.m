% Bài toán giá trị ban đầu
dydx = @(x, y) -y + x + 1;
x0 = 0;  % Giá trị ban đầu của x
y0 = 1;  % Giá trị ban đầu của y
h = 0.01; % Bước thời gian

% Giải bằng phương pháp Euler thuận
[x_euler, y_euler] = euler_thuan(dydx, x0, y0, h);

% Giải bằng phương pháp Runge-Kutta bậc 2
[x_rk2, y_rk2] = runge_kutta_2(dydx, x0, y0, h);

% Lời giải chính xác
x_exact = 0:h:1;
y_exact = exact_solution(x_exact);

% Vẽ đồ thị
figure;
plot(x_exact, y_exact, 'k-', 'LineWidth', 2); hold on;
plot(x_euler, y_euler, 'r--', 'LineWidth', 2);
plot(x_rk2, y_rk2, 'b-.', 'LineWidth', 1.5);
legend('Lời giải chính xác', 'Euler', 'Runge-Kutta bậc 2');
xlabel('x');
ylabel('y');
title('Giải bài toán giá trị ban đầu');

% Đánh giá sai số
error_euler = abs(y_exact - y_euler);
error_rk2 = abs(y_exact - y_rk2);

mean_error_euler = mean(error_euler);
mean_error_rk2 = mean(error_rk2);

disp(['Sai số trung bình của phương pháp Euler: ', num2str(mean_error_euler)]);
disp(['Sai số trung bình của phương pháp Runge-Kutta bậc 2: ', num2str(mean_error_rk2)]);








