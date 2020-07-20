function [feature_vector] = im2vector(image)
%IM2VECTOR Image to feature vector conversion
%   Gets image as input and results its feature vector.
    props = {'Contrast', 'Energy', 'Homogeneity', 'Entropy',...
        'R_mean', 'G_mean', 'B_mean', 'R_std', 'G_std',...
        'B_std', 'L_mean', 'a_mean', 'b_mean', 'L_std', 'a_std', 'b_std',...
        'H_mean', 'S_mean', 'V_mean', 'H_std', 'S_std', 'V_std'};
    image = imresize(image, [600 600]);
    %[kpd] = SiftFeatureExtractor(image);
    texture_props = props(1:3);
%     props_size = size(props, 2);
    %sift_size = size(kpd,2);
    IMG_BLOCKS_COUNT = 9;
    %GIST_size = 512;
    %HoG_size = 142884;
    data = zeros(1,10 + (IMG_BLOCKS_COUNT * 10));

    %imshow(image);
    %image = imread(image);
    [col, row, dim]=size(image);
    if dim > 1
        finalimage = rgb2gray(image);
    else
        finalimage = image;
    end
    %% Statistical (texture) features using GLCM (Contrast, Correlation and etc)
    GLCM = graycomatrix(finalimage, 'Offset', [1 0;0 1]);
    data(1:3) = mean(cell2mat(struct2cell(graycoprops(GLCM, texture_props))).');
    data(4) = entropy(finalimage);
    %% SIFT
    %data(1079:sift_size+1081)= kpd(1:50);
    %% GIST
%     clear param
%     param.imageSize = [256 256]; % it works also with non-square images
%     param.orientationsPerScale = [8 8 8 8];
%     param.numberBlocks = 4;
%     param.fc_prefilt = 4;
%     
%     [gist, param] = LMgist(image, '', param);
%     data2= gist;
    %% HoG
    %[hogfeature]=extractHOGFeatures(image);
    %data(1003:143886)= hogfeature;
    %% Harris
    corners = detectHarrisFeatures(finalimage);
    [features, valid_corners] = extractFeatures(finalimage, corners);
    HarisDescriptor = valid_corners.selectStrongest(50).Metric;
    dataHarris = HarisDescriptor';
    %% LIDRIC
    img = im2double(finalimage);
    %create Gabor Filter Bank
    GFB = GaborFilterBank(size(img));

    %create Feature Map
    F = FeatureMap(img,GFB);

    %extract LIDRICs at specified keypoint positions and scales
    X = 200:20:600;
    [X,Y] = meshgrid([250:5:300],[250:5:300]);
    pos = [X(:)';Y(:)'];
    D = LIDRIC(pos,12*ones(1,size(pos,2)),F);
    dataLIDRIC = D(:)';
    %% Color features (R, G, B and etc)
    if dim > 1
%         % R, G, B means
%         data(5) = mean(mean(image(:,:,1)));
%         data(6) = mean(mean(image(:,:,2)));
%         data(7) = mean(mean(image(:,:,3)));
%         % R, G, B standard deviations
%         data(8) = std(std(im2double(image(:,:,1))))*255;
%         data(9) = std(std(im2double(image(:,:,2))))*255;
%         data(10) = std(std(im2double(image(:,:,3))))*255;
% 
%         Lab = RGB2Lab(image);
%         % L, a, b means
%         data(11) = mean(mean(Lab(:,:,1)));
%         data(12) = mean(mean(Lab(:,:,2)));
%         data(13) = mean(mean(Lab(:,:,3)));
%         % L, a, b standard deviations
%         data(14) = std(std(im2double(image(:,:,1))))*255;
%         data(15) = std(std(im2double(image(:,:,2))))*255;
%         data(16) = std(std(im2double(image(:,:,3))))*255;

        HSV = rgb2hsv(image);
        % H, S, V means
        data(5) = mean(mean(HSV(:,:,1)));
        data(6) = mean(mean(HSV(:,:,2)));
        data(7) = mean(mean(HSV(:,:,3)));
        % H, S, V standard deviations
        data(8) = std(std(im2double(image(:,:,1))))*255;
        data(9) = std(std(im2double(image(:,:,2))))*255;
        data(10) = std(std(im2double(image(:,:,3))))*255;
    end
    [img_width, img_height] = size(finalimage);
    m = 3;
%     ignored_blocks = 0;
%     ignore = 2;
%     figure;
%     r_image = uint8(zeros(img_width, img_height, 3));
    for k = 1:m
        row_start = floor(((img_width/m) * (k-1))+1);
        row_end = floor((img_width/m) * k);
        for z = 1:m
%             if (k <= ignore && z <= ignore) || (k > (m-ignore) && z > (m-ignore))...
%                 || (k <=ignore && z > (m-ignore)) || (k > (m-ignore) && z <= ignore)
%                 % ignore image corner blocks
%                 ignored_blocks = ignored_blocks + 1;
%                 continue;
%             end
            col_start = floor(((img_height/m) * (z-1))+1);
            col_end = floor((img_height/m) * z);

            block_index = (((k-1)*m + z )* 10);
            FinalImageBlock = image(row_start:row_end,col_start:col_end,:);
            if dim>1
                grayFinalImageBlock=rgb2gray(FinalImageBlock);
%                 subplot(1,3,1);
%                 imshow(image);
%                 subplot(1,3,2);
%                 imshow(FinalImageBlock);
%                 subplot(1,3,3);
%                 imshow(grayFinalImageBlock);
            else
                grayFinalImageBlock = FinalImageBlock ;
            end
%             r_image(row_start:row_end, col_start:col_end, :) = image_block(:,:,:);
%             subplot(8, 8, ((k-1)*m)+z);
%             imshow(image_block);
            
            %Texture props
            GLCM = graycomatrix(grayFinalImageBlock, 'Offset', [3 3;0 2]);
            props = cell2mat(struct2cell(graycoprops(GLCM, texture_props))).';
            data(block_index + 1:block_index + 3) = mean(props);
            data(block_index + 4) = entropy(grayFinalImageBlock);
            if dim > 1
%                 % R, G, B means
%                 data(block_index + 5) = mean(mean(FinalImageBlock(:,:,1)));
%                 data(block_index + 6) = mean(mean(FinalImageBlock(:,:,2)));
%                 data(block_index + 7) = mean(mean(FinalImageBlock(:,:,3)));
%                 % R, G, B standard deviations
%                 data(block_index + 8) = std(std(im2double(FinalImageBlock(:,:,1))))*255;
%                 data(block_index + 9) = std(std(im2double(FinalImageBlock(:,:,2))))*255;
%                 data(block_index + 10) = std(std(im2double(FinalImageBlock(:,:,3))))*255;
% 
%                 image_Lab_block = Lab(row_start:row_end,col_start:col_end,:);
%                 % L, a, b means
%                 data(block_index + 11) = mean(mean(image_Lab_block(:,:,1)));
%                 data(block_index + 12) = mean(mean(image_Lab_block(:,:,2)));
%                 data(block_index + 13) = mean(mean(image_Lab_block(:,:,3)));
%                 % L, a, b standard deviations
%                 data(block_index + 14) = std(std(im2double(image_Lab_block(:,:,1))))*255;
%                 data(block_index + 15) = std(std(im2double(image_Lab_block(:,:,2))))*255;
%                 data(block_index + 16) = std(std(im2double(image_Lab_block(:,:,3))))*255;

                image_hsv_block = HSV(row_start:row_end,col_start:col_end,:);
                % H, S, V means
                data(block_index + 5) = mean(mean(image_hsv_block(:,:,1)));
                data(block_index + 6) = mean(mean(image_hsv_block(:,:,2)));
                data(block_index + 7) = mean(mean(image_hsv_block(:,:,3)));
                % H, S, V standard deviations
                data(block_index + 8) = std(std(im2double(image_hsv_block(:,:,1))))*255;
                data(block_index + 9) = std(std(im2double(image_hsv_block(:,:,2))))*255;
                data(block_index + 10) = std(std(im2double(image_hsv_block(:,:,3))))*255;
            end
        end
    end
    dataF = cat(2, 2*data, dataHarris);
    dataFinal = cat(2, dataF, dataLIDRIC);
    
    feature_vector = dataFinal;
    save('My code/featureScores/feature_vector.mat', 'feature_vector');
end

