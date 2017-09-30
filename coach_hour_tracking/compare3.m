%""""""""""""""""""""""""""""""""""""""""""""""""""%
%ME-EM ELC coach hour tracking, cost tracking code.%
%Author-1: Aneet Dharmavaram Narendranath, PhD     %
%Author-2: Sarah Jalal (ELC GTA)                   %
%Version 3.0                                       %
%Date: 9/30/2017                                   %
%""""""""""""""""""""""""""""""""""""""""""""""""""%

%% Initialization cell
f=dir('./*.csv'); %Imports all csv files in current folder into workspace
nCoach=numel(f);
for i=1:1:nCoach
    data{i}=importfile(f(i).name); %Cell array that holds
    %the data (expected vs actual for each week) of all coaches.
end

%% Calculation/processing cell
week=2;
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
plot(cell2mat(error), 'k*-')
grid on;
axis([1 18 -5 5]);
%After plotting, change the number of x-ticks. 
xticklabels( {'Adam A.','Anna W.','Brittany S.','Daanish T.','David A.','Elizabeth B.','Erica J.','Jacob P.','Jesse L.','John S.','Julia S.','Marcello G.','Max E.','Paras G.','Riley S.','Robbie T.','Robert M.','Siddhant D.'})

%% Check for conservation of hours for this week
nHoursThisWeek=0.;
avgSalary=10.7;
nExpected=1100/avgSalary;
for j=1:1:nCoach
    nHoursThisWeek=nHoursThisWeek+actual{j};
    %Next version: create an array with nHoursThisWeek that captures the
    %actual number of hours worked every week.  For this an outside for
    %loop may be necessary that loops over "week" number.
end

%As long as nHoursThisWeek <= nExpected... we are safe!
%% Cost this week (Sum(coach_actual * salary_hour, nCoach))
%This needs an array called salary to be created. 
%It has nCoach entries and the entries are individual coach salaries.
%It stays constant for a semester. 
%May need a "for" loop or while statement to cycle through "nCoach" number
%of coaches and "nCoach" number of salary/hour.

avgSalary=10.66; %dollars per hour

costThisWeek=nHoursThisWeek*avgSalary;

for k=1:1:week
    costThisWeek=nHoursThisWeek*avgSalary;
    %Next version: a costThisWeek_array will be created that will hold the
    %per week cost of running the ELC.
end

%eof