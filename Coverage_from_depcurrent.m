close all
clear all

opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = "\t";
opts.VariableNames = ["Id", "VarName2"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
% Import the data
Sample22027depcurrent = readtable("C:\Users\Rikke PhD\OneDrive - Danmarks Tekniske Universitet\RIKKE\PROJECTS\Rikkes AuTi mappe\Last samples - Filippo\Deposition currents of samples\FMR05\FMR05_depcurrent2.txt", opts);
Sample22027depcurrent = table2cell(Sample22027depcurrent);
numIdx = cellfun(@(x) ~isnan(str2double(x)), Sample22027depcurrent);
Sample22027depcurrent(numIdx) = cellfun(@(x) {str2double(x)}, Sample22027depcurrent(numIdx));
clear opts

time = cell2mat(Sample22027depcurrent(27:end,1));
current = cell2mat(Sample22027depcurrent(27:end,2));
current_smooth = -1.*smoothdata(current,'gaussian',50);
%current_smooth = smoothdata(current,'gaussian',50);

plot(time,current_smooth)

% First background
t1 = 1;
t2 = 290;
% Dep current
t3 = 336;
t4 = 13028;

%  t1ii = 121337;
%  t2ii = 121647;
%  t3ii = 103748;
%  t4ii = 121042;

% Last background
t5 = 13098;
t6 = 13479;

background1_time = time(t1:t2);
background1_current = current_smooth(t1:t2);

dep1_time = time(t3:t4);
dep1_current = current_smooth(t3:t4);

background2_time = time(t5:t6);
background2_current = current_smooth(t5:t6);
% 
% background3_time = time(t1ii:t2ii);
% background3_current = current_smooth(t1ii:t2ii);

% dep2_time = time(t3ii:t4ii);
% dep2_current = current_smooth(t3ii:t4ii);

hold on
plot(background1_time,background1_current,'r')
plot(dep1_time,dep1_current,'g')
plot(background2_time,background2_current,'m')

% plot(background3_time,background3_current,'r')
% plot(dep2_time,dep2_current,'g')

%%
% We must integrate under the signal
% First, we integrate the area to zero
% We need to know the X spacing interval to get the correct number

Sdep = size(dep1_time);
n1 = Sdep(1) - 1;
n2 = Sdep(1);

% Sdep = size(dep2_time);
% n1 = Sdep(1) - 1;
% n2 = Sdep(1);

charge = trapz(dep1_time,dep1_current) 
%charge2 = trapz(dep2_time,dep2_current) 

hold on

xverts = [dep1_time(1:n1)'; dep1_time(1:n1)'; dep1_time(2:n2)'; dep1_time(2:n2)'];
yverts = [zeros(1,n1); dep1_current(1:n1)'; dep1_current(2:n2)'; zeros(1,n1)];
p = patch(xverts,yverts,'b','LineWidth',1.5);

% Now we need to subtract the background signal "baseline"
background_val1 = mean(background1_current);
background_val2 = mean(background2_current);
%background_val3 = mean(background3_current);

leak_x = [dep1_time(1);dep1_time(n2)];
leak_y = [background_val1;background_val2];
hold on
xverts_leak = [leak_x(1); leak_x(1); leak_x(2); leak_x(2)];
yverts_leak = [0; leak_y(1); leak_y(2); 0];
p = patch(xverts_leak,yverts_leak,'m','LineWidth',1.5);

back_charge = trapz(leak_x,leak_y)

Total_charge = charge - back_charge;
e = 1.60217663e-19;
No_particles = Total_charge/e
NP_dia = 3.7; % nm
d_eff = 11; % effective aperture for Ejler_stub_fast in mm

radius_NP = (NP_dia/2)*10^(-9); % in m
area_NP = pi*radius_NP^2;
NP_coverage = area_NP*No_particles;
radius_eff = (d_eff/2)*10^(-3); % in m
total_area = pi*(radius_eff)^2;

Coverage = (NP_coverage/total_area)*100