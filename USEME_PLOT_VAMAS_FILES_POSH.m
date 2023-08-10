% This is a MATLAB Script written by Rikke Plougmann to plot VAMAS ISS files
clear all
close all

% Import the first file (user select)
opts = delimitedTextImportOptions("NumVariables", 1);
opts.DataLines = [1, Inf];
opts.Delimiter = ",";
opts.VariableNames = "VAMASSurfaceChemicalAnalysisStandardDataTransferFormat1988May4";
opts.VariableTypes = "double";
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
[file,path] = uigetfile('*.vms');
path_file = [path file];
str2num(path_file);
data = readtable(path_file, opts);

% Convert to output type
data_num_matrix = table2array(data);
% Clear temporary variables
clear opts

starting_energy = data_num_matrix(61);
final_energy = starting_energy + data_num_matrix(74);
% Note! Need to multiply y by the CAE / CRR value to get the correct
% intensity
y = data_num_matrix(77:end-1).*data_num_matrix(48);
x = linspace(starting_energy,final_energy,931);

f1 = figure;

%ax1 = axes("OuterPosition",[0.23 0.32 1.14 1.24]);
%ax1 = axes("Position",[0.03 0.12 0.94 1.04]);
%ax1.PositionConstraint = "outerposition";
p1 = plot(x,y,'LineWidth',2,'Color',"#696AC2");
xlim([starting_energy final_energy]);
%ylim([0 max(y)+100]);
%set(gca, 'XAxisLocation', 'top')
%set(gca, 'box', 'off')

xlabel('Kinetic energy (eV)','Fontsize',16);
ylabel('Intensity (cts/s)','Fontsize',16);
ax = gca;
ytickformat('%.1e');

ax.FontSize = 20;
%yticks([200 400 600 800 1000 ])
x0=100;
y0=100;
width=500;
height=400
set(gcf,'position',[x0,y0,width,height])
%yticks([200 400 600 800 1000 ])

%legend('MR55 (5% 340k amu AuTi) post reaction');



