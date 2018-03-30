close all;clear all;

load PaviaHyperIm.mat;
reflectances = PaviaHyperIm(:,:,:);

size(reflectances)

reflectances = reflectances/max(reflectances(:));

load illum_6500.mat;
radiances = zeros(size(reflectances)); % initialize array
for i = 1:33,
  radiances(:,:,i) = reflectances(:,:,i)*illum_6500(i);
end

[r c w] = size(radiances);
radiances = reshape(radiances, r*c, w);

load xyzbar.mat;
XYZ = (xyzbar'*radiances')';

XYZ = reshape(XYZ, r, c, 3);
XYZ = max(XYZ, 0);
XYZ = XYZ/max(XYZ(:));

RGB = XYZ2sRGB_exgamma(XYZ);
RGB = max(RGB, 0);
RGB = min(RGB, 1);

figure; imshow(RGB.^0.4, 'Border','tight'); 

%z = max(RGB(244,17,:));
%RGB_clip = min(RGB, z)/z;
%figure; imshow(RGB_clip.^0.4, 'Border','tight');