function sRGB = XYZ2sRGB_exgamma(XYZ)

% Image dimensions
d = size(XYZ);
r = prod(d(1:end-1));   % product of sizes of all dimensions except last, wavelength
w = d(end);             % size of last dimension, wavelength

% Reshape for calculation, converting to w columns with r rows.
XYZ = reshape(XYZ, [r w]);

M = [3.2406 -1.5372 -0.4986
    -0.9689 1.8758 0.0414
     0.0557 -0.2040 1.0570];
sRGB = (M*XYZ')';

% Reshape to recover shape of original input.
sRGB = reshape(sRGB, d);

return;
     
         