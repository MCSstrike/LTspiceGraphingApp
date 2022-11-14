%% Solomon Machin 10/11/2022
%  100308845
%  UEA Analogue and Digital Electronics CW1
%  LTspice data processing for graph outputs


%% User Inputs
%  Data location
fileLocation = 'C:\temp';
%  Data file name
fileName = 'WholeSimulation.txt';
%  Plot title
plotTitle = '555 Plot';
%  Running time (μ seconds)
runTime = 500;
%  Number of different readings (MUST NOT EXCEED 6)
readingNo = 2;

%% Import
data = importdata(append(fileLocation, '\', fileName));
time = 100000000 * data.data(:, 1);

figure('Name', plotTitle);
p = plot(time, data.data(:, 2))
hold on
for i = 3:readingNo+1
    plot(time, data.data(:, i))
end
hold off

title(plotTitle);
xlabel('time (μs)');
ylabel('Voltage');

if readingNo == 1
    legend(string(data.textdata(2)));
elseif readingNo == 2
    legend(string(data.textdata(2)), string(data.textdata(3)));
elseif readingNo == 3
    legend(string(data.textdata(2)), string(data.textdata(3)), string(data.textdata(4)));
elseif readingNo == 4
    legend(string(data.textdata(2)), string(data.textdata(3)), string(data.textdata(4)), string(data.textdata(5)));
elseif readingNo == 5
    legend(string(data.textdata(2)), string(data.textdata(3)), string(data.textdata(4)), string(data.textdata(5)), string(data.textdata(6)));
elseif readingNo == 6
    legend(string(data.textdata(2)), string(data.textdata(3)), string(data.textdata(4)), string(data.textdata(5)), string(data.textdata(6)), string(data.textdata(7)));
end

set(gca, 'xtick', 0:100:runTime);
set(gca, 'xticklabel', {'0','100','200','300','400','500'});
set(gca, 'xlim', [0, runTime]);
