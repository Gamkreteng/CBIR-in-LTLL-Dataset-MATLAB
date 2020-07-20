% EXAMPLE 1
% Load image
img = imread('demo1.jpg');

% Parameters:
clear param
param.imageSize = [256 256]; % it works also with non-square images
param.orientationsPerScale = [8 8 8 8];
param.numberBlocks = 4;
param.fc_prefilt = 4;

% Computing gist requires 1) prefilter image, 2) filter image and collect
% output energies
[gist, param] = LMgist(img, '', param);

% Visualization
% figure
% subplot(121)
% imshow(img1)
% title('Input image')
% subplot(122)
% showGist(gist1, param)
% title('Descriptor')
