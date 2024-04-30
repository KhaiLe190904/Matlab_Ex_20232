function [r, s] = bairstow(p, r0, s0, maxiter)
% tim da thuc bac 2 dang x^2 - rx - s
%vao -p la da thuc can tim nghiem
%    -r0, s0 gia tri ban dau
%    -maxiter so lan lap max
%ra  -r, s
%cu phap [r, s] = bairstow(p, r0, s0, maxiter)
n = length(p) - 1;
c = zeros(n);
b = zeros(n);
j = 0;
while j < maxiter
    b(1) = p(1);
    b(2) = p(2) + r0*b(1);
    for k = 3:(n+1)
        b(k) = p(k) + r0*b(k-1) + s0*b(k-2);
    end
    c(1) = b(1);
    c(2) = b(2) + r0*c(1);
    for k = 3:n
        c(k) = b(k) + r0*c(k-1) + s0*c(k-2);
    end
    d0 = det([c(n-1), c(n-2); c(n), c(n-1)]);
    d1 = det([-b(n), c(n-2); -b(n+1), c(n-1)]);
    d2 = det([c(n-1), -b(n); c(n), -b(n+1)]);
    r = r0 + d1/d0;
    s = s0 + d2/d0;
    % Check if both r and s are real
    if imag(r) == 0 && imag(s) == 0
        % Only update r0 and s0 if both roots are real
        r0 = r;
        s0 = s;
        j = j + 1;
    else
        % Break out of the loop if either root is complex
        break;
    end
end
end

