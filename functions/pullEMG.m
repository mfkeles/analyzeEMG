function retArr = pullEMG(fileName,EMGIdx)
%Extracts EMG data from EDF file

[~,record] = edfread(fileName);

%divide into 10 min bins, 3 is EMG data
EMG = record(EMGIdx,:)';

N = numel(EMG)/3; % window size
X = size(EMG,1)-1;
Y = [N*ones(1,fix(X/N)),1+rem(X,N)];

%create a new array with pre labeled a 1, during 2 and post 3
C = mat2cell(EMG,Y,1);

%return a matrix 
retArr = [[C{1},ones(numel(C{1}),1)]; [C{2},ones(numel(C{2}),1)*2];[C{3},ones(numel(C{3}),1)*3]];