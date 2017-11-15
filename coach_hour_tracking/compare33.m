%""""""""""""""""""""""""""""""""""""""""""""""""""%
%ME-EM ELC coach hour tracking, cost tracking code.%
%Author-1: Aneet Dharmavaram Narendranath, PhD     %
%Author-2: Sarah Jalal (ELC GTA)                   %
%Version 3.1                                       %
%Date: 10/01/2017                                   %
%""""""""""""""""""""""""""""""""""""""""""""""""""%
% function ELC(plottingweek)
%% Initialization cell
f=dir('./*.csv'); %Imports all csv files in current folder into workspace
nCoach=numel(f);
for i=1:1:nCoach
    data{i}=importfile(f(i).name); %Cell array that holds
    %the data (expected vs actual for each week) of all coaches.
end
temp=1;
%% Calculation/processing cell
plottingweek=3;
for week= 1:1:plottingweek
clear totalHours; %Not sure if I use this.
rng=1:8; %range. Did not use in ver 1.0.
         %Monday-Saturday + Review + Total in individual excel sheets
for i=1:1:nCoach
    expected{week,i} = data{i}(8,2*week);
    actual{week,i} = data{i}(8,2*week+1);
    error{week,i} = expected{week,i} - actual{week,i};
end
end
temp=2;
%% Plotting. Validation cell.
lab={};%Create empty cell for plot labels
for i=1:1:nCoach
    s=f(i).name;
    ix=strfind(s,'.csv');
    %s(1:ix-1) %Assertion statement for debugging only.
    lab=[lab, s(1:ix-1)];
end
figure1 = figure; %Figure number.  This allows us to operate on figure properties 
%such as number of ticks. 
errorplot=cell2mat(error);
plot(errorplot(plottingweek,:), 'k*-')% Create axes
%axes1 = axes('Parent',figure1);
%hold(axes1,'on');

grid on;
axis([1 18 -5 5]);
%After plotting, change the number of x-ticks. 
%set(axes1,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18],...
%    'XTickLabel',...
%    {'Adam A.','Anna W.','Brittany S.','Daanish T.','David A.','Elizabeth B.','Erica J.','Jacob P.','Jesse L.','John S.','Julia S.','Marcello G.','Max E.','Paras G.','Riley S.','Robbie T.','Robert M.','Siddhant D.'});
xticklabels( {'Adam A.','Anna W.','Brittany S.','Daanish T.','David A.','Elizabeth B.','Erica J.','Jacob P.','Jesse L.','John S.','Julia S.','Marcello G.','Max E.','Paras G.','Riley S.','Robbie T.','Robert M.','Siddhant D.'})
temp=3
%% Check for conservation of hours for this week
nHoursActualThisWeek=0.;
nHoursExpectedThisWeek=0.;
nHoursActualAllWeeks=0.;
nHoursExpectedAllWeeks=0.;

avgSalary=10.7;

%Expected total hours this week and actual total hours this week.

for j=1:1:nCoach
    nHoursExpectedThisWeek=nHoursExpectedThisWeek + expected{plottingweek,j};
    nHoursActualThisWeek=nHoursActualThisWeek+actual{plottingweek,j};
end

%%Expected total hours all weeks and actual total hours all weeks.

for week= 1:plottingweek
for j=1:1:nCoach
    nHoursExpectedAllWeeks=nHoursExpectedAllWeeks + expected{week,j};
    nHoursActualAllWeeks=nHoursActualAllWeeks+actual{week,j};
end
end
temp=4;
%As long as nHoursThisWeek <= nExpected... we are safe!
%% Cost this week (Sum(coach_actual * salary_hour, nCoach))
%This needs an array called salary to be created. 
%It has nCoach entries and the entries are individual coach salaries.
%It stays constant for a semester. 
%May need a "for" loop or while statement to cycle through "nCoach" number
%of coaches and "nCoach" number of salary/hour.

avgSalary=10.7; %dollars per hour

costExpectedThisWeek=nHoursExpectedThisWeek * avgSalary;
costThisWeek=nHoursActualThisWeek*avgSalary;
costExpectedAllWeeks=nHoursExpectedAllWeeks*avgSalary;
costActualAllWeeks=nHoursActualAllWeeks*avgSalary;

temp=temp+1;
%Next version: cost until now.

%% Report creation
clc;
week_info = ['Week number: ', num2str(plottingweek)];

hour_info_exp = ['Expected hours: ', num2str(nHoursExpectedThisWeek)];
hour_info_act = ['Actual hours: ', num2str(nHoursActualThisWeek),'  [',num2str(nHoursActualThisWeek*100/nHoursExpectedThisWeek),'% of expected hours worked]'];
cost_info_exp = ['Expected salary this week: $', num2str(costExpectedThisWeek)];
cost_info_act = ['Actual salary this week: $', num2str(costThisWeek)];
hour_info_exp_all= ['Total Expected hours:' , num2str(nHoursExpectedAllWeeks)];
hour_info_act_all= ['Total Actual hours:' , num2str(nHoursActualAllWeeks)];
cost_info_exp_all = ['Expected salary All weeks: $', num2str(costExpectedAllWeeks)];
cost_info_act_all = ['Actual salary All weeks: $', num2str(costActualAllWeeks)];

% disp('""""""""""""""""""""')
disp(week_info)
% disp('********************')
disp(hour_info_exp)
disp(hour_info_act)
% disp('********************')
disp(cost_info_exp)
disp(cost_info_act)
disp(hour_info_exp_all)
disp(hour_info_act_all)
disp(cost_info_exp_all)
disp(cost_info_act_all)
% disp('""""""""""""""""""""')

temp=temp+1;