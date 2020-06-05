function [BlurI] = GaussianBlur(img,sigma)
    kernel = fspecial('gaussian',[5,5],sigma);
    BlurI = imfilter(img,kernel);
end