# -*- coding: utf-8 -*-
import caffe
import cv2
import numpy as np
#kernel = np.array([[-1,2,-2,2,-1],[2,-6,8,-6,2],[-2,8,-12,8,-2],[2,-6,8,-6,2],[-1,2,-2,2,-1]])
kernel = np.array([[-1,2,-2,2,-1],[2,-6,8,-6,2],[-2,8,-12,8,-2],[2,-6,8,-6,2],[-1,2,-2,2,-1]])/12
class PythonLayer(caffe.Layer):
    def setup(self, bottom, top):
        pass
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)
    def forward(self, bottom, top):
        for i in range(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            #print(img)
            imTrans = img.transpose(1,2,0)
            blurred = cv2.GaussianBlur(imTrans,(11,11),0)
            gaussImg = imTrans - blurred
            imiTrans = gaussImg.transpose(2,0,1)
            #print imiTrans
            top[0].data[i,...] = imiTrans      
    def backward(self, top, propagate_down, bottom):
        pass