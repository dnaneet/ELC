f=dir('./*.csv')
for i=1:1:numel(f)
    data{i}=importfile(f(i).name)
end