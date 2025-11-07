%% Fuzzy PD Controller - Visualization and Analysis

clear all;
close all;
clc;

fprintf('==================================================\n');
fprintf('    Fuzzy PD Controller - Visualization\n');
fprintf('==================================================\n\n');

%% Load Fuzzy Inference System
fprintf('Loading Fuzzy Inference System...\n');
fis = readfis('fuzzyPDmodel.fis');

fprintf('FIS Information:\n');
fprintf('  Name: %s\n', fis.Name);
fprintf('  Type: %s\n', fis.Type);
fprintf('  Number of Inputs: %d\n', fis.NumInputs);
fprintf('  Number of Outputs: %d\n', fis.NumOutputs);
fprintf('  Number of Rules: %d\n\n', fis.NumRules);

%% Plot Input Membership Functions
fprintf('Plotting membership functions...\n');

% Figure 1: Error Input MFs
figure('Name', 'Error Input Membership Functions', 'NumberTitle', 'off');
plotmf(fis, 'input', 1);
title('Error (e) - Membership Functions');
xlabel('Error Value');
ylabel('Degree of Membership');
grid on;

% Figure 2: Error Derivative Input MFs
figure('Name', 'Error Derivative Membership Functions', 'NumberTitle', 'off');
plotmf(fis, 'input', 2);
title('Error Derivative (de/dt) - Membership Functions');
xlabel('Error Derivative Value');
ylabel('Degree of Membership');
grid on;

% Figure 3: Control Output MFs
figure('Name', 'Control Output Membership Functions', 'NumberTitle', 'off');
plotmf(fis, 'output', 1);
title('Control Signal (u) - Membership Functions');
xlabel('Control Output Value');
ylabel('Degree of Membership');
grid on;

%% Plot Control Surface
fprintf('Generating control surface...\n');

figure('Name', 'Fuzzy PD Controller - Control Surface', 'NumberTitle', 'off');
gensurf(fis);
title('Fuzzy PD Controller Surface');
xlabel('Error (e)');
ylabel('Error Derivative (de/dt)');
zlabel('Control Output (u)');
colorbar;
grid on;

%% Plot 2D Control Surface Contours
fprintf('Generating contour plot...\n');

% Generate grid for contour plot
error_range = linspace(-1, 1, 50);
deriv_range = linspace(-1, 1, 50);
[E, D] = meshgrid(error_range, deriv_range);
U = zeros(size(E));

% Evaluate FIS for all grid points
for i = 1:size(E, 1)
    for j = 1:size(E, 2)
        U(i,j) = evalfis(fis, [E(i,j), D(i,j)]);
    end
end

figure('Name', 'Control Surface - Contour Plot', 'NumberTitle', 'off');
contourf(E, D, U, 20);
colorbar;
title('Fuzzy PD Controller - Contour Plot');
xlabel('Error (e)');
ylabel('Error Derivative (de/dt)');
grid on;

%% Rule Viewer
fprintf('Opening rule viewer...\n');
try
    ruleview(fis);
    fprintf('Rule viewer opened successfully.\n');
catch
    fprintf('Note: Rule viewer requires GUI. Skipping...\n');
end

%% Display Sample FIS Evaluations
fprintf('\n==================================================\n');
fprintf('Sample FIS Evaluations:\n');
fprintf('==================================================\n');
fprintf('\n  Error  | de/dt  | Control Output | Description\n');
fprintf('--------------------------------------------------------------\n');

test_data = [
    -1.0, -1.0, 'Large negative error & derivative';
    -0.5,  0.0, 'Medium negative error, no derivative';
     0.0,  0.0, 'Zero error, zero derivative';
     0.0,  0.5, 'No error, positive derivative';
     0.5,  0.0, 'Medium positive error, no derivative';
     0.5,  0.5, 'Positive error & derivative';
     1.0,  1.0, 'Large positive error & derivative';
];

for i = 1:size(test_data, 1)
    error_val = test_data{i, 1};
    deriv_val = test_data{i, 2};
    desc = test_data{i, 3};
    output = evalfis(fis, [error_val, deriv_val]);
    fprintf('%7.2f | %6.2f | %10.4f     | %s\n', error_val, deriv_val, output, desc);
end

%% Summary
fprintf('\n==================================================\n');
fprintf('Visualization Complete\n');
fprintf('==================================================\n');
fprintf('Generated plots:\n');
fprintf('  1. Error Membership Functions\n');
fprintf('  2. Error Derivative Membership Functions\n');
fprintf('  3. Control Output Membership Functions\n');
fprintf('  4. 3D Control Surface\n');
fprintf('  5. 2D Contour Plot\n\n');
fprintf('Use run_fuzzy_pd_controller.m to run full simulations.\n');
fprintf('Use run_part1.m or run_part2.m to run individual parts.\n\n');
