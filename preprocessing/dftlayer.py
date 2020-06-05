import caffe
import numpy as np

class PythonLayer(caffe.Layer):
    """
    Compute the Euclidean Loss in the same manner as the C++ EuclideanLossLayer
    to demonstrate the class interface for developing layers in Python.
    """
    def setup(self, bottom, top):
        pass
        
    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].shape)

    def forward(self, bottom, top):
        for i in range(0,bottom[0].data.shape[0]):
            img = bottom[0].data[i,...]
            imTrans = img.transpose(1,2,0)
            imtemp = abs(np.fft.fftshift(np.fft.fft2(imTrans)))
            imiTrans = imtemp.transpose(2,0,1)
            top[0].data[i,...] = imiTrans
        
    def backward(self, top, propagate_down, bottom):
        pass