p = [1 -3 3 2 -7 4];
m = length(p);
s0 = -1;
r0 = -1;
fprintf("Nghiem cua da thuc:\n");
while m > 3
    % Gọi hàm bairstow để tìm cặp (r, s)
    [r, s] = bairstow(p, r0, s0, 50);
    % Giảm bậc của đa thức sau mỗi lần tìm được nghiệm
    m = m - 2;
    % Tính toán các nghiệm của đa thức bậc 2 từ cặp (r, s)
    x1 = (r + sqrt(r^2 + 4 * s)) / 2;
    x2 = (r - sqrt(r^2 + 4 * s)) / 2;

    % Kiểm tra xem nghiệm có phải là số thực hay không
    if isreal(x1)
        fprintf("%s\n", num2str(x1));
    end
    if isreal(x2)
        fprintf("%s\n", num2str(x2));
    end

    % Loại bỏ đa thức bậc 2 đã tìm được nghiệm
    p = deconv(p, [1, -r, -s]);
end
if length(p) == 3
    x1 = (-p(2) + sqrt(p(2)^2 - 4 * p(3))) / 2;
    x2 = (-p(2) - sqrt(p(2)^2 - 4 * p(3))) / 2;
    % Kiểm tra xem nghiệm có phải là số thực hay không
    if isreal(x1)
        fprintf("%s\n", num2str(x1));
    end
    if isreal(x2)
        fprintf("%s\n", num2str(x2));
    end
else
    x1 = -p(2) / p(1);
    % Kiểm tra xem nghiệm có phải là số thực hay không
    if isreal(x1)
        fprintf("%f\n", x1);
    end
end

