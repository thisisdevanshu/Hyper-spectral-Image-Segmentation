function [output] = CalculateMetrics() 
    % Provide local path for ImsAndSegs folder
    Images = dir('/Users/karanchauhan/Documents/MATLAB/Project1/main_functions/ImsAndSegs');
    Images(1:2,:) = [];
    numberOfImages = max(size(Images));
    output = zeros(1, numberOfImages);

    for i = 1:numberOfImages
        minimum = 1;
        i
        LoadedImage = load(strcat(Images(i,1).folder, '/', Images(i,1).name));
        for j = 2:7
            % Change to algorithm for which metric has to be calculated
            [ClusterIm, CCIm] = MyKmeans9(LoadedImage.Im, 'RGB', j);
           
            a = MyMartinIndex9(CCIm, LoadedImage.Seg1);
            b = MyMartinIndex9(CCIm, LoadedImage.Seg2);
            c = MyMartinIndex9(CCIm, LoadedImage.Seg3);
            index = min(min(a,b),c);
            
            if index<minimum
                minimum = index;
            end
        end
        minimum
        output(i) = minimum;
    end
    %After running this, calculate mean using mean(output) and standard deviation using std(output)
end