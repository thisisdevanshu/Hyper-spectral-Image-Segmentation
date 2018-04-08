close all;clear all;
matData = load('ImsAndTruths113044.mat');

Img = matData.Im; 

[ClusterIm, CCIm] = MyClust9(Img,'Algorithm', 'Kmeans', 'ImType', 'RGB', 'NumClusts', 3);

[m,n] = size(CCIm);
ClusterIm = reshape(ClusterIm, [m,n]);

imagesc(ClusterIm);