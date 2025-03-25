%RONALD ALEXIS MORALES VARELA
%0901-23-6114
clc; clear; close all;

% Newton-Raphson Method for f(x) = e^(-x) - x = 0

% Define the function f(x) and its derivative f'(x)
f = @(x) exp(-x) - x;       % f(x) = e^(-x) - x
df = @(x) -exp(-x) - 1;     % f'(x) = -e^(-x) - 1

% Initial guess
x0 = 0;           % Starting point for the iteration

% Tolerance (desired precision)
tol = 1e-6;       % Stop when the approximate relative error is less than 1e-6

% Maximum number of iterations
max_iter = 100;   % To prevent infinite loops

% Initialize variables
x = x0;           % Current value of x
iter = 0;         % Iteration counter
error_approx = 100; % Initialize approximate relative error (start with 100%)

% Display table header
fprintf('%d\t\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\n', iter, x, f(x), df(x), NaN, error_approx);
fprintf('----------------------------------------------------------------------------------------\n');

% Newton-Raphson iteration loop
while error_approx > tol && iter < max_iter
    % Evaluate f(x_i) and f'(x_i)
    fx = f(x);
    dfx = df(x);
    
    % Compute the next approximation: x_{i+1} = x_i - f(x_i)/f'(x_i)
    x_new = x - fx / dfx;
    
    % Calculate the approximate relative error
    error_approx = abs((x_new - x) / x_new) * 100;
    
    % Display the current iteration results
    fprintf('%d\t\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\n', iter, x, fx, dfx, x_new, error_approx);
    
    % Update x for the next iteration
    x = x_new;
    
    % Increment the iteration counter
    iter = iter + 1;
end

% Display the final result
fprintf('\nRaiz aproximada: %.6f\n', x);
fprintf('Iteraciones: %d\n', iter);