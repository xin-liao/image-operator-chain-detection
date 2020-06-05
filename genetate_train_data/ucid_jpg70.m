%% UCID_jpg75
clc;clear all;close all;
if ~exist('UCID_JPG70','dir')
    mkdir('UCID_JPG70');
end
for i = 1:1338
    imgName = ['UCID\ucid',num2str(i,'%05d'),'.tif'];
    img = imread(imgName);
    imwrite(img,['UCID_JPG70\ucid',num2str(i,'%05d'),'.jpg'],'jpg','quality',70)
end