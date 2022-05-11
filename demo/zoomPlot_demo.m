% This script generates a figure to demonstrate ZoomPlot capability on.
% You need to install the tool from File Exchange or Add-on Explorer.
% Kepeng Qiu (2022). ZoomPlot (https://github.com/iqiukp/ZoomPlot-MATLAB/releases/tag/v1.3.1), GitHub. Retrieved April 27, 2022.
% Copyright 2022 The MathWorks, Inc

%% Define x and y data
x = linspace(0,4*pi,200)';
y = x.^2.*(1+rand(size(x)));
figure
plot(x,y)
xlim([min(x), max(x)]);
hold on

%% fit an exponential function to data
f1 = fit(x,y,'smoothingspline');
plot(f1)
legend hide
ylim([0,300])
grid on

%% Try zoomPlot
% zp = BaseZoom();
% zp.plot;