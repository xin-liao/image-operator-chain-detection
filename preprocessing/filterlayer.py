# -*- coding: utf-8 -*-
"""
Created on Thu Jan 17 23:07:35 2019

@author: likaide
"""
import caffe
import cv2
import numpy as np
kernel = np.array([[-0.25,0.5,-0.25],[0.5,0,0.5],[-0.25,0.5,-0.25]])
class PythonLayer(caffe.Layer):
    def setup(self, bottom, top):
        pass
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)
    def forward(self, bottom, top):
        for i in range(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            ##p-map filter
            imtemp = cv2.filter2D(imTrans, -1, kernel)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans      
    def backward(self, top, propagate_down, bottom):
        pass