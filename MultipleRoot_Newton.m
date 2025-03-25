%RONALD ALEXIS MORALES VARELA
%0901-23-6114
clc; clear; close all;
% Modified Newton-Raphson Method for f(x) = x^3 - 5x^2 + 7x - 3 = 0 (multiple root)

% Define the function f(x), f'(x), and f''(x)
f = @(x) x^3 - 5*x^2 + 7*x - 3;          % f(x) = x^3 - 5x^2 + 7x - 3
df = @(x) 3*x^2 - 10*x + 7;              % f'(x) = 3x^2 - 10x + 7
d2f = @(x) 6*x - 10;                     % f''(x) = 6x - 10

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
fprintf('Iteracion\t x_i\t\t f(x_i)\t f''(x_i)\t f''''(x_i)\t x_{i+1}\t Aprox. Error Relativo (%%)\n');
fprintf('---------------------------------------------------------------------\n');

% Modified Newton-Raphson iteration loop
while error_approx > tol && iter < max_iter
    % Evaluate f(x_i), f'(x_i), and f''(x_i)
    fx = f(x);
    dfx = df(x);
    d2fx = d2f(x);
    
    % Check if the denominator is zero to avoid division by zero
    denominator = dfx^2 - fx * d2fx;
    if abs(denominator) < 1e-12
        fprintf('Denominador es aproximadamente 0. No se puede continuar con el método.\n');
        break;
    end
    
    % Compute the next approximation: x_{i+1} = x_i - [f(x_i) * f'(x_i)] / [f'(x_i)^2 - f(x_i) * f''(x_i)]
    x_new = x - (fx * dfx) / denominator;
    
    % Calculate the approximate relative error
    error_approx = abs((x_new - x) / x_new) * 100;
    
    % Display the current iteration results
    fprintf('%d\t\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\n', iter + 1, x, fx, dfx, d2fx, x_new, error_approx);
    
    % Update x for the next iteration
    x = x_new;
    
    % Increment the iteration counter
    iter = iter + 1;
end

% Display the final result
fprintf('\nRaiz aproximada: %.6f\n', x);
fprintf('Iteraciones: %d\n', iter);