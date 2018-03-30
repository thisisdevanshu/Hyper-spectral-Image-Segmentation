
function [ClusterIm, CCIm] = MyKMeans8(Image, ImageType, NumClusts)
    [m, n, colors] = size(Image);
    k=1;
    if(strcmp('RGB',ImageType)==1)
       
        changedMatrix = double(zeros(m*n,3));
        for i=1:n
            for j=1:m
                changedMatrix(k,1) = Image(j,i,1);
                changedMatrix(k,2) = Image(j,i,2);
                changedMatrix(k,3) = Image(j,i,3);
                k=k+1;
            end
        end 
        
        [IDX, C] = kmeans(changedMatrix, NumClusts);
    
        ClusterIm = zeros(m,n);
        r=1;
        c=1;
        for i=1:m*n  
            ClusterIm(c, r) = uint16(IDX(i)); 
            c=c+1;
            if c>m
                c=1;
                r=r+1;
            end
        end
        CCIm = 1;
    end
    
    imagesc(reshape(ClusterIm,321,481));
end