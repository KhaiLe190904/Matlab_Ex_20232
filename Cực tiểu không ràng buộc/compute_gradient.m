% Function to compute the gradient of f(x1, x2)
function grad = compute_gradient(x1, x2)
    % Calculate the partial derivatives
    df_dx1 = -400 * x1 * (x2 - x1^2) - 2 * (1 - x1);
    df_dx2 = 200 * (x2 - x1^2);
    %df_dx1 = -2*x1*sin(x1^2 - 3*x2) + 2*x1*sin(x1^2+x2^2);
    %df_dx2 = 3*sin(x1^2-3*x2) + 2*x2*cos(x1^2+x2^2)

    % Gradient vector
    grad = [df_dx1; df_dx2];
end

