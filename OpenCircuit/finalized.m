% Define phasor data 
current_mag_resistance = 0.159;       % Magnitude of the current phasor
current_mag_reactance = 0.122;       % Magnitude of the current phasor
current_mag_primary = 0.097;       % Magnitude of the current phasor
voltage_mag_primary = 110/1000;       % Magnitude of the current phasor

current_angle_resistance = 0;       % Angle of the current phasor (degrees)
current_uncertainty_resistance = 0.004; % Uncertainty in current magnitude

current_angle_reactance = -90;       % Angle of the current phasor (degrees)
current_uncertainty_reactance = 0.002; % Uncertainty in current magnitude

voltage_angle_primary = 0;       % Angle of the current phasor (degrees)
voltage_uncertainty_primary = (((0.04/110)*100)*(110/1000))/100; % Uncertainty in current magnitude

current_angle_primary = 52.54;       % Angle of the current phasor (degrees)
current_uncertainty_primary = 0.001; % Uncertainty in current magnitude


% Calculate phasor endpoints CORRECTLY using polar coordinates
end_ix_resistance = current_mag_resistance * cosd(current_angle_resistance);
end_iy_resistance = current_mag_resistance * sind(current_angle_resistance);

end_ix_reactance = current_mag_reactance * cosd(current_angle_reactance);
end_iy_reactance = current_mag_reactance * sind(current_angle_reactance);

end_ix_primary = current_mag_primary * cosd(current_angle_primary);
end_iy_primary = current_mag_primary * sind(current_angle_primary);

end_vx_primary = voltage_mag_primary * cosd(voltage_angle_primary);
end_vy_primary = voltage_mag_primary * sind(voltage_angle_primary);


% Create the figure
figure;
hold on;  

% Current uncertainty phasors
for offset = [-current_uncertainty_resistance, current_uncertainty_resistance]
    new_ix = end_ix_resistance + offset;
    new_iy = end_iy_resistance; 
    quiver(0, 0, new_ix, new_iy, 'LineWidth', 1, 'Color', 'r', 'LineStyle', '--','DisplayName', 'Core Loss Current with Absolute Uncertainty');
    %text(new_vx,  new_vy, 'Vr_b', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom','FontSize', 12); 
end

for offset = [-current_uncertainty_reactance, current_uncertainty_reactance]
    new_ix = end_ix_reactance;
    new_iy = end_iy_reactance + offset;
    quiver(0, 0, new_ix, new_iy, 'LineWidth', 1, 'Color', 'r', 'LineStyle', '--','DisplayName', 'Magnetising Current with Absolute Uncertainty');
    %text(new_vx,  new_vy, 'Vx_b', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom','FontSize', 12); 
end

for offset = [-current_uncertainty_primary, current_uncertainty_primary]
    new_ix = end_ix_primary + offset;
    new_iy = end_iy_primary;
    quiver(0, 0, new_ix, new_iy, 'LineWidth', 1, 'Color', 'r', 'LineStyle', '--','DisplayName', 'Primary Current with Absolute Uncertainty');
    %text(new_vx,  new_vy, 'Vx_b', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom','FontSize', 12); 
end

for offset = [-voltage_uncertainty_primary, voltage_uncertainty_primary]
    new_vx = end_vx_primary + offset;
    new_vy = end_vy_primary;
    quiver(0, 0, new_vx, new_vy, 'LineWidth', 1, 'Color', 'r', 'LineStyle', '--','DisplayName', 'Primary Voltage with Absolute Uncertainty');
    %text(new_vx,  new_vy, 'Vx_b', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom','FontSize', 12); 
end

quiver(0, 0, end_ix_resistance, end_iy_resistance, 'LineWidth', 2, 'Color', 'g', 'DisplayName', 'Core Loss Current');
quiver(0, 0, end_ix_reactance, end_iy_reactance, 'LineWidth', 2, 'Color', 'b', 'DisplayName', 'Magnetising Current ');
quiver(0, 0, end_vx_primary, end_vy_primary, 'LineWidth', 2, 'Color', 'm', 'DisplayName', 'Primary Voltage');
quiver(0, 0, end_ix_primary, end_iy_primary, 'LineWidth', 2, 'Color', 'k', 'DisplayName', 'Primary Current');
 
%max_magnitude = max([current_mag_resistance, current_mag_reactance, current_mag_primary, current_mag_primary]); 
%xlim([-max_magnitude - 2, max_magnitude + 2]); % Add some padding
%ylim([-max_magnitude - 2, max_magnitude + 2]); % Add some padding
% Labels, title, and legend 
xlabel('Real');
ylabel('Imaginary');
title('Phasor Diagram with Uncertainties');
legend();  
grid on; 
axis equal; % Ensures correct aspect ratio for phasors


