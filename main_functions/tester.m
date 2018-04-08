close all;clear all;
matData = load('PaviaHyperIm.mat');

Img = matData.PaviaHyperIm; 

[ClusterIm, CCIm] = MyClust9(Img,'Algorithm', 'GMM', 'ImType', 'Hyper', 'NumClusts', 3);

imagesc(CCIm);