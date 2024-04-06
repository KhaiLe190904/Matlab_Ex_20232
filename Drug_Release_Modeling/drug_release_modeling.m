% Given data
days = [0, 0.25, 0.5, 1, 2, 3, 4, 5, 6, 8, 10];
micrograms = [2.5, 3.6, 5.3, 9.5, 14.0, 16.5, 18.8, 21.5, 23.2, 26.8, 28.4];
extended_days = [12, 16, 21];
extended_micrograms = [28.4, 28.5, 29.5];

% Hàm hợp dữ liệu của phương trình hàm đa thức với số bậc
function [heso_m, hangso_b, saiso, tongbinhphuong] = fit_polynomial(days, micrograms, order)
    heso_m = polyfit(days, micrograms, order);
    hangso_b = polyval(heso_m, days);
    saiso = micrograms - hangso_b;
    tongbinhphuong = sum(saiso.^2);
end

% Hàm hợp dữ liệu của phương trình hàm mũ
function [thamso_C, hangso_b] = fit_exponential(days, micrograms, initial_guess)
    objective_function = @(params) sum((micrograms - (params(1) * (1 - exp(-params(2) * days)))).^2);
    thamso_C = fminsearch(objective_function, initial_guess);
    hangso_b = thamso_C(1) * (1 - exp(-thamso_C(2) * days));
end

% Hợp dữ liệu với bậc từ 1-3 của phương trình đa thức
orders = 1:3;
heso_m_list = cell(1, numel(orders));
hangso_b_list = cell(1, numel(orders));
saiso_list = cell(1, numel(orders));
tongbinhphuong_list = zeros(1, numel(orders));

figure;
% Bài 1
for i = 1:numel(orders)
    [heso_m_list{i}, hangso_b_list{i}, saiso_list{i}, tongbinhphuong_list(i)] = fit_polynomial(days, micrograms, orders(i));
    subplot(2, 2, i);
    plot(days, micrograms, 'o', days, hangso_b_list{i});
    title(['Order ', num2str(orders(i)), ' Polynomial Fit']);
    xlabel('Days');
    ylabel('Micrograms');
    legend('Data', 'Model');
end
% Bài 2
% Vẽ sơ đồ saiso cho từng bậc của phương trình đa thức từ 1-3
figure;
for i = 1:numel(orders)
    subplot(2, 2, i);
    bar(days, saiso_list{i});
    title(['saiso for Order ', num2str(orders(i)), ' Polynomial Fit']);
    xlabel('Days');
    ylabel('saiso');
end

% Hợp dữ liệu với phương trình hàm mũ
initial_guess = [10, 2];
[exponential_thamso_C, exponential_hangso_b] = fit_exponential(days, micrograms, initial_guess);

% Vẽ phương trình hàm mũ  với dữ liệu đã cho
figure;
plot(days, micrograms, 'o', days, exponential_hangso_b);
title('Exponential Model Fit');
xlabel('Days');
ylabel('Micrograms');
legend('Data', 'Exponential Model');

% Tính saiso cho phương trình hàm mũ
exponential_saiso = micrograms - exponential_hangso_b;
exponential_tongbinhphuong = sum(exponential_saiso.^2);

% Dự đoán các giá trị của những ngày tiếp theo từ bậc 1-3 của phương trình đa thức với phương trình hàm mũ
extended_hangso_b_list = cell(1, numel(orders));
for i = 1:numel(orders)
    extended_hangso_b_list{i} = polyval(heso_m_list{i}, extended_days);
end
extended_exponential_hangso_b = exponential_thamso_C(1) * (1 - exp(-exponential_thamso_C(2) * extended_days));

% Vẽ tất cả các dự đoán từ bậc 1-3 của pt đa thức với pt hàm mũ từ ngày 10-21
figure;
plot(days, micrograms, 'o', days, exponential_hangso_b, 'DisplayName', 'Exponential Model');
hold on;
for i = 1:numel(orders)
    plot(days, hangso_b_list{i}, 'DisplayName', ['Order ', num2str(orders(i)), ' Polynomial']);
end
for i = 1:numel(orders)
    plot(extended_days, extended_hangso_b_list{i}, '--', 'DisplayName', ['Extended Order ', num2str(orders(i)), ' Polynomial']);
end
plot(extended_days, extended_exponential_hangso_b, '--', 'DisplayName', 'Extended Exponential Model');
hold off;
title('Extended Predictions');
xlabel('Days');
ylabel('Micrograms');
legend('Data', 'Location', 'northwest');

