function tG = calculateMeanBouts(df,score)
%Calcaulate summary statistics belonging to specific bouts 
%It assumes df has 3 groups 


predf = df(df.Group == 1 & df.Score==score,:);
Gpre = groupsummary(predf,"Bout",{"mean","std","median","max","var"},'EMG');

durdf = df(df.Group == 2 & df.Score==score,:);
Gdur = groupsummary(durdf,"Bout",{"mean","std","median","max","var"},'EMG');

postdf = df(df.Group == 3 & df.Score==score,:);
Gpost = groupsummary(postdf,"Bout",{"mean","std","median","max","var"},'EMG');

tG = [Gpre{:,:};Gdur{:,:};Gpost{:,:}];

tG = [tG,[ones(size(Gpre,1),1);ones(size(Gdur,1),1)*2;ones(size(Gpost,1),1)*3]];

colNames = Gpre.Properties.VariableNames;
colNames{8} = 'Group';

tG = array2table(tG);
tG.Properties.VariableNames = colNames;