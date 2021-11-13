function F_val = cost_function( x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global Xtr Ytr xtest ytest
fold=1;
part1='-s 0 -t 2 -g ';
part2=num2str(x(1));
part3='  -c ';
part4=num2str(x(2));
part5=' -e ';
part6=num2str(0.01); 
part7=' %-n 1';
parameters=[part1 part2 part3 part4 part5 part6 part7];
% Test and Train Data
TrPercent = 80;
DataNum = size(Xtr,1);
TrNum = round(DataNum * TrPercent / 100);
TsNum = DataNum - TrNum;

F_val = 0;
%UNTITLED Summ

for i=1:fold
R = randperm(DataNum);
trIndex = R(1 : TrNum);
tsIndex = R(1+TrNum : end);

Xtrf = Xtr(trIndex,:);
Ytrf = Ytr(trIndex,:);

Xtsf = Xtr(tsIndex,:);
Ytsf = Ytr(tsIndex,:);

model = svmtrain(Ytrf, Xtrf, parameters);
[predict_label, accuracy, dec_values] = svmpredict(Ytrf, Xtrf, model);
[predict_label2, accuracy2, dec_values] = svmpredict(Ytsf, Xtsf, model);
F_val=F_val-accuracy2(1,1);
end
F_val=F_val/(fold);
