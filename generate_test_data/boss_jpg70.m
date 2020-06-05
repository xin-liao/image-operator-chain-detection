%% boss_jpg70
clc;clear all;close all;
if ~exist('boss_jpg70','dir')
    mkdir('boss_jpg70');
end
for i = 1:10000
    imgName = ['../boss_ppm/',num2str(i,'%d'),'.ppm'];
    img = imread(imgName);
    imwrite(img,['boss_jpg70/boss',num2str(i,'%05d'),'.jpg'],'jpg','quality',70)
end