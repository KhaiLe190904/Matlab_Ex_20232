% Main script to run steepest descent and Newton's method

% Initial point
x0 = [-1.5; -1];

% Parameters
alpha = 0.15; % Learning rate for steepest descent
epsilon = 0.001; % Stopping criterion
max_iterations = 5; % Maximum number of iterations

% Run steepest descent method
disp('Running Steepest Descent Method:');
[x_min_sd, iterations_sd] = steepest_descent(x0, alpha, epsilon, max_iterations);
disp(['Minimum point (Steepest Descent): [', num2str(x_min_sd'), ']']);
disp(['Iterations (Steepest Descent): ', num2str(iterations_sd), ]);

% Run Newton's method
disp('Running Newtons Method:');
[x_min_newton, iterations_newton] = newtons_method(x0, epsilon, max_iterations);
disp(['Minimum point (Newton): [', num2str(x_min_newton'), ']']);
disp(['Iterations (Newton): ', num2str(iterations_newton)]);

% Define the Hessian matrix
x1 = -1.5;
x2 = -1;
H = [1200*x1^2 - 400*x2 + 2, -400*x1; -400*x1, 200];

% Compute eigenvalues
eigenvalues = eig(H);

% Check convexity
if all(eigenvalues >= 0)
    disp('The function is convex.');
else
    disp('The function is not convex.');
end

