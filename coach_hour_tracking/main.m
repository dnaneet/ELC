clear all;
clc;
close all;
%% 
weekNumber=11;
nHrsActThisWk =[];
nHrsExpThisWk = [];
costExpThisWk=[];
costActThisWk=[];
for jj=1:1:weekNumber
    [temp_nHrsActThisWk, temp_nHrsExpThisWk, temp_costExpThisWk, temp_costActThisWk]=compare34(jj);
%     nHrsActThisWk(jj,1) = temp_nHrsActThisWk;
    nHrsActThisWk = [nHrsActThisWk; temp_nHrsActThisWk];
    nHrsExpThisWk = [nHrsExpThisWk; temp_nHrsExpThisWk];
    costActThisWk = [costActThisWk; temp_costActThisWk];
    costExpThisWk = [costExpThisWk; temp_costExpThisWk];
end

nHrsAct_cumulative = cumsum(nHrsActThisWk);
nHrsExp_cumulative = cumsum(nHrsExpThisWk);
costAct_cumulative = cumsum(costActThisWk);
costExp_cumulative = cumsum(costExpThisWk);

%% Graphical comparison of actual vs expected hours
marker_size=12;
subplot(2,2,1)
plot(nHrsActThisWk, 'b+', 'markersize', marker_size);
hold on;
y = mean(nHrsActThisWk);
line([0,weekNumber+1],[y,y], 'color', 'k', 'linewidth', 2,'LineStyle','-.')
plot(nHrsExpThisWk, 'r*', 'markersize', marker_size);
ylabel('Hours', 'fontsize', 16)
xlabel('Week number', 'fontsize', 16)
title('Actual vs Expected hours')
legend('Actual hours','Arithmetic mean','Expected hours','Location','southeast')

xt = get(gca, 'XTick');
yt = get(gca, 'Ytick');
set(gca, 'FontSize', 16)
%% Graphical comparison of actual vs expected cost

subplot(2,2,2)
plot(costActThisWk, 'b ^', 'markersize', marker_size);
hold on;
y = mean(costActThisWk);
line([0,weekNumber+1],[y,y], 'color', 'k', 'linewidth', 2,'LineStyle','-.')
plot(costExpThisWk, 'r O', 'markersize', marker_size);
ylabel('Cost ($)', 'fontsize', 16)
xlabel('Week number', 'fontsize', 16)
title('Actual vs Expected cost')
legend('Actual cost','Arithmetic mean','Expected cost','Location','southeast')

xt = get(gca, 'XTick');
yt = get(gca, 'Ytick');
set(gca, 'FontSize', 16)
%% Comparison of Actual vs Expected hours (in cumulative fashion)
subplot(2,2,3)
plot(nHrsAct_cumulative, 'b+', 'markersize', marker_size);
hold on;
plot(nHrsExp_cumulative, 'r*', 'markersize', marker_size);
ylabel('Hours', 'fontsize', 16)
xlabel('Week number', 'fontsize', 16)
title('Actual vs Expected hours (cumulative)')
legend('Actual hours (cumulative)','Expected hours (cumulative)','Location','southeast')
title('Actual vs Expected hours per week (cumulative)')

xt = get(gca, 'XTick');
yt = get(gca, 'Ytick');
set(gca, 'FontSize', 16)
%% Comparison of Actual vs Expected cost (in cumulative fashion)
subplot(2,2,4)
plot(costAct_cumulative, 'b ^', 'markersize', marker_size);
hold on;
plot(costExp_cumulative, 'r O', 'markersize', marker_size);
ylabel('Cost ($)', 'fontsize', 16)
xlabel('Week number', 'fontsize', 16)
title('Actual vs Expected cost (cumulative)')
legend('Actual cost (cumulative)','Expected cost (cumulative)','Location','southeast')
title('Actual vs Expected cost per week (cumulative)')


xt = get(gca, 'XTick');
yt = get(gca, 'Ytick');
set(gca, 'FontSize', 16)

%eof