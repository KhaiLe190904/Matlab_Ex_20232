% Hàm f(x) = x^3 + 2x^2 + 1
f = @(x) x.^3 + 2*x.^2 + 1;
a = 1; % Giới hạn dưới
b = 3; % Giới hạn trên
M = 10; % Số lượng đoạn

% Tính tích phân của hàm f trên đoạn [a, b] với M đoạn
integral_value = CTHTMR(f, a, b, M);
disp(['Giá trị tích phân của hàm f trên [', num2str(a), ',', num2str(b), '] với ', num2str(M), ' đoạn: ', num2str(integral_value)]);
