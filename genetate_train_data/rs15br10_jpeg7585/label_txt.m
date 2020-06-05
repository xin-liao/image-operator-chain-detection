clc;clear all;close all;
folderList = dir('.\');
folderName = {folderList.name}';
count = 1;
label = 0;
for i = 3:length(folderName)
    if folderList(i).isdir==1
        imgList = dir(folderName{i});
        imgName = {imgList.name}';
        for j = 3:length(imgName)
            trainList{count} = ['/',folderName{i},'/',imgName{j},' ',num2str(label)];
            count = count + 1;
        end
        label = label + 1;
    end
end
trainList = trainList';
imgNum = length(trainList);
perm = randperm(imgNum);
trainShuffle = trainList(perm);

ftrain = fopen('train_label.txt','w');
for i = 1:floor(imgNum*0.8)
    fprintf(ftrain,[trainShuffle{i},'\n']);
end
fclose(ftrain);

fval = fopen('val_label.txt','w');
for i = floor(imgNum*0.8)+1:imgNum
    fprintf(fval,[trainShuffle{i},'\n']);
end
fclose(fval);