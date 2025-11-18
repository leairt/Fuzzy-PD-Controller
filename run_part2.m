%% Fuzzy PD Controller - Part 2 Simulation

clear all;
close all;
clc;

fprintf('==================================================\n');
fprintf('    Fuzzy PD Controller - Part 2\n');
fprintf('==================================================\n\n');

%% Load Fuzzy Inference System
fprintf('Loading Fuzzy Inference System...\n');
fis = readfis('fuzzyPDmodel.fis');
fprintf('FIS loaded successfully: %s\n\n', fis.Name);

%% Simulation Parameters
simulation_time = 20; % seconds

%% Run Simulink Model
fprintf('Opening and running fuzzyPDpart2.slx...\n');

try
    % Open the Simulink model
    open_system('fuzzyPDpart2');
    
    % Configure simulation parameters
    set_param('fuzzyPDpart2', 'StopTime', num2str(simulation_time));
    
    % Run the simulation
    fprintf('Simulation started (%.1f seconds)...\n', simulation_time);
    simout = sim('fuzzyPDpart2');

    fprintf('Simulation completed successfully!\n\n');
    
    fprintf('==================================================\n');
    fprintf('Results:\n');
    fprintf('==================================================\n');
    fprintf('The Simulink model is now open.\n');
    fprintf('View the Scope blocks to see the signal results:\n');
    fprintf('  - Control Signal\n');
    fprintf('  - Output Signal\n');
    fprintf('  - Fuzzy Inputs (Error and de/dt)\n\n');
    
catch ME
    fprintf('Error running simulation: %s\n', ME.message);
end

%% Test FIS with Sample Values
fprintf('--------------------------------------------------\n');
fprintf('Testing FIS with sample input values:\n');
fprintf('--------------------------------------------------\n');

% Test cases
test_cases = [
    -0.8, -0.5;  % Large negative error and derivative
    -0.3,  0.0;  % Small negative error, zero derivative
     0.0,  0.2;  % Zero error, positive derivative
     0.5, -0.3;  % Positive error, negative derivative
     0.8,  0.6;  % Large positive error and derivative
];

fprintf('\n  Error  | de/dt  | Control Output\n');
fprintf('--------------------------------------\n');
for i = 1:size(test_cases, 1)
    error_val = test_cases(i, 1);
    derivative_val = test_cases(i, 2);
    output = evalfis(fis, [error_val, derivative_val]);
    fprintf('%7.2f | %6.2f | %10.4f\n', error_val, derivative_val, output);
end

fprintf('\n==================================================\n');
fprintf('Part 2 simulation script completed.\n');
fprintf('==================================================\n\n');
