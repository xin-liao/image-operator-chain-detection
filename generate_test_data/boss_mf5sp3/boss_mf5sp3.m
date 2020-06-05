clc;clear all;close all;
labelFolder = {'0oir\','1mf\','2sp\','3spmf\','4mfsp\'};
labelNum = length(labelFolder);
for i = 1:labelNum
    if ~exist(labelFolder{i},'dir')
        mkdir(labelFolder{i});
    end
end
%% ÖÐÖµÂË²¨´°¿Ú
mf_factor = 5;
%%
for j = 1:10000
    imgDir = ['F:\boss_ppm\',num2str(j),'.ppm'];
    img = imread(imgDir);
    [rows,cols,~] = size(img);
    CropI = imcrop(img,[cols/2-31,rows/2-31,63,63]);
    imgBlockName = ['boss',num2str(j,'%05d'),'.tif'];
    imwrite(CropI,[labelFolder{1},imgBlockName]);
end
for j = 1:10000
    imgDir = ['F:\boss_ppm\',num2str(j),'.ppm'];
    img = imread(imgDir);
    MfI = MedianBlur(img,mf_factor);
    SpI = imsharpen(img,'Radius',3);
    SpMfI = MedianBlur(SpI,mf_factor);
    MfSpI = imsharpen(MfI,'Radius',3);
    
    [rows,cols,~] = size(MfI);
    CropI = imcrop(MfI,[cols/2-31,rows/2-31,63,63]);
    imgBlockName = ['boss',num2str(j,'%05d'),'.tif'];
    imwrite(CropI,[labelFolder{2},imgBlockName]);
    
    [rows,cols,~] = size(SpI);
    CropI = imcrop(SpI,[cols/2-31,rows/2-31,63,63]);
    imgBlockName = ['boss',num2str(j,'%05d'),'.tif'];
    imwrite(CropI,[labelFolder{3},imgBlockName]);
    
    [rows,cols,~] = size(SpMfI);
    CropI = imcrop(SpMfI,[cols/2-31,rows/2-31,63,63]);
    imgBlockName = ['boss',num2str(j,'%05d'),'.tif'];
    imwrite(CropI,[labelFolder{4},imgBlockName]);
    
    [rows,cols,~] = size(MfSpI);
    CropI = imcrop(MfSpI,[cols/2-31,rows/2-31,63,63]);
    imgBlockName = ['boss',num2str(j,'%05d'),'.tif'];
    imwrite(CropI,[labelFolder{5},imgBlockName]);
end
