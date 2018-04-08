addpath(genpath('helpers'))
addpath(genpath('ImsAndSegs'))

These two lines are added in MyClust9.m which assumes the following directory structure;

/
  - ImsAndSegs/
  - helpers/
  - CalculateMetrics9.m
  - MyClust9.m
  - MyClustEvalHyper9.m
  - MyClustEvalRGB9.m
  - MyFCM9.m
  - MyGMM9.m
  - MyKmeans9.m
  - MyMartinIndex9.m
  - MySOM9.m
  - MySpectral9.m
  - TestImage9.m

The two main functions to run are CalculateMetrics9 and TestImage9

1. CalculateMetrics9:
Calculates the mean and standard deviation to populate Table 2. The local path to image directory should be provided to the script.

2. TestImage9:
Runs one algorithm on one image and displays the segmentation. Name of the image to run should be provided to the script.

All other helper functions are defined in "helpers". Comments are added in each script to explain its functionality.

