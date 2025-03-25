%RONALD ALEXIS MORALES VARELA
%0901-23-6114
clc; clear; close all;
% Newton-Raphson Method for Systems of Nonlinear Equations

% Define the functions u(x, y) and v(x, y)
u = @(x, y) x^2 + x*y - 10;
v = @(x, y) y + 3*x*y^2 - 57;

% Define the Jacobian matrix
J = @(x, y) [2*x + y, x; 3*y^2, 1 + 6*x*y];

% Initial guess
x0 = 1;           % Initial guess for x
y0 = 3;           % Initial guess for y

% Tolerance (desired precision)
tol = 1e-6;       % Stop when the approximate relative error is less than 1e-6

% Maximum number of iterations
max_iter = 50;   % Increased to allow convergence

% Initialize variables
x = x0;           % Current value of x
y = y0;           % Current value of y
iter = 0;         % Iteration counter
error_approx = 100; % Initialize approximate relative error (start with 100%)

% Display table header
fprintf('Iteracion\t x_i\t\t y_i\t\t u(x_i, y_i)\t v(x_i, y_i)\t x_{i+1}\t\t y_{i+1}\t\t Aprox. Error Relativo (%%)\n');
fprintf('----------------------------------------------------------------------------------------------------\n');

% Newton-Raphson iteration loop
while error_approx > tol && iter < max_iter
    % Evaluate u(x_i, y_i) and v(x_i, y_i)
    u_val = u(x, y);
    v_val = v(x, y);
    
    % Evaluate the Jacobian matrix
    J_val = J(x, y);
    
    % Solve the system J * [dx; dy] = -[u; v] for [dx; dy]
    delta = J_val \ [-u_val; -v_val];

    % Compute the next approximation
    x_new = x + delta(1);
    y_new = y + delta(2);
    
    % Calculate the approximate relative error
    error_approx = max(abs((x_new - x) / x_new), abs((y_new - y) / y_new)) * 100;
    
    % Display the current iteration results
    fprintf('%d\t\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\n', iter, x, y, u_val, v_val, x_new, y_new, error_approx);
    
    % Update x and y for the next iteration
    x = x_new;
    y = y_new;
    
    % Increment the iteration counter
    iter = iter + 1;
end

% Display the final result
fprintf('\nRaiz aproximada: x = %.6f, y = %.6f\n', x, y);
fprintf('Iteraciones: %d\n', iter);