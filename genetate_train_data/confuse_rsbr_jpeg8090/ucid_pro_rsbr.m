clc;clear all;close all;
labelFolder = {'0ori','1rs','2br','3brrs','4rsbr'};
resize_factor = [1.5,1.6,1.7,1.8];
blur_sigma = [0.7,0.8,0.9,1.0];
labelNum = length(labelFolder);
for i = 1:labelNum
    if ~exist(labelFolder{i},'dir')
        mkdir(labelFolder{i});
    end
end
% for j = 1:1000
%     imgName = ['ucid',num2str(j,'%05d'),'.tif'];
%     imgDir = ['..\UCID\',imgName];
%     img = imread(imgDir);
%     %原始图像
%     [rows,cols,~] = size(img);
%     CropI = imcrop(img,[cols/2-127,rows/2-127,255,255]);
%     for m = 1:4
%         for n = 1:4
%             CropBlock = imcrop(CropI,[(n-1)*64+1,(m-1)*64+1,63,63]);
%             imgBlockName = ['ucid',num2str(j,'%05d'),'_',num2str((m-1)*4+n),'.jpg'];
%             imwrite(CropBlock,[labelFolder{1},'/',imgBlockName],'jpg','quality',80);
%         end
%     end
% end
clc;clear all;close all;
labelFolder = {'0oir','1rs','2br','3brrs','4rsbr'};
resize_factor = [1.5,1.6,1.7,1.8];
for i = 1:4
    Rsfolder = [labelFolder{2},'/rs',num2str(resize_factor(i)*10,'%02d')];
    if ~exist(Rsfolder,'dir')
        mkdir(Rsfolder);
        for j = 1:1000
            %%缩放图像
            imgName = ['ucid',num2str(j,'%05d'),'.jpg'];
            imgDir = ['..\UCID_JPG80\',imgName];
            img = imread(imgDir);
            %%图像缩放函数
            RsI = imresize(img,resize_factor(i),'bilinear');
            [rows,cols,~] = size(RsI);
            CropI = imcrop(RsI,[cols/2-127,rows/2-127,255,255]);
            for m = 1:4
                for n = 1:4
                    CropBlock = imcrop(CropI,[(n-1)*64+1,(m-1)*64+1,63,63]);
                    imgBlockName = ['ucid',num2str(j,'%05d'),'_',num2str((m-1)*4+n),'.jpg'];
                    imwrite(CropBlock,[Rsfolder,'/',imgBlockName],'jpg','quality',90);
                end
            end
        end
    end
end

clc;clear all;close all;
labelFolder = {'0oir','1rs','2br','3brrs','4rsbr'};
blur_sigma = [0.7,0.8,0.9,1.0];
for i = 1:4
    Brfolder = [labelFolder{3},'/br',num2str(blur_sigma(i)*10,'%02d')];
    if ~exist(Brfolder,'dir')
        mkdir(Brfolder);
        for j = 1:1000
            %% 模糊图像
            imgName = ['ucid',num2str(j,'%05d'),'.jpg'];
            imgDir = ['..\UCID_JPG80\',imgName];
            img = imread(imgDir);
            %%高斯模糊函数
            BrI = GaussianBlur(img,blur_sigma(i));
            [rows,cols,~] = size(BrI);
            CropI = imcrop(BrI,[cols/2-127,rows/2-127,255,255]);
            for m = 1:4
                for n = 1:4
                    CropBlock = imcrop(CropI,[(n-1)*64+1,(m-1)*64+1,63,63]);
                    imgBlockName = ['ucid',num2str(j,'%05d'),'_',num2str((m-1)*4+n),'.jpg'];
                    imwrite(CropBlock,[Brfolder,'/',imgBlockName],'jpg','quality',90);
                end
            end
        end
    end
end

clc;clear all;close all;
labelFolder = {'0oir','1rs','2br','3brrs','4rsbr'};
resize_factor = [1.5,1.6,1.7,1.8];
blur_sigma = [0.7,0.8,0.9,1.0];
for k = 1:4
    for l = 1:4
        BrRsfolder = [labelFolder{4},'/br',num2str(blur_sigma(k)*10,'%02d'),'rs',num2str(resize_factor(l)*10,'%02d')];
        if ~exist(BrRsfolder,'dir')
            mkdir(BrRsfolder)
            for j = 1:1000
                %模糊-缩放图像
                imgName = ['ucid',num2str(j,'%05d'),'.jpg'];
                imgDir = ['..\UCID_JPG80\',imgName];
                img = imread(imgDir);
                %高斯模糊处理
                BrI = GaussianBlur(img,blur_sigma(k));
                %缩放处理
                BrRsI = imresize(BrI,resize_factor(l),'bilinear');
                [rows,cols,~] = size(BrRsI);
                CropI = imcrop(BrRsI,[cols/2-127,rows/2-127,255,255]);
                for m = 1:4
                    for n = 1:4
                        CropBlock = imcrop(CropI,[(n-1)*64+1,(m-1)*64+1,63,63]);
                        imgBlockName = ['ucid',num2str(j,'%05d'),'_',num2str((m-1)*4+n),'.jpg'];
                        imwrite(CropBlock,[BrRsfolder,'/',imgBlockName],'jpg','quality',90);
                    end
                end
            end
        end
    end
end

clc;clear all;close all;
labelFolder = {'0oir','1rs','2br','3brrs','4rsbr'};
resize_factor = [1.5,1.6,1.7,1.8];
blur_sigma = [0.7,0.8,0.9,1.0];
for k = 1:4
    for l = 1:4
        RsBrfolder = [labelFolder{5},'/rs',num2str(resize_factor(k)*10,'%02d'),'br',num2str(blur_sigma(l)*10,'%02d')];
        if ~exist(RsBrfolder,'dir')
            mkdir(RsBrfolder);
            for j = 1:1000
                % 缩放-模糊图像
                imgName = ['ucid',num2str(j,'%05d'),'.jpg'];
                imgDir = ['..\UCID_JPG80\',imgName];
                img = imread(imgDir);
                %缩放处理
                RsI = imresize(img,resize_factor(l),'bilinear');
                %高斯模糊处理
                RsBrI = GaussianBlur(RsI,blur_sigma(l));
                [rows,cols,~] = size(RsBrI);
                CropI = imcrop(RsBrI,[cols/2-127,rows/2-127,255,255]);
                for m = 1:4
                    for n = 1:4
                        CropBlock = imcrop(CropI,[(n-1)*64+1,(m-1)*64+1,63,63]);
                        imgBlockName = ['ucid',num2str(j,'%05d'),'_',num2str((m-1)*4+n),'.jpg'];
                        imwrite(CropBlock,[RsBrfolder,'/',imgBlockName],'jpg','quality',90);
                    end
                end
            end
        end
    end
end