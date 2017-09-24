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
plot(cell2mat(error))
xticks([1:18])
