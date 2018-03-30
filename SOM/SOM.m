function [] = SOM(data,nodes);
R = data(:,:,1);
G = data(:,:,2);
B = data(:,:,3);
R = double(R);
G = double(G);
B = double(B);
R = R(:);
G = G(:);
B = B(:);
summation = R+G+B;
R = R./summation;
G = G./summation;
B = B./summation;
data = [R,G,B];

totalW = nodes;
%//initialization of weights
wold = rand(totalW,3);
%// the initial learning rate
eta0 = 0.09;
%// the current learning rate (updated every epoch)
etaN = eta0;
%// the constant for calculating learning rate
tau2 = 1000;
%creating map out of node
[I,J] = ind2sub([sqrt(totalW),sqrt(totalW)], 1:totalW);
N = size(data,2);
%// the size of neighbor
sig0 = 2;
sigN = sig0;
%// tau 1 for updateing sigma
tau1 = 1000/log(sigN);
out = zeros(154401,1);
%i is number of epoch
itr = 5;
wnew = wold + 0.01
count = 0
while sum(abs(wnew - wold) > 1.0e-05*2) > 0
    %// j is index of each point.
    %// it should iterate through data in a random order rewrite!!
    count = count + 1
    for j=1:154401   
        wold = wnew;
        x = data(j,:);
        % 2 is for summing rows
        dist = sum( sqrt((wold - repmat(x,totalW,1)).^2),2);
        %// find the winner
        [v ind] = min(dist);
        %// the 2-D index
        ri = [I(ind), J(ind)];
        out(j) = ind;
        %// distance between this node and the winner node.
        dist = 1/(sqrt(2*pi)*sigN).*exp( sum(( ([I( : ), J( : )] - repmat(ri, totalW,1)) .^2) ,2)/(-2*sigN)) * etaN;
        
        %// updating weights  
        wnew = wold + dist.*( x - wold);
        
    end    
    abs(wnew - wold)
    %// update learning rate
    etaN = eta0 * exp(-count/tau2);
    %// update sigma
    sigN = sig0*exp(-count/tau1);
end
count
imagesc(reshape(out,321,481));
