function [] = GMM(data,clustNum);
R = data(:,:,1);
G = data(:,:,2);
B = data(:,:,3);
R = double(R);
G = double(G);
B = double(B);
R = R(:);
G = G(:);
B = B(:);
data = [R,G,B];
% means found from kmeans
[IDX, mu] = kmeans(data,clustNum);
% calculating pi k from kmeans.  pi's sum to 1 to form the pdf
hist = histc(IDX,unique(IDX));
pik = hist/sum(hist);
% covariance matrices from k means
for itr = 1 : clustNum
    cluster{itr} = [];
end
N = size(IDX,1);
for itr = 1 : N
    cluster{IDX(itr)} = [cluster{IDX(itr)};data(itr,:)];
end
sigma = zeros(3,3,clustNum);
for itr = 1:clustNum
    sigma(:,:,itr) = cov(cluster{itr});
end
% E step
%find the sum of probability that a sample came from one of the distributions
rnk = zeros(clustNum,N);
rnkSum = zeros(clustNum);
munew = zeros(clustNum,3);

sigma
count = 0;
while abs(munew - mu) > 0.001
    count = count + 1
    if (mu - munew) ~= mu
        mu = munew;
    end
    
    for itr = 1 : N
        k = IDX(itr);
        rnk(k,itr) = pik(k)*mvnpdf(data(k,:),mu(k,:),sigma(:,:,k)+0.1*eye(3));
        rnkSum(k) = rnkSum(k) + rnk(k,itr);
    end
    % dividing by sum of k sums
    for itr = 1 : N
        k = IDX(itr);
        rnk(k,itr) = rnk(k,itr)/rnkSum(k);
    end

    % M step
    
    munew = (rnk*data)./repmat(sum(rnk,2),1,3);
    %sigma = (rnk*data)./repmat(sum(rnk,2),1,3);
    sigma = zeros(3,3,clustNum);
    %for itr = 1: N
    %    k = IDX(itr);
    %    sigma(:,:,k) = sigma(:,:,k) + rnk(k,itr)*(data(itr,:)*data(itr,:)');
    %end
    %for itr = 1 : clustNum
    %    sigma(itr) = sigma(itr) - munew(itr)*munew(itr)';
    %end
    for itr = 1 : clustNum
        for ind = 1 : N
            sigma(:,:,itr) = sigma(:,:,itr) + rnk(itr,ind)*(data(ind,:)*data(ind,:)');
        end
        sigma(:,:,itr) = sigma(:,:,itr) - munew(itr)*munew(itr)';
    end
    
    pik = sum(rnk,2)/N;
end
sigma
output = zeros(N,1);
for itr = 1:N
    norms = zeros(clustNum,1);
    for ind = 1 : clustNum
        norms(ind,:) = mvnpdf(data(itr,:),mu(ind,:),sigma(:,:,ind)+10*eye(3));
    end
    [v ind] = min(norms);
    output(itr) = ind;
end
output(1,:)
im = reshape(output,321,481);
im = medfilt2(im);
imagesc( imgaussfilt(im,1) );
