f=dir('./*.csv');
nCoach=numel(f);
for i=1:1:nCoach
    data{i}=importfile(f(i).name);
end

week=1;
clear totalHours;
rng=1:8; 
for i=1:1:nCoach
    expected{i} = data{i}(end,2*week);
    actual{i} = data{i}(end,2*week+1);
    error{i} = expected{i} - actual{i};
end

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

%% Cost this week (Sum(coach_actual * salary_hour, nCoach))
