
%% Settings
Tmin = -10; % Min -90 ?C
Tmax = 36; % Max = 36 ?C
isoTemps = [0, 10, 20, 30];
% end settings

%% Define temperatures
T = (273.2+Tmin):0.1:(273.2+Tmax); % Tempertaure in K

%% Calculate properties
P = P_fun_T(T)./100000; % Pressure in bars
ro_g = ro_g_fun_T(T); % Density in kg/m3
ro_l = ro_l_fun_T(T); % Density in kg/m3
v_g = 1./ro_g; % Specific volume in m3/kg
v_l = 1./ro_l; % Specific volume in m3/kg

%% Plot graph
fig = figure;
hold on;
legTexts = {};

% Plot the isolines
for isoT = isoTemps
  isoT = isoT + 273.2;
  plot([1/ro_l_fun_T(isoT), 1/ro_g_fun_T(isoT)], [P_fun_T(isoT)./100000, P_fun_T(isoT)./100000]);
  legTexts{end + 1} = ['isoTemp at ' num2str(isoT - 273.2) 'ºC'];
end

% Plot the bell
p1 = plot(v_g, P, 'Color', 'k');
p2 = plot(v_l, P, 'Color', 'k');

% Add the legend
legTexts{end + 1} = 'Phase change';
legend(legTexts);

xlabel 'Specific volume [m^3/kg]'
ylabel 'Pressure [bar]'

hold off;