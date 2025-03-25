%RONALD ALEXIS MORALES VARELA
%0901-23-6114
clc; clear; close all;

% Fixed-Point Iteration Method for f(x) = e^(-x) - x = 0
% The function g(x) = e^(-x) is used for iteration.

% Define the function g(x) = e^(-x)
g = @(x) exp(-x);

% Initial guess
x0 = 0;           % Starting point for the iteration

% Tolerance (desired precision)
tol = 1e-6;       % Stop when the approximate relative error is less than 1e-6

% Maximum number of iterations
max_iter = 100;   % To prevent infinite loops

% Initialize variables
x = x0;           % Current value of x
iter = 1;         % Iteration counter (starting from 1)
error_approx = 100; % Initialize approximate relative error (start with 100%)

% Display table header
fprintf('Iteracion\t x_i\t\t x_{i+1}\t\t Aprox. Error Relativo (%%)\n');
fprintf('------------------------------------------------------------\n');

% Fixed-point iteration loop
while error_approx > tol && iter <= max_iter
    % Compute the next approximation: x_{i+1} = g(x_i)
    x_new = g(x);
    
    % Calculate the approximate relative error
    error_approx = abs((x_new - x) / x_new) * 100;
    
    % Display the current iteration results
    fprintf('%d\t\t %.6f\t %.6f\t %.6f\n', iter, x, x_new, error_approx);
    
    % Update x for the next iteration
    x = x_new;
    
    % Increment the iteration counter
    iter = iter + 1;
end

% Display the final result
fprintf('\nRaiz aproximada: %.6f\n', x);
fprintf('Iteraciones: %d\n', iter-1);  % Subtract 1 to show the actual number of iterations