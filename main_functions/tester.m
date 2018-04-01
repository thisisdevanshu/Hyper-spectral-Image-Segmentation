matData = load('ImsAndTruths2092.mat');

Img = matData.Im; 

MyClust9(Img,'Algorithm', 'GMM', 'ImType', 'RGB', 'NumClusts', 5);