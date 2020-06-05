# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
import caffe
import cv2
import numpy as np
import os
os.environ["CUDA_VISIBLE_DEVICES"] = "0"
kernel = np.zeros([5,5,5,5])
w = np.array([1, np.sqrt(2), np.sqrt(2), np.sqrt(2), np.sqrt(2)]);
for m in xrange(0,5):
    for n in xrange(0,5):
	    for k in xrange(0,5):
		    for l in xrange(0,5):
		        kernel[m,n,k,l] = 1/5.0*w[k]*w[l]*np.cos(np.pi*k*(2*m+1)/10.0)*np.cos(np.pi*l*(2*n+1)/10.0)
                
class DCT00Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel00 = kernel[:,:,0,0]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel00)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT01Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel01 = kernel[:,:,0,1]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel01)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT02Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel02 = kernel[:,:,0,2]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel02)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT03Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel03 = kernel[:,:,0,3]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel03)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT04Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel04 = kernel[:,:,0,4]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel04)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass
		
class DCT10Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel10 = kernel[:,:,1,0]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel10)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT11Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel11 = kernel[:,:,1,1]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel11)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT12Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel12 = kernel[:,:,1,2]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel12)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT13Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel13 = kernel[:,:,1,3]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel13)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT14Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel14 = kernel[:,:,1,4]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel14)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass
		
class DCT20Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel20 = kernel[:,:,2,0]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel20)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT21Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel21 = kernel[:,:,2,1]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel21)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT22Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel22 = kernel[:,:,2,2]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel22)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT23Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel23 = kernel[:,:,2,3]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel23)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT24Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel24 = kernel[:,:,2,4]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel24)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass
		
class DCT30Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel30 = kernel[:,:,3,0]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel30)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT31Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel31 = kernel[:,:,3,1]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel31)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT32Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel32 = kernel[:,:,3,2]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel32)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT33Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel33 = kernel[:,:,3,3]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel33)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT34Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel34 = kernel[:,:,3,4]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel34)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass
		
class DCT40Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel40 = kernel[:,:,4,0]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel40)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT41Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel41 = kernel[:,:,4,1]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel41)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT42Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel42 = kernel[:,:,4,2]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel42)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT43Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel43 = kernel[:,:,4,3]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel43)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass

class DCT44Layer(caffe.Layer):
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        kernel44 = kernel[:,:,4,4]
        for i in xrange(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = cv2.filter2D(imTrans,-1,kernel44)
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
    def backward(self, top, propagate_down, bottom):
        pass