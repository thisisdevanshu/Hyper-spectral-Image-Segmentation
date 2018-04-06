function[] = ConnectedComponent(clusterIm,clustNum,m,n)
    CCIm = zeros(m*n,1);
    %connected component count
    count = 1;
    for clust = 1:clustNum
        bw = zeros(m*n,1);
        % converting each clsuter to bw image
        for itr = 1:size(clusterIm,1)
            if clusterIm(itr) == clust
                bw(itr) = 1;
            end
        end
        %finding the connected componets
        cc = bwconncomp(bw)
        componentsFound = size(cc.PixelIdxList,2);
        %assigning component number to pixels
        for itr = 1:componentsFound
            pointsInComponent = size(cc.PixelIdxList{itr},1);
            for jtr = 1:pointsInComponent
                imageIndex = cc.PixelIdxList{itr}(jtr);
                CCIm(imageIndex) = count; 
            end
            count = count + 1;
            count
        end
        
    end
    
    CCIm = reshape(CCIm,m,n);
    imagesc(CCIm);

end