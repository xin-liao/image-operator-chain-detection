# -*- coding: utf-8 -*-
"""
Created on Sun Jan 20 16:37:34 2019

@author: Administrator
"""
#coding=utf-8
import caffe
import os
import numpy as np

root='D:/software/caffe/examples/forensics/confuse_rsbr_jpeg8090/'   #根目录
deploy=root + 'deploy.prototxt'    #deploy文件
caffe_model=root + 'Net_iter_984000.caffemodel'   #训练好的 caffemodel
#labels_filename = root + 'labels.txt'  #类别名称文件，将数字标签转换回类别名称
caffe.set_mode_gpu()
net = caffe.Net(deploy,caffe_model,caffe.TEST)   #加载model和network
#图片预处理设置
transformer = caffe.io.Transformer({'data': net.blobs['data'].data.shape})  #设定图片的shape格式(1,3,64,64)
transformer.set_transpose('data', (2,0,1))    #改变维度的顺序，由原始图片(64,64,3)变为(3,64,64)
#transformer.set_mean('data', np.load(mean_file).mean(1).mean(1))    #减去均值，前面训练模型时没有减均值，这儿就不用
#transformer.set_raw_scale('data', 255)    # 缩放到【0，255】之间
transformer.set_channel_swap('data', (2,1,0))   #交换通道，将图片由RGB变为BGR
#结果保存路径
fresult = open('boss_confuse_rsbr_jpeg8090.txt','w')
#获取测试图像的路径
firstfolder = 'F:/boss/confuse_rsbr_jpeg8090/'
folderList = os.listdir(firstfolder)
for foldern in folderList:
    imgList = []
    if os.path.isdir(firstfolder+foldern):
        result = np.zeros(5,dtype=np.int)
        imgName = os.listdir(firstfolder+foldern)
        for imgn in imgName:
            imgFullName = os.path.join(firstfolder+foldern+'/'+imgn)
            imgList.append(imgFullName)
        for imgInd in imgList:
            im=caffe.io.load_image(imgInd)                   #加载图片
            net.blobs['data'].data[...] = transformer.preprocess('data',im)      #执行上面设置的图片预处理操作，并将图片载入到blob中
            #执行测试
            out = net.forward()
            #labels = np.loadtxt(labels_filename, str, delimiter='\t')   #读取类别名称文件
            prob= net.blobs['prob'].data[0].flatten() #取出最后一层（Softmax）属于某个类别的概率值，并打印
            predictlabel = prob.argsort()[-1]
            print 'processing: '+imgInd+', the predict label is: '+str(predictlabel)
            result[predictlabel] = result[predictlabel] + 1
        for i in range(0,len(result)):
            fresult.write(str(result[i])+'\t')
        fresult.write('\n')
fresult.close()