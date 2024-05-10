% Function to compute the Hessian matrix of f(x1, x2)
function hessian = compute_hessian(x1, x2)
    % Calculate the second derivatives
    d2f_dx1dx1 = 1200 * x1^2 - 400 * x2 + 2;
    d2f_dx1dx2 = -400 * x1;
    d2f_dx2dx2 = 200;

    %d2f_dx1dx1 = 2 * sin(x1^2 - 3*x2) - 6 * x1^2 * cos(x1^2 - 3*x2) - 2 * cos(x1^2 + x2^2) + 4 * x1^2 * sin(x1^2 + x2^2);
    %d2f_dx1dx2 = -6 * x1 * cos(x1^2 - 3*x2) - 6 * x2 * cos(x1^2 + x2^2);
    %d2f_dx2dx2 = -9 * cos(x1^2 - 3*x2) - 4 * x2^2 * sin(x1^2 + x2^2) - 2 * sin(x1^2 + x2^2);

    % Hessian matrix
    hessian = [d2f_dx1dx1, d2f_dx1dx2; d2f_dx1dx2, d2f_dx2dx2];
end

