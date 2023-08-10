% This is a MATLAB Script written by Rikke Plougmann to plot VAMAS ISS files
clear all
close all
%title('ISS peak energies (high-energy "foot” of peaks)')

labels = {'C' 'N' 'O' 'F' 'Ne' 'Na', 'Mg', 'Al', 'Si','P','S','Cl','K','Ar',...
    'Ca','Sc','Ti','V','Cr','Mn','Fe','Ni','Co','Cu','Zn','Ga','Ge','As',...
    'Se','Br','Kr','Rb','Sr','Y','Zr','Nb','Mo','Tc','Ru','Rh','Pd','Ag','Cd','In','Sn','Sb','I','Te','Xe',...
    'Cs','Ba','Hf','Ta','W','Re','Os','Ir','Pt','Au','Hg','Tl','Pb','Bi','Po','At','Rn'};

mass = [12.011, 14.007, 15.999, 18.998, 20.180, 22.990, 24.305, ...
    26.982, 28.086, 30.974, 32.066, 35.453, 39.098, 39.948, ...
    40.078, 44.956, 47.88, 50.942, 51.996, 54.938, 55.845, 58.933, ...
    58.693, 63.546, 65.38, 69.723, 72.631, 74.922, 78.971, 79.904, 83.798,...
    85.468,87.62,88.906,91.224,92.906,95.95,98.907,101.07,...
    102.906,106.42,107.868,112.414,114.818,118.711,121.760,127.6,126.904,131.294,...
    132.905,137.328,178.49,180.948,183.85,186.207,190.23,192.22,195.08,196.967,...
    200.59,204.383,207.2,208.980,208.982,209.987,222.018];

energy = [279.5,339.4,390.9,455.8,478.0,524.2,543.3, ...
    577.7,590.5, 620.6, 630.9, 659.6, 685.9, 691.5, ...
    692.3,720.6,735.3,749.1,753.5,765.0,768.4,779.1,...
    778.3,793.4,798.6,809.9,816.7,821.8,830.2,832.0,839.1,...
    842.0,845.6,847.6,851.2,853.7,858.0,861.9,864.7,...
    866.9,871.0,872.7,877.5,879.9,883.6,886.3,891.2,890.7,894.1,...
    895.4,898.5,921.0,922.0,923.2,924.1,925.7,926.4,927.5,928.1,...
    929.4,930.7,931.6,932.1,932.1,932.4,936.0];


subplot(3,3,1);
plot(energy,mass,'k.','MarkerSize',20)
xlabel('Energy (eV)')
ylabel('Mass (amu)')
grid on
grid minor
ax = gca;
%ax.FontSize = 20;
xlim([250 680])
ylim([5 40])

labels = {'C' 'N' 'O' 'F' 'Ne' 'Na', 'Mg', 'Al', 'Si','P','S','Cl'};
mass = [12.011, 14.007, 15.999, 18.998, 20.180, 22.990, 24.305, ...
    26.982, 28.086, 30.974, 32.066,35.453];
energy = [279.5,339.4,390.9,455.8,478.0,524.2,543.3, ...
    577.7,590.5, 620.6, 630.9,659.6];
text(energy,mass,labels,'VerticalAlignment','top','HorizontalAlignment','left')


labels = {'K','Ar','Ca'};
mass = [39.098, 39.948, 40.078];
energy = [685.9, 691.5, 692.3];

subplot(3,3,2);
plot(energy,mass,'k.','MarkerSize',20)
xlabel('Energy (eV)')
ylabel('Mass (amu)')
grid on
grid minor
ax = gca;
%ax.FontSize = 20;
xlim([680 700])
text(energy,mass,labels,'VerticalAlignment','top','HorizontalAlignment','left')
ylim([38 41])

labels = {'Sc','Ti','V'};
mass = [44.956, 47.88, 50.942];
energy = [720.6,735.3,749.1];

subplot(3,3,3);
plot(energy,mass,'k.','MarkerSize',20)
xlabel('Energy (eV)')
ylabel('Mass (amu)')
grid on
grid minor
ax = gca;
%ax.FontSize = 20;
xlim([700 760])
text(energy,mass,labels,'VerticalAlignment','top','HorizontalAlignment','left')


labels = {'Mn','Fe','Ni'};
mass = [54.938, 55.845, 58.933];
energy = [765.0,768.4,779.1];

subplot(3,3,4);
plot(energy,mass,'k.','MarkerSize',20)
xlabel('Energy (eV)')
ylabel('Mass (amu)')
grid on
grid minor
ax = gca;
%ax.FontSize = 20;
xlim([760 782])
text(energy,mass,labels,'VerticalAlignment','top','HorizontalAlignment','left')
ylim([54 60])

labels = {'Cu','Zn','Ga','Ge','As','Se','Br'};
mass = [63.546, 65.38, 69.723, 72.631, 74.922, 78.971, 79.904];
energy = [793.4,798.6,809.9,816.7,821.8,830.2,832.0];

subplot(3,3,5);
plot(energy,mass,'k.','MarkerSize',20)
xlabel('Energy (eV)')
ylabel('Mass (amu)')
grid on
grid minor
ax = gca;
%ax.FontSize = 20;
xlim([782 835])
text(energy,mass,labels,'VerticalAlignment','top','HorizontalAlignment','left')
ylim([60 85])

labels = {'Kr','Rb','Sr','Y','Zr','Nb','Mo','Tc','Ru','Rh','Pd','Ag'};
mass = [83.798,85.468,87.62,88.906,91.224,92.906,95.95,98.907,101.07,...
    102.906,106.42,107.868];
energy = [839.1,842.0,845.6,847.6,851.2,853.7,858.0,861.9,864.7,...
    866.9,871.0,872.7];

subplot(3,3,6);
plot(energy,mass,'k.','MarkerSize',20)
xlabel('Energy (eV)')
ylabel('Mass (amu)')
grid on
grid minor
ax = gca;
%ax.FontSize = 20;
xlim([835 875])
text(energy,mass,labels,'VerticalAlignment','top','HorizontalAlignment','left')


labels = {'Cd','In','Sn','Sb'};
mass = [112.414,114.818,118.711,121.760];
energy = [877.5,879.9,883.6,886.3];

subplot(3,3,7);
plot(energy,mass,'k.','MarkerSize',20)
xlabel('Energy (eV)')
ylabel('Mass (amu)')
grid on
grid minor
ax = gca;
%ax.FontSize = 20;
xlim([875 890])
text(energy,mass,labels,'VerticalAlignment','top','HorizontalAlignment','left')
ylim([110 125])

labels = {'I','Te','Xe','Cs','Ba'};
mass = [127.6,126.904,131.294,132.905,137.328];
energy = [891.2,890.7,894.1,895.4,898.5];

subplot(3,3,8);
plot(energy,mass,'k.','MarkerSize',20)
xlabel('Energy (eV)')
ylabel('Mass (amu)')
grid on
grid minor
ax = gca;
%ax.FontSize = 20;
xlim([890 900])
text(energy,mass,labels,'VerticalAlignment','top','HorizontalAlignment','left')
ylim([125 138])


labels = {'Hf','Ta','W','Re','Os','Ir','Pt','Au','Hg','Tl','Pb','Bi'};
mass = [178.49,180.948,183.85,186.207,190.23,192.22,195.08,196.967,...
    200.59,204.383,207.2,208.980];
energy = [921.0,922.0,923.2,924.1,925.7,926.4,927.5,928.1,...
    929.4,930.7,931.6,932.1];

subplot(3,3,9);
plot(energy,mass,'k.','MarkerSize',20)
xlabel('Energy (eV)')
ylabel('Mass (amu)')
grid on
grid minor
ax = gca;
%ax.FontSize = 20;
xlim([920 933])
text(energy,mass,labels,'VerticalAlignment','top','HorizontalAlignment','left')
ylim([175 210])



