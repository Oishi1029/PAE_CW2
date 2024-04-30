% Define phasor data 
voltage_mag_resistance = 11.25;       % Magnitude of the voltage phasor
voltage_mag_reactance = 4.53;       % Magnitude of the voltage phasor
voltage_mag_primary = 12.14;       % Magnitude of the voltage phasor
current_mag_primary = 2.143;       % Magnitude of the voltage phasor

voltage_angle_resistance = 0;       % Angle of the voltage phasor (degrees)
voltage_uncertainty_resistance = 0.1; % Uncertainty in voltage magnitude

voltage_angle_reactance = 90;       % Angle of the voltage phasor (degrees)
voltage_uncertainty_reactance = 0.14; % Uncertainty in voltage magnitude

voltage_angle_primary = 0;       % Angle of the voltage phasor (degrees)
voltage_uncertainty_primary = 0.02; % Uncertainty in voltage magnitude

current_angle_primary = 21.95;       % Angle of the voltage phasor (degrees)
current_uncertainty_primary = 0.003; % Uncertainty in voltage magnitude


% Calculate phasor endpoints CORRECTLY using polar coordinates
end_vx_resistance = voltage_mag_resistance * cosd(voltage_angle_resistance);
end_vy_resistance = voltage_mag_resistance * sind(voltage_angle_resistance);

end_vx_reactance = voltage_mag_reactance * cosd(voltage_angle_reactance);
end_vy_reactance = voltage_mag_reactance * sind(voltage_angle_reactance);

end_vx_primary = voltage_mag_primary * cosd(voltage_angle_primary);
end_vy_primary = voltage_mag_primary * sind(voltage_angle_primary);

end_ix_primary = current_mag_primary * cosd(current_angle_primary);
end_iy_primary = current_mag_primary * sind(current_angle_primary);


% Create the figure
figure;
hold on;  

% Voltage uncertainty phasors
for offset = [-voltage_uncertainty_resistance, voltage_uncertainty_resistance]
    new_vx = end_vx_resistance + offset;
    new_vy = end_vy_resistance; 
    quiver(0, 0, new_vx, new_vy, 'LineWidth', 1, 'Color', 'r', 'LineStyle', '--','DisplayName', 'Copper Loss Voltage with Absolute Uncertainty');
    %text(new_vx,  new_vy, 'Vr_b', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom','FontSize', 12); 
end

for offset = [-voltage_uncertainty_reactance, voltage_uncertainty_reactance]
    new_vx = end_vx_reactance;
    new_vy = end_vy_reactance + offset;
    quiver(0, 0, new_vx, new_vy, 'LineWidth', 1, 'Color', 'r', 'LineStyle', '--','DisplayName', 'Leakage Voltage with Absolute Uncertainty');
    %text(new_vx,  new_vy, 'Vx_b', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom','FontSize', 12); 
end

for offset = [-voltage_uncertainty_primary, voltage_uncertainty_primary]
    new_vx = end_vx_primary + offset;
    new_vy = end_vy_primary;
    quiver(0, 0, new_vx, new_vy, 'LineWidth', 1, 'Color', 'r', 'LineStyle', '--','DisplayName', 'Primary Voltage with Absolute Uncertainty');
    %text(new_vx,  new_vy, 'Vx_b', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom','FontSize', 12); 
end

for offset = [-current_uncertainty_primary, current_uncertainty_primary]
    new_ix = end_ix_primary + offset;
    new_iy = end_iy_primary;
    quiver(0, 0, new_ix, new_iy, 'LineWidth', 1, 'Color', 'r', 'LineStyle', '--','DisplayName', 'Primary Current with Absolute Uncertainty');
    %text(new_vx,  new_vy, 'Vx_b', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom','FontSize', 12); 
end

quiver(0, 0, end_vx_resistance, end_vy_resistance, 'LineWidth', 2, 'Color', 'g', 'DisplayName', 'Copper Loss Voltage');
quiver(0, 0, end_vx_reactance, end_vy_reactance, 'LineWidth', 2, 'Color', 'b', 'DisplayName', 'Leakage Reactance Voltage ');
quiver(0, 0, end_vx_primary, end_vy_primary, 'LineWidth', 2, 'Color', 'm', 'DisplayName', 'Primary Voltage');
quiver(0, 0, end_ix_primary, end_iy_primary, 'LineWidth', 2, 'Color', 'k', 'DisplayName', 'Primary Current');
 
%max_magnitude = max([voltage_mag_resistance, voltage_mag_reactance, voltage_mag_primary, current_mag_primary]); 
%xlim([-max_magnitude - 2, max_magnitude + 2]); % Add some padding
%ylim([-max_magnitude - 2, max_magnitude + 2]); % Add some padding
% Labels, title, and legend 
xlabel('Real');
ylabel('Imaginary');
title('Phasor Diagram with Uncertainties');
legend();  
grid on; 
axis equal; % Ensures correct aspect ratio for phasors
