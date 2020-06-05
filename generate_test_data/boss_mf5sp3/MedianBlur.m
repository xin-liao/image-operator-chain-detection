%% MedianBlur
function [MedI] = MedianBlur(img,windowsSize)
[rows,cols,channels] = size(img);
MedI = uint8(zeros([rows,cols,channels]));
for i = 1:channels
    MedI(:,:,i) = medfilt2(img(:,:,i),[windowsSize,windowsSize]); 
end
end