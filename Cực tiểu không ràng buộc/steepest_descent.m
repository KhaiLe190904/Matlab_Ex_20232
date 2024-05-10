% Steepest Descent Method
function [x_min, iterations] = steepest_descent(x0, alpha, epsilon, max_iterations)
    x_current = x0;
    iterations = 0;

    while iterations < max_iterations
        grad = compute_gradient(x_current(1), x_current(2));
        if norm(grad) < epsilon
            break;
        end
        % Update x using steepest descent
        x_current = x_current - alpha * grad;
        iterations = iterations + 1;
    end

    x_min = x_current;
end

