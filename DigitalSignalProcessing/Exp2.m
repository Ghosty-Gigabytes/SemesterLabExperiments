% Experiment 1: Implement basic arithmatic, matrix and array operations in matlab
clc;
clear;
close all;



a = 10;
b = 3;

disp('Basic Arithmetic Operations');
fprintf('a = %d\n', a);
fprintf('b = %d\n', b);

fprintf('Addition: %d\n', a + b);
fprintf('Subtraction: %d\n', a - b);
fprintf('Multiplication: %d\n', a * b);
fprintf('Division: %.2f\n', a / b);
fprintf('Power: %d\n', a^b);
fprintf('Modulus: %d\n', mod(a, b));




x = 25;

fprintf('\nSquare Root: %.2f\n', sqrt(x));
fprintf('Natural Log: %.2f\n', log(x));
fprintf('Base-10 Log: %.2f\n', log10(x));
fprintf('Exponential (e^2): %.2f\n', exp(2));
fprintf('Absolute Value: %d\n', abs(-15));




angle = pi/4;

fprintf('\nsin(pi/4): %.2f\n', sin(angle));
fprintf('cos(pi/4): %.2f\n', cos(angle));
fprintf('tan(pi/4): %.2f\n', tan(angle));




A = [1 2; 3 4];
B = [5 6; 7 8];

disp(' ');
disp('Matrix A:');
disp(A);

disp('Matrix B:');
disp(B);

disp('Matrix Addition (A + B):');
disp(A + B);

disp('Matrix Subtraction (A - B):');
disp(A - B);

disp('Matrix Multiplication (A * B):');
disp(A * B);

disp('Element-wise Multiplication (A .* B):');
disp(A .* B);

disp('Transpose of A:');
disp(A');

fprintf('Determinant of A: %.2f\n', det(A));

disp('Inverse of A:');
disp(inv(A));

disp('Matrix Power (A^2):');
disp(A^2);

disp('Element-wise Power (A.^2):');
disp(A.^2);




arr1 = [1 2 3 4 5];
arr2 = [5 4 3 2 1];

disp(' ');
disp('Array Operations');

disp('Array 1:');
disp(arr1);

disp('Array 2:');
disp(arr2);


disp('Addition:');
disp(arr1 + arr2);

disp('Subtraction:');
disp(arr1 - arr2);


disp('Multiplication:');
disp(arr1 .* arr2);


disp('Division:');
disp(arr1 ./ arr2);


disp('Power:');
disp(arr1 .^ 2);


fprintf('First element of Array 1: %d\n', arr1(1));
fprintf('Third element of Array 1: %d\n', arr1(3));
fprintf('Last element of Array 1: %d\n', arr1(end));


fprintf('Length of Array 1: %d\n', length(arr1));


fprintf('Sum of Array 1: %d\n', sum(arr1));


fprintf('Mean of Array 1: %.2f\n', mean(arr1));


fprintf('Maximum: %d\n', max(arr1));
fprintf('Minimum: %d\n', min(arr1));


disp('Sorted Array 1:a');
disp(sort(arr1));


disp('Concatenated Array:');
disp([arr1 arr2]);




x = linspace(0, 2*pi, 100);
y = sin(x);

figure;
plot(x, y);
grid on;
title('Sine Wave');
xlabel('x');
ylabel('sin(x)');
