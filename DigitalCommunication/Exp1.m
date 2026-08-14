% Experiment 1: Implement basic arithmatic operations in matlab
clc;        % Clear command window
clear;      % Clear workspace
close all;  % Close all figure windows

% Variables
a = 10;
b = 3;

% Display output
disp('Basic Arithmetic Operations');
fprintf('a = %d\n', a);
fprintf('b = %d\n', b);

% Arithmetic
fprintf('Addition: %d\n', a + b);
fprintf('Subtraction: %d\n', a - b);
fprintf('Multiplication: %d\n', a * b);
fprintf('Division: %.2f\n', a / b);
fprintf('Power: %d\n', a^b);
fprintf('Modulus: %d\n', mod(a, b));

% Mathematical Functions
x = 25;

fprintf('\nSquare Root: %.2f\n', sqrt(x));
fprintf('Natural Log: %.2f\n', log(x));
fprintf('Base-10 Log: %.2f\n', log10(x));
fprintf('Exponential (e^2): %.2f\n', exp(2));
fprintf('Absolute Value: %d\n', abs(-15));

% Trigonometric Functions
angle = pi/4;

fprintf('\nsin(pi/4): %.2f\n', sin(angle));
fprintf('cos(pi/4): %.2f\n', cos(angle));
fprintf('tan(pi/4): %.2f\n', tan(angle));

% Plotting
x = linspace(0, 2*pi, 100);
y = sin(x);

figure;
plot(x, y);
grid on;
title('Sine Wave');
xlabel('x');
ylabel('sin(x)');