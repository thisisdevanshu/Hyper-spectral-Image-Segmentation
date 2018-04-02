close all;clear all;
matData = load('ImsAndTruths2092.mat');

Img = matData.Im; 

[ClusterIm, CCIm] = MyClust9(Img,'Algorithm', 'Spectral', 'ImType', 'RGB', 'NumClusts', 3);