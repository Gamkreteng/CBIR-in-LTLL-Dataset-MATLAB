function combinedfeatures
    combined_features = zeros(10, 93590);
    checkCombined_features = zeros(10, 93590);
    save('My code/featureScores/combined_features.mat', 'combined_features');
    save('My code/featureScores/checkCombined_features.mat', 'checkCombined_features');
end