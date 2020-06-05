clc;clear all;close all;
labelFolder = {'imgset\0oir\','imgset\1rs\','imgset\2br\','imgset\3brrs\','imgset\4rsbr\'};
labelNum = length(labelFolder);
for i = 1:labelNum
    if ~exist(labelFolder{i},'dir')
        mkdir(labelFolder{i});
    end
end
resize_factor = 1.5;
blur_sigma = 1.0;
for j = 1:1000
    imgName = ['ucid',num2str(j,'%05d'),'.tif'];
    imgDir = ['E:\order_forensics\UCID\',imgName];
    img = imread(imgDir);
    [rows,cols,channels] = size(img);
    %% Ô­Ê¼Í¼Ïñ
    CropI = imcrop(img,[cols/2-127,rows/2-127,255,255]);
    for m = 1:4
        for n = 1:4
            CropBlock = imcrop(CropI,[(n-1)*64+1,(m-1)*64+1,63,63]);
            imgBlockName = ['ucid',num2str(j,'%05d'),'_',num2str((m-1)*4+n),'.tif'];
            imwrite(CropBlock,[labelFolder{1},imgBlockName]);
        end
    end
end
for j = 1:1000
    imgName = ['ucid',num2str(j,'%05d'),'.tif'];
    imgDir = ['E:\order_forensics\UCID\',imgName];
    img = imread(imgDir);
    [rows,cols,channels] = size(img);
    RsI = imresize(img,resize_factor,'bilinear');
    BrI = GaussianBlur(img,blur_sigma);
    BrRsI = imresize(BrI,resize_factor,'bilinear');
    RsBrI = GaussianBlur(RsI,blur_sigma);
   %% Ëõ·ÅÍ¼Ïñ
    CropI = imcrop(RsI,[cols/2-127,rows/2-127,255,255]);
    for m = 1:4
        for n = 1:4
            CropBlock = imcrop(CropI,[(n-1)*64+1,(m-1)*64+1,63,63]);
            imgBlockName = ['ucid',num2str(j,'%05d'),'_',num2str((m-1)*4+n),'.tif'];
            imwrite(CropBlock,[labelFolder{2},imgBlockName]);
        end
    end
    %% Ä£ºýÍ¼Ïñ
    CropI = imcrop(BrI,[cols/2-127,rows/2-127,255,255]);
    for m = 1:4
        for n = 1:4
            CropBlock = imcrop(CropI,[(n-1)*64+1,(m-1)*64+1,63,63]);
            imgBlockName = ['ucid',num2str(j,'%05d'),'_',num2str((m-1)*4+n),'.tif'];
            imwrite(CropBlock,[labelFolder{3},imgBlockName]);
        end
    end
    %% Ä£ºý-Ëõ·ÅÍ¼Ïñ
    CropI = imcrop(BrRsI,[cols/2-127,rows/2-127,255,255]);
    for m = 1:4
        for n = 1:4
            CropBlock = imcrop(CropI,[(n-1)*64+1,(m-1)*64+1,63,63]);
            imgBlockName = ['ucid',num2str(j,'%05d'),'_',num2str((m-1)*4+n),'.tif'];
            imwrite(CropBlock,[labelFolder{4},imgBlockName]);
        end
    end
   %% Ëõ·Å-Ä£ºýÍ¼Ïñ
    CropI = imcrop(RsBrI,[cols/2-127,rows/2-127,255,255]);
    for m = 1:4
        for n = 1:4
            CropBlock = imcrop(CropI,[(n-1)*64+1,(m-1)*64+1,63,63]);
            imgBlockName = ['ucid',num2str(j,'%05d'),'_',num2str((m-1)*4+n),'.tif'];
            imwrite(CropBlock,[labelFolder{5},imgBlockName]);
        end
    end
end
