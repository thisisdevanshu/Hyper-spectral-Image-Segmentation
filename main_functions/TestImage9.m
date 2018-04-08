close all;clear all;

%matData = load('ImsAndTruths22090.mat'); %use for Pavia
matData = load('PaviaHyperIm.mat'); %use for RGB

%Img = matData.Im; %use for RGB
Img = matData.PaviaHyperIm; %use for Pavia

%[ClusterIm, CCIm] = MyClust9(Img,'Algorithm', 'Kmeans', 'ImType', 'Hyper', 'NumClusts', 9);
[ClusterIm, CCIm] = MyClust9(Img,'Algorithm', 'Kmeans', 'ImType', 'RGB', 'NumClusts', 3);

[m,n] = size(CCIm);
ClusterIm = reshape(ClusterIm, [m,n]);

imagesc(ClusterIm);