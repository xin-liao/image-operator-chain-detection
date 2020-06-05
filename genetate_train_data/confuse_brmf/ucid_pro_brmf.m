clc;clear all;close all;
labelFolder = {'0oir','1br','2mf','3mfbr','4brmf'};
labelNum = length(labelFolder);
for i = 1:labelNum
    if ~exist(labelFolder{i},'dir')
        mkdir(labelFolder{i});
    end
end
for j = 1:1000
    imgName = ['ucid',num2str(j,'%05d'),'.tif'];
    imgDir = ['..\UCID\',imgName];
    img = imread(imgDir);
    %%原始图像
    [rows,cols,~] = size(img);
    CropI = imcrop(img,[cols/2-127,rows/2-127,255,255]);
    for m = 1:4
        for n = 1:4
            CropBlock = imcrop(CropI,[(n-1)*64+1,(m-1)*64+1,63,63]);
            imgBlockName = ['ucid',num2str(j,'%05d'),'_',num2str((m-1)*4+n),'.tif'];
            imwrite(CropBlock,[labelFolder{1},'/',imgBlockName]);
        end
    end
end

clc;clear all;close all;
labelFolder = {'0oir','1br','2mf','3mfbr','4brmf'};
blur_sigma = [0.7,0.8,0.9,1.0];
for i = 1:4
    Brfolder = [labelFolder{2},'/br',num2str(blur_sigma(i)*10,'%02d')];
    if ~exist(Brfolder,'dir')
        mkdir(Brfolder);
        for j = 1:1000
            %% 高斯模糊图像
            imgName = ['ucid',num2str(j,'%05d'),'.tif'];
            imgDir = ['..\UCID\',imgName];
            img = imread(imgDir);
            %%高斯模糊处理
            BrI = GaussianBlur(img,blur_sigma(i));
            [rows,cols,~] = size(BrI);
            CropI = imcrop(BrI,[cols/2-127,rows/2-127,255,255]);
            for m = 1:4
                for n = 1:4
                    CropBlock = imcrop(CropI,[(n-1)*64+1,(m-1)*64+1,63,63]);
                    imgBlockName = ['ucid',num2str(j,'%05d'),'_',num2str((m-1)*4+n),'.tif'];
                    imwrite(CropBlock,[Brfolder,'/',imgBlockName]);
                end
            end
        end
    end
end

clc;clear all;close all;
labelFolder = {'0oir','1br','2mf','3mfbr','4brmf'};
windowSize = [3,5];
for i = 1:2
    Mffolder = [labelFolder{3},'/mf',num2str(windowSize(i),'%02d')];
    if ~exist(Mffolder,'dir')
        mkdir(Mffolder);
        for j = 1:1000
            %% 模糊图像
            imgName = ['ucid',num2str(j,'%05d'),'.tif'];
            imgDir = ['..\UCID\',imgName];
            img = imread(imgDir);
            %%中值滤波函数
            MfI = MedianBlur(img,windowSize(i));
            [rows,cols,~] = size(MfI);
            CropI = imcrop(MfI,[cols/2-127,rows/2-127,255,255]);
            for m = 1:4
                for n = 1:4
                    CropBlock = imcrop(CropI,[(n-1)*64+1,(m-1)*64+1,63,63]);
                    imgBlockName = ['ucid',num2str(j,'%05d'),'_',num2str((m-1)*4+n),'.tif'];
                    imwrite(CropBlock,[Mffolder,'/',imgBlockName]);
                end
            end
        end
    end
end

clc;clear all;close all;
labelFolder = {'0oir','1br','2mf','3mfbr','4brmf'};
blur_sigma = [0.7,0.8,0.9,1.0];
windowSize = [3,5];
for k = 1:2
    for l = 1:4
        MfBrfolder = [labelFolder{4},'/mf',num2str(windowSize(k),'%02d'),'br',num2str(blur_sigma(l)*10,'%02d')];
        if ~exist(MfBrfolder,'dir')
            mkdir(MfBrfolder)
            for j = 1:1000
                %%中值滤波-高斯模糊
                imgName = ['ucid',num2str(j,'%05d'),'.tif'];
                imgDir = ['..\UCID\',imgName];
                img = imread(imgDir);
                %%中值滤波函数
                MfI = MedianBlur(img,windowSize(k));
                %%高斯模糊处理
                MfBrI = GaussianBlur(MfI,blur_sigma(l));
                [rows,cols,~] = size(MfBrI);
                CropI = imcrop(MfBrI,[cols/2-127,rows/2-127,255,255]);
                for m = 1:4
                    for n = 1:4
                        CropBlock = imcrop(CropI,[(n-1)*64+1,(m-1)*64+1,63,63]);
                        imgBlockName = ['ucid',num2str(j,'%05d'),'_',num2str((m-1)*4+n),'.tif'];
                        imwrite(CropBlock,[MfBrfolder,'/',imgBlockName]);
                    end
                end
            end
        end
    end
end

clc;clear all;close all;
labelFolder = {'0oir','1br','2mf','3mfbr','4brmf'};
blur_sigma = [0.7,0.8,0.9,1.0];
windowSize = [3,5];
for k = 1:4
    for l = 1:2
        BrMffolder = [labelFolder{5},'/br',num2str(blur_sigma(k)*10,'%02d'),'mf',num2str(windowSize(l),'%02d')];
        if ~exist(BrMffolder,'dir')
            mkdir(BrMffolder);
            for j = 1:1000
                %% 高斯模糊-中值滤波
                imgName = ['ucid',num2str(j,'%05d'),'.tif'];
                imgDir = ['..\UCID\',imgName];
                img = imread(imgDir);
                %%高斯模糊处理
                BrI = GaussianBlur(img,blur_sigma(k));
                %%中值滤波函数
                BrMfI = MedianBlur(BrI,windowSize(l));
                [rows,cols,~] = size(BrMfI);
                CropI = imcrop(BrMfI,[cols/2-127,rows/2-127,255,255]);
                for m = 1:4
                    for n = 1:4
                        CropBlock = imcrop(CropI,[(n-1)*64+1,(m-1)*64+1,63,63]);
                        imgBlockName = ['ucid',num2str(j,'%05d'),'_',num2str((m-1)*4+n),'.tif'];
                        imwrite(CropBlock,[BrMffolder,'/',imgBlockName]);
                    end
                end
            end
        end
    end
end