%%label_txt
clc;clear all;close all;
firstFolderList = dir('./');
firstFolderName = {firstFolderList.name}';
count = 1;
for i = 3:length(firstFolderName)
    if firstFolderList(i).isdir == 1
        if i == 3
            oriImgList = dir(firstFolderName{i});
            oriImgName = {oriImgList.name}';
            for j = 3:length(oriImgName)
                trainList{count} = ['/0ori/',oriImgName{j},' ',num2str(i-3)];
                count =count + 1;
            end
        else
            secondFolderList = dir(firstFolderName{i});
            secondFolderName = {secondFolderList.name}';
            for k = 3:length(secondFolderName)
                proImgList = dir([firstFolderName{i},'/',secondFolderName{k}]);
                proImgName = {proImgList.name}';
                for l = 3:length(proImgName)
                    trainList{count} = ['/',firstFolderName{i},'/',secondFolderName{k},'/',proImgName{l},' ',num2str(i-3)];
                    count = count + 1;
                end
            end
        end
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

