% Newton's Method
function [x_min, iterations] = newtons_method(x0, epsilon, max_iterations)
    x_current = x0;
    iterations = 0;

    while iterations < max_iterations
        grad = compute_gradient(x_current(1), x_current(2));
        hessian = compute_hessian(x_current(1), x_current(2));
        if norm(grad) < epsilon
            break;
        end
        % Update x using Newton's method
        x_current = x_current - inv(hessian) * grad;
        iterations = iterations + 1;
    end

    x_min = x_current;
end

