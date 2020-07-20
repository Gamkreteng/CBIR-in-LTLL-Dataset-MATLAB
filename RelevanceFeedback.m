function RelevanceFeedback(handles,allImagesFeatures)
    
    load('My code/featureScores/combined_features.mat', 'combined_features');
    load('My code/featureScores/Max_Indexes.mat', 'Max_Indexes');

    found = 0;
    if get(handles.checkbox1, 'value') == 1
        combined_features = allImagesFeatures(Max_Indexes(1), :);
        found = 1;
    end
    if get(handles.checkbox2, 'value') == 1
        if found == 0
            combined_features = allImagesFeatures(Max_Indexes(2), :);
        else 
            for i = 1:length(combined_features)
                combined_features(i) = (combined_features(i) + allImagesFeatures(Max_Indexes(2), i)) / 2;
            end
        end
        found = 1;
    end
    if get(handles.checkbox3, 'value') == 1
        if found == 0
            combined_features = allImagesFeatures(Max_Indexes(3), :);
        else 
            for i = 1:length(combined_features)
                combined_features(i) = (combined_features(i) + allImagesFeatures(Max_Indexes(3), i)) / 2;
            end
        end
        found = 1;
    end
    if get(handles.checkbox4, 'value') == 1
        if found == 0
            combined_features = allImagesFeatures(Max_Indexes(4), :);
        else 
            for i = 1:length(combined_features)
                combined_features(i) = (combined_features(i) + allImagesFeatures(Max_Indexes(4), i)) / 2;
            end
        end
        found = 1;
    end
    if get(handles.checkbox5, 'value') == 1
        if found == 0
            combined_features = allImagesFeatures(Max_Indexes(5), :);
        else 
            for i = 1:length(combined_features)
                combined_features(i) = (combined_features(i) + allImagesFeatures(Max_Indexes(5), i)) / 2;
            end
        end
        found = 1;
    end
    if get(handles.checkbox6, 'value') == 1
        if found == 0
            combined_features = allImagesFeatures(Max_Indexes(6), :);
        else 
            for i = 1:length(combined_features)
                combined_features(i) = (combined_features(i) + allImagesFeatures(Max_Indexes(6), i)) / 2;
            end
        end
        found = 1;
    end
    if get(handles.checkbox8, 'value') == 1
        if found == 0
            combined_features = allImagesFeatures(Max_Indexes(7), :);
        else 
            for i = 1:length(combined_features)
                combined_features(i) = (combined_features(i) + allImagesFeatures(Max_Indexes(7), i)) / 2;
            end
        end
        found = 1;
    end
    if get(handles.checkbox9, 'value') == 1
        if found == 0
            combined_features = allImagesFeatures(Max_Indexes(8), :);
        else 
            for i = 1:length(combined_features)
                combined_features(i) = (combined_features(i) + allImagesFeatures(Max_Indexes(8), i)) / 2;
            end
        end
        found = 1;
    end
    if get(handles.checkbox10, 'value') == 1
        if found == 0
            combined_features = allImagesFeatures(Max_Indexes(9), :);
        else 
            for i = 1:length(combined_features)
                combined_features(i) = (combined_features(i) + allImagesFeatures(Max_Indexes(9), i)) / 2;
            end
        end
        found = 1;
    end
    if get(handles.checkbox11, 'value') == 1
        if found == 0
            combined_features = allImagesFeatures(Max_Indexes(10), :);
        else 
            for i = 1:length(combined_features)
                combined_features(i) = (combined_features(i) + allImagesFeatures(Max_Indexes(10), i)) / 2;
            end
        end
        found = 1;
    end
    if found == 1
        SearchInDataset(handles, combined_features);
    else
        disp('Please select some image to advance search');
    end  
    save('My code/featureScores/combined_features.mat', 'combined_features');


end
