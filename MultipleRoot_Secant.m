%RONALD ALEXIS MORALES VARELA
%0901-23-6114
clc; clear; close all;
% Secant Method for f(x) = e^(-x) - x = 0

% Define the function f(x)
f = @(x) exp(-x) - x;

% Initial guesses
x0 = 0.5;           % First initial guess
x1 = 10;           % Second initial guess

% Tolerance (desired precision)
tol = 1e-6;       % Stop when the approximate relative error is less than 1e-6

% Maximum number of iterations
max_iter = 100;   % To prevent infinite loops

% Initialize variables
x_prev = x0;      % x_{i-1}
x_curr = x1;      % x_i
iter = 0;         % Iteration counter
error_approx = 100; % Initialize approximate relative error (start with 100%)

% Display table header
fprintf('Iteracion\t x_{i-1}\t\t x_i\t\t f(x_{i-1})\t f(x_i)\t\t x_{i+1}\t\t Aprox. Error relativo (%%)\n');
fprintf('----------------------------------------------------------------------------------------------------\n');

% Secant iteration loop
while error_approx > tol && iter < max_iter
    % Evaluate f(x_{i-1}) and f(x_i)
    f_prev = f(x_prev);
    f_curr = f(x_curr);
    
    % Compute the next approximation: x_{i+1} = x_i - f(x_i) * (x_i - x_{i-1}) / (f(x_i) - f(x_{i-1}))
    x_next = x_curr - f_curr * (x_curr - x_prev) / (f_curr - f_prev);
    
    % Calculate the approximate relative error
    error_approx = abs((x_next - x_curr) / x_next) * 100;
    
    % Display the current iteration results
    fprintf('%d\t\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\n', iter+1, x_prev, x_curr, f_prev, f_curr, x_next, error_approx);
    
    % Update x_{i-1} and x_i for the next iteration
    x_prev = x_curr;
    x_curr = x_next;
    
    % Increment the iteration counter
    iter = iter + 1;
end

% Display the final result
fprintf('\nRaiz aproximada: %.6f\n', x_curr);
fprintf('Iteraciones: %d\n', iter);