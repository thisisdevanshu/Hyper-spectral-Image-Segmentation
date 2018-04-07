function [output] = CalculateMetrics() 
    Images = dir('/Users/karanchauhan/Documents/MATLAB/Project1/main_functions/ImsAndSegs');
    Images(1:2,:) = [];
    numberOfImages = max(size(Images));
    output = zeros(1, numberOfImages);

    for i = 1:numberOfImages
        minimum = 1;
        LoadedImage = load(strcat(Images(i,1).folder, '/', Images(i,1).name));
        for j = 3:10
            [ClusterIm, CCIm] = MyKmeans9(LoadedImage.Im, 'RGB', j);
           
            a = MyMartinIndex9(CCIm, LoadedImage.Seg1);
            b = MyMartinIndex9(CCIm, LoadedImage.Seg2);
            c = MyMartinIndex9(CCIm, LoadedImage.Seg3);
            index = min(min(a,b),c);
            
            if index<minimum
                minimum = index;
            end

        end
        output(i) = minimum;
    end
end