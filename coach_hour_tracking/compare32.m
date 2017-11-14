%""""""""""""""""""""""""""""""""""""""""""""""""""%
%ME-EM ELC coach hour tracking, cost tracking code.%
%Author-1: Aneet Dharmavaram Narendranath, PhD     %
%Author-2: Sarah Jalal (ELC GTA)                   %
%Version 3.2                                      %
%Date: 11/14/2017                                   %
%""""""""""""""""""""""""""""""""""""""""""""""""""%

%% Initialization cell
clear all;
f=dir('./*.csv'); %Imports all csv files in current folder into workspace
nCoach=numel(f);
for i=1:1:nCoach
    data{i}=importfile(f(i).name); %Cell array that holds
    %the data (expected vs actual for each week) of all coaches.
end

%% Calculation/processing cell
week=4;
clear totalHours; %Not sure if I use this.
rng=1:8; %range. Did not use in ver 1.0.
         %Monday-Saturday + Review + Total in individual excel sheets
for i=1:1:nCoach
    expected{i} = data{i}(end,2*week);
    actual{i} = data{i}(end,2*week+1);
    error{i} = expected{i} - actual{i};
end

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
plot(cell2mat(error), 'k*-')
% Create axes
%axes1 = axes('Parent',figure1);
%hold(axes1,'on');

grid on;
axis([1 18 -5 5]);
%After plotting, change the number of x-ticks. 
%set(axes1,'XTick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18],...
%    'XTickLabel',...
%    {'Adam A.','Anna W.','Brittany S.','Daanish T.','David A.','Elizabeth B.','Erica J.','Jacob P.','Jesse L.','John S.','Julia S.','Marcello G.','Max E.','Paras G.','Riley S.','Robbie T.','Robert M.','Siddhant D.'});

% the xticklabels function above, works for MATLAB r2016 and above.  IF you have
% MATLAB r2015, please follow the appropriate section
%xticklabels( {'Adam A.','Anna W.','Brittany S.','Daanish T.','David A.','Elizabeth B.','Erica J.','Jacob P.','Jesse L.','John S.','Julia S.','Marcello G.','Max E.','Paras G.','Riley S.','Robbie T.','Robert M.','Siddhant D.'})

%MATLAB r2015 ticklabels
xt={'Adam A.','Anna W.','Brittany S.','Daanish T.','David A.','Elizabeth B.','Erica J.','Jacob P.','Jesse L.','John S.','Julia S.','Marcello G.','Max E.','Paras G.','Riley S.','Robbie T.','Robert M.','Siddhant D.'}
set(gca,'xticklabel',xt);

%% Check for conservation of hours for this week
nHoursActualThisWeek=0.;
nHoursExpectedThisWeek=0.;
avgSalary=10.7;

%Expected total hours this week and actual total hours this week.
for j=1:1:nCoach
    nHoursExpectedThisWeek=nHoursExpectedThisWeek + expected{j};
    nHoursActualThisWeek=nHoursActualThisWeek+actual{j};
end

%As long as nHoursThisWeek <= nExpected... we are safe!
%% Cost this week (Sum(coach_actual * salary_hour, nCoach))
%This needs an array called salary to be created. 
%It has nCoach entries and the entries are individual coach salaries.
%It stays constant for a semester. 
%May need a "for" loop or while statement to cycle through "nCoach" number
%of coaches and "nCoach" number of salary/hour.

avgSalary=10.66; %dollars per hour

costExpectedThisWeek=nHoursExpectedThisWeek * avgSalary;
costThisWeek=nHoursActualThisWeek*avgSalary;

%Next version: cost until now.

%% Report creation
clc;
week_info = ['Week number: ', num2str(week)];

hour_info_exp = ['Expected hours: ', num2str(nHoursExpectedThisWeek)];
hour_info_act = ['Actual hours: ', num2str(nHoursActualThisWeek),'  [',num2str(nHoursActualThisWeek*100/nHoursExpectedThisWeek),'% of expected hours worked]'];
cost_info_exp = ['Expected salary this week: $', num2str(costExpectedThisWeek)];
cost_info_act = ['Actual salary this week: $', num2str(costThisWeek)];
% disp('""""""""""""""""""""')
disp(week_info)
% disp('********************')
disp(hour_info_exp)
disp(hour_info_act)
% disp('********************')
disp(cost_info_exp)
disp(cost_info_act)
% disp('""""""""""""""""""""')



%eof