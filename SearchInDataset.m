function SearchInDataset(handles, feature_vector)

    NumOfImages = 483;
%   FeatureNumbers = 23 + (48 * 23);
%   allImagesFeatures = zeros(NumOfImages, FeatureNumbers);
    features_similiarity = zeros(1, NumOfImages);
%   ReExtract_Features = 0;
%   combined_features = zeros(1, size(allImagesFeatures, 2));
    
%     if (ReExtract_Features == 1)
%         for i = 1:NumOfImages
%             imagename = imread(strcat('Rename/', num2str(i),'.jpg'));
%             allImagesFeatures((i-1), :) = im2vector(imagename);
%         end
%         save('allImagesFeatures.mat', 'allImagesFeatures');
%     else
    load('My code/featureScores/allImagesFeatures.mat', 'allImagesFeatures');
    load('My code/featureScores/combined_features.mat', 'combined_features');
%     end
    
    disp('Search started.');
    for i=1:NumOfImages
        similiarity = getCosineSimilarity(feature_vector,allImagesFeatures(i, :));
%       similiarity = pdist2(feature_vector, allImagesFeatures(i, :), 'minkowski',2);
        features_similiarity(1, i) = similiarity;
    end    
    
    k = 10;
    [V, Max_Indexes] = maxk(features_similiarity, k);
    save('My code/featureScores/Max_Indexes.mat', 'Max_Indexes');
    Max_Indexes_Check = Max_Indexes;
    save('My code/featureScores/Max_Indexes_Check.mat', 'Max_Indexes_Check')
    for ii =1:k
        image_title = strcat(num2str(Max_Indexes(ii)),'.jpg');
        image_title_num = Max_Indexes(ii);
        if image_title_num >= 1 && image_title_num <=9
            image_title = strcat('0000',image_title);
        elseif image_title_num >= 10 && image_title_num <=99
            image_title = strcat('000',image_title);
        elseif image_title_num >= 100
            image_title = strcat('00',image_title);
        end
        
        RetImage = imread(image_title);
        if ii==1
            axes(handles.axes2);
            imshow(RetImage);
        end
        if ii==2
            axes(handles.axes3);
            imshow(RetImage);
        end
        if ii==3
            axes(handles.axes4);
            imshow(RetImage);
        end
        if ii==4
            axes(handles.axes5);
            imshow(RetImage);
        end
        if ii==5
            axes(handles.axes6);
            imshow(RetImage);
        end
        if ii==6
            axes(handles.axes7);
            imshow(RetImage);
        end
        if ii==7
            axes(handles.axes8);
            imshow(RetImage);
        end
        if ii==8
            axes(handles.axes9);
            imshow(RetImage);
        end
        if ii==9
            axes(handles.axes10);
            imshow(RetImage);
        end
        if ii==10
            axes(handles.axes11);
            imshow(RetImage);
        end
    end
end
