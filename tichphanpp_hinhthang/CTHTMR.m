function integral_value = CTHTMR(f, a, b, M)
    % Tính độ dài mỗi đoạn
    h = (b - a) / M;

    % Tính giá trị của hàm f tại các điểm mẫu
    sum_f = 0;
    for i = 1:M-1
        sum_f = sum_f + f(a + i * h);
    end

    I = (h / 2) * (f(a) + 2 * sum_f + f(b));
    integral_value = I;
end



