fid1 = fopen('DatasetObjects.txt');

NumOfImages = 483;
FeatureNumbers = 10 + (9 * 10)+ 6 + 92928 ;
allImagesFeatures = zeros(NumOfImages, FeatureNumbers);

iCount = 1;

while 1
    imagename = fgetl(fid1);
    if ~ischar(imagename), break, end
    imageInProgress = imread(imagename);
    allImagesFeatures(iCount, :) = im2vector(imageInProgress);
    iCount = iCount + 1;
end
fclose(fid1);
save('My code\featureScores\allImagesFeatures.mat', 'allImagesFeatures');
