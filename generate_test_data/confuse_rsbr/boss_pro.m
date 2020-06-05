clc;clear all;close all;
labelFolder = {'0oir\','1rs\','2br\','3brrs\','4rsbr\'};
labelNum = length(labelFolder);
for i = 1:labelNum
    if ~exist(labelFolder{i},'dir')
        mkdir(labelFolder{i});
    end
end

RandStream.setGlobalStream(RandStream('mt19937ar','Seed',sum(100*clock)));
resize_factor = round(rand(10000,1)*0.3, 3) + 1.5;
blur_sigma = round(rand(10000,1)*0.3, 3) + 0.7;

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
    RsI = imresize(img,resize_factor(j),'bilinear');
    BrI = GaussianBlur(img,blur_sigma(j));
    BrRsI = imresize(BrI,resize_factor(j),'bilinear');
    RsBrI = GaussianBlur(RsI,blur_sigma(j));
    
    [rows,cols,~] = size(RsI);
    CropI = imcrop(RsI,[cols/2-31,rows/2-31,63,63]);
    imgBlockName = ['boss',num2str(j,'%05d'),'.tif'];
    imwrite(CropI,[labelFolder{2},imgBlockName]);
    
    [rows,cols,~] = size(BrI);
    CropI = imcrop(BrI,[cols/2-31,rows/2-31,63,63]);
    imgBlockName = ['boss',num2str(j,'%05d'),'.tif'];
    imwrite(CropI,[labelFolder{3},imgBlockName]);
    
    [rows,cols,~] = size(BrRsI);
    CropI = imcrop(BrRsI,[cols/2-31,rows/2-31,63,63]);
    imgBlockName = ['boss',num2str(j,'%05d'),'.tif'];
    imwrite(CropI,[labelFolder{4},imgBlockName]);
    
    [rows,cols,~] = size(RsBrI);
    CropI = imcrop(RsBrI,[cols/2-31,rows/2-31,63,63]);
    imgBlockName = ['boss',num2str(j,'%05d'),'.tif'];
    imwrite(CropI,[labelFolder{5},imgBlockName]);
end
