function finTable = combineScores(scoreFile,EMGArr)

scores= tdfread(scoreFile,',');

windSize = numel(scores.Score_0x23);


combEMG = [EMGArr,zeros(size(EMGArr,1),2)];

 idx = [0:size(EMGArr,1)/windSize:size(EMGArr,1)];

for i = 1:numel(idx)-1
    combEMG(idx(i)+1:idx(i+1),3) = scores.Score_0x23(i);
    combEMG(idx(i)+1:idx(i+1),4) = i;
end

sz = size(combEMG);
varTypes = ["double","double","double",'double'];
varNames = ["EMG","Group","Score",'Bout'];
finTable = table('Size',sz,'VariableTypes',varTypes,'VariableNames',varNames);
finTable{:,:} = combEMG;

