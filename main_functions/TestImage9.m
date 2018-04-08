close all;clear all;

%matData = load('ImsAndTruths22090.mat'); %use for Pavia
matData = load('PaviaHyperIm.mat'); %use for RGB

%Img = matData.Im; %use for RGB
Img = matData.PaviaHyperIm; %use for Pavia
GroundTruthMatData = load('PaviaGrTruth.mat');
GroundTruth = GroundTruthMatData.PaviaGrTruth;
MaskMatData = load('PaviaGrTruthMask.mat');
Mask = MaskMatData.PaviaGrTruthMask;

[ClusterIm, CCIm] = MyClust9(Img,'Algorithm', 'FCM', 'ImType', 'Hyper', 'NumClusts', 9);
%[ClusterIm, CCIm] = MyClust9(Img,'Algorithm', 'Kmeans', 'ImType', 'RGB', 'NumClusts', 3);

[m,n] = size(CCIm);
index = MyClustEvalHyper9(ClusterIm,GroundTruth,Mask)
ClusterIm = reshape(ClusterIm, [m,n]);

imagesc(ClusterIm);