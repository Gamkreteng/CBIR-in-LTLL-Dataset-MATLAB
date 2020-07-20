function RelFeedback(handles,allImagesFeatures)

NumOfImages = 483;
features_similiarity = zeros(1, NumOfImages);

load('My code/featureScores/combined_features.mat', 'combined_features');
load('My code/featureScores/Max_Indexes.mat', 'Max_Indexes');
load('My code/featureScores/Max_Indexes_Check.mat', 'Max_Indexes_Check')

if get(handles.checkbox1, 'value') == 1
        combined_features(1,:) = allImagesFeatures(Max_Indexes(1), :);
end

if get(handles.checkbox2, 'value') == 1
        combined_features(2,:) = allImagesFeatures(Max_Indexes(2), :);
end

if get(handles.checkbox3, 'value') == 1
        combined_features(3,:) = allImagesFeatures(Max_Indexes(3), :);
end

if get(handles.checkbox4, 'value') == 1
        combined_features(4,:) = allImagesFeatures(Max_Indexes(4), :);
end

if get(handles.checkbox5, 'value') == 1
        combined_features(5,:) = allImagesFeatures(Max_Indexes(5), :);
end

if get(handles.checkbox6, 'value') == 1
        combined_features(6,:) = allImagesFeatures(Max_Indexes(6), :);
end

if get(handles.checkbox8, 'value') == 1
        combined_features(7,:) = allImagesFeatures(Max_Indexes(7), :);
end

if get(handles.checkbox9, 'value') == 1
        combined_features(8,:) = allImagesFeatures(Max_Indexes(8), :);
end

if get(handles.checkbox10, 'value') == 1
        combined_features(9,:) = allImagesFeatures(Max_Indexes(9), :);
end

if get(handles.checkbox11, 'value') == 1
        combined_features(10,:) = allImagesFeatures(Max_Indexes(10), :);
end

% checkCombined_features = combined_features;
% combined_features( ~any(combined_features,2), : ) = [];
while 1
    randQueryIndex = randsample(1:10, 1);
    randQuery = combined_features(randQueryIndex,:);
    if randQuery(1,:) ~= 0
        break;
    end
end

disp('Relevance Feedback started.');
    for i=1:NumOfImages
        similiarity = getCosineSimilarity(randQuery,allImagesFeatures(i, :));
        features_similiarity(1, i) = similiarity;
    end    
    
    k = 10;
    [V, Max_Indexes] = maxk(features_similiarity, k);
    save('My code/featureScores/Max_Indexes.mat', 'Max_Indexes');
%     repeated = ismember(Max_Indexes,Max_Indexes_Check);
%     
%     for jj = 1:k
%         if repeated(jj) == 1
%             Max_Indexes = Max_Indexes(Max_Indexes ~= Max_Indexes(jj));
%             jj = jj -1;
%             k = size(Max_Indexes,2);
%         end
%     end
%     
%     k1 = size(Max_Indexes);
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
        if ii==1 && mean(combined_features(1,:)) == 0
            axes(handles.axes2);
            imshow(RetImage);
        end
        if ii==2 && mean(combined_features(2,:)) == 0
            axes(handles.axes3);
            imshow(RetImage);
        end
        if ii==3 && mean(combined_features(3,:)) == 0
            axes(handles.axes4);
            imshow(RetImage);
        end
        if ii==4 && mean(combined_features(4,:)) == 0
            axes(handles.axes5);
            imshow(RetImage);
        end
        if ii==5 && mean(combined_features(5,:)) == 0
            axes(handles.axes6);
            imshow(RetImage);
        end
        if ii==6 && mean(combined_features(6,:)) == 0
            axes(handles.axes7);
            imshow(RetImage);
        end
        if ii==7 && mean(combined_features(7,:)) == 0
            axes(handles.axes8);
            imshow(RetImage);
        end
        if ii==8 && mean(combined_features(8,:)) == 0
            axes(handles.axes9);
            imshow(RetImage);
        end
        if ii==9 && mean(combined_features(9,:)) == 0
            axes(handles.axes10);
            imshow(RetImage);
        end
        if ii==10 && mean(combined_features(10,:)) == 0
            axes(handles.axes11);
            imshow(RetImage);
        end
    end
save('My code/featureScores/combined_features.mat', 'combined_features');
save('My code/featureScores/Max_Indexes_Check.mat', 'Max_Indexes')

end