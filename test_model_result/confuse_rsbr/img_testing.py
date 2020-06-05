# -*- coding: utf-8 -*-
"""
Created on Sun Jan 20 16:37:34 2019

@author: Administrator
"""
#coding=utf-8
import caffe
import os
import numpy as np

root='D:/software/caffe/examples/forensics/confuse_rsbr/'   #æ ¹ç®å½?
deploy=root + 'deploy.prototxt'    #deployæä»¶
caffe_model=root + 'Net_iter_984000.caffemodel'   #è®­ç»å¥½ç caffemodel
#labels_filename = root + 'labels.txt'  #ç±»å«åç§°æä»¶ï¼å°æ°å­æ ç­¾è½¬æ¢åç±»å«åç§?
caffe.set_mode_gpu()
net = caffe.Net(deploy,caffe_model,caffe.TEST)   #å è½½modelånetwork
#å¾çé¢å¤çè®¾ç½?
transformer = caffe.io.Transformer({'data': net.blobs['data'].data.shape})  #è®¾å®å¾ççshapeæ ¼å¼(1,3,64,64)
transformer.set_transpose('data', (2,0,1))    #æ¹åç»´åº¦çé¡ºåºï¼ç±åå§å¾ç?64,64,3)åä¸º(3,64,64)
#transformer.set_mean('data', np.load(mean_file).mean(1).mean(1))    #åå»åå?ï¼åé¢è®­ç»æ¨¡åæ¶æ²¡æååå¼ï¼è¿å¿å°±ä¸ç?
#transformer.set_raw_scale('data', 255)    # ç¼©æ¾å°[0ï¼?55]ä¹é´
transformer.set_channel_swap('data', (2,1,0))   #äº¤æ¢ééï¼å°å¾çç±RGBåä¸ºBGR
#ç»æä¿å­è·¯å¾
fresult = open('boss_confuse_rsbr_result.txt','w')
#è·åæµè¯å¾åçè·¯å¾?
firstfolder = 'F:/boss/boss_confuse_rsbr/'
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
            im=caffe.io.load_image(imgInd)    #å è½½å¾ç
            net.blobs['data'].data[...] = transformer.preprocess('data',im)      #æ§è¡ä¸é¢è®¾ç½®çå¾çé¢å¤çæä½ï¼å¹¶å°å¾çè½½å
            #æ§è¡æµè¯
            out = net.forward()
            #labels = np.loadtxt(labels_filename, str, delimiter='\t')   #è¯»åç±»å«åç§°æä»¶
            prob= net.blobs['prob'].data[0].flatten() #ååºæ?ä¸?±ï¼Softmaxï¼å±äºæä¸ªç±»å«çæ¦çå¼ï¼å¹¶æå?
            predictlabel = prob.argsort()[-1]
            print 'processing: '+imgInd+', the predict label is: '+str(predictlabel)
            result[predictlabel] = result[predictlabel] + 1
        for i in range(0,len(result)):
            fresult.write(str(result[i])+'\t')
        fresult.write('\n')
fresult.close()