%% ucid_jpg90
clc;clear all;close all;
if ~exist('UCID_JPG90','dir')
    mkdir('UCID_JPG90');
end
for i = 1:1338
    imgName = ['UCID\ucid',num2str(i,'%05d'),'.tif'];
    img = imread(imgName);
    imwrite(img,['UCID_JPG90\ucid',num2str(i,'%05d'),'.jpg'],'jpg','quality',90)
end