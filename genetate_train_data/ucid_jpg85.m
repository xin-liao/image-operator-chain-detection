%% ucid_jpg85
clc;clear all;close all;
if ~exist('UCID_JPG85','dir')
    mkdir('UCID_JPG85');
end
for i = 1:1338
    imgName = ['UCID\ucid',num2str(i,'%05d'),'.tif'];
    img = imread(imgName);
    imwrite(img,['UCID_JPG85\ucid',num2str(i,'%05d'),'.jpg'],'jpg','quality',85)
end