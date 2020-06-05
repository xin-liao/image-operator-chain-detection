clc;clear all;close all;
labelFolder = {'0oir\','1br\','2sp\','3spbr\','4brsp\'};
labelNum = length(labelFolder);
for i = 1:labelNum
    if ~exist(labelFolder{i},'dir')
        mkdir(labelFolder{i});
    end
end
blur_sigma = 1.0;
for j = 1:10000
    imgDir = ['F:\boss_ppm\',num2str(j),'.ppm'];
    img = imread(imgDir);
    BrI = GaussianBlur(img,blur_sigma);
    SpI = imsharpen(img,'Radius',3);
    
    SpBrI = GaussianBlur(SpI,blur_sigma);
    BrSpI = imsharpen(BrI,'Radius',3);
    
    [rows,cols,~] = size(img);
    CropI = imcrop(img,[cols/2-31,rows/2-31,63,63]);
    imgBlockName = ['boss',num2str(j,'%05d'),'.tif'];
    imwrite(CropI,[labelFolder{1},imgBlockName]);
    
    [rows,cols,~] = size(BrI);
    CropI = imcrop(BrI,[cols/2-31,rows/2-31,63,63]);
    imgBlockName = ['boss',num2str(j,'%05d'),'.tif'];
    imwrite(CropI,[labelFolder{2},imgBlockName]);
    
    [rows,cols,~] = size(SpI);
    CropI = imcrop(SpI,[cols/2-31,rows/2-31,63,63]);
    imgBlockName = ['boss',num2str(j,'%05d'),'.tif'];
    imwrite(CropI,[labelFolder{3},imgBlockName]);
    
    [rows,cols,~] = size(SpBrI);
    CropI = imcrop(SpBrI,[cols/2-31,rows/2-31,63,63]);
    imgBlockName = ['boss',num2str(j,'%05d'),'.tif'];
    imwrite(CropI,[labelFolder{4},imgBlockName]);
    
    [rows,cols,~] = size(BrSpI);
    CropI = imcrop(BrSpI,[cols/2-31,rows/2-31,63,63]);
    imgBlockName = ['boss',num2str(j,'%05d'),'.tif'];
    imwrite(CropI,[labelFolder{5},imgBlockName]);
end
