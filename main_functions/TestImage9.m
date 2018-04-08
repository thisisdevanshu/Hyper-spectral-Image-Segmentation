close all;clear all;

matData = load('ImsAndTruths22090.mat');

Img = matData.Im; 

[ClusterIm, CCIm] = MyClust9(Img,'Algorithm', 'Spectral', 'ImType', 'RGB', 'NumClusts', 3);

[m,n] = size(CCIm);
ClusterIm = reshape(ClusterIm, [m,n]);

imagesc(ClusterIm);