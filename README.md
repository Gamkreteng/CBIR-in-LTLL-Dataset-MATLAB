# CBIR-in-LTLL-Dataset-MATLAB
>Content Based Image Retrieval in LTLL Dataset (old and new Images of famous places) 

The retrieval process in CBIR is that low-level visual features of each image are extracted and stored in a database, 
for example, color, shape, texture, layout, etc. 
These features are "content" in CBIR. When a query is in the input, its properties are extracted and a similarity (or dissimilarity) 
criterion is used to compare them with the previously coded samples. 
The larger the score (or smaller), the image is more similar to the query, and then the images can be ranked according to the score. 
Finally, the most similar images are returned to the user. To do the CBIR project, there are four steps: 
GUI sections, feature selection, similarity measurement And Relevance Feedback.

- GUI :
  - [cbirrf.m](https://github.com/hamid9095/CBIR-in-LTLL-Dataset-MATLAB/blob/master/cbirrf.m)
  - [cbirrf.fig](https://github.com/hamid9095/CBIR-in-LTLL-Dataset-MATLAB/blob/master/cbirrf.fig)
- Feature Selection
- Similarity:
  - [cosine similarity](https://github.com/hamid9095/CBIR-in-LTLL-Dataset-MATLAB/blob/master/getCosineSimilarity.m)
- Relevance Feedback :
  - [RelFeedback.m](https://github.com/hamid9095/CBIR-in-LTLL-Dataset-MATLAB/blob/master/RelFeedback.m) : used function for relevance feedback
  - [RelevanceFeedback.m](https://github.com/hamid9095/CBIR-in-LTLL-Dataset-MATLAB/blob/master/RelevanceFeedback.m) : another function for relevance feedback

### Download Dataset :
* [LTLL Dataset](https://drive.google.com/file/d/1q2jQIoxit3ujn5-HG79cU6oWHSxXwTcQ/view?usp=sharing) - Old and New Famous Places Images

## Description
* [rename.m](https://github.com/hamid9095/CBIR-in-LTLL-Dataset-MATLAB/blob/master/rename.m) : Rename the datasets to search more efficiently.
* [text.m](https://github.com/hamid9095/CBIR-in-LTLL-Dataset-MATLAB/blob/master/text.m) : Make a text file of images name.
* [scores.m](https://github.com/hamid9095/CBIR-in-LTLL-Dataset-MATLAB/blob/master/scores.m) : Save the scores of all images in a matrix.


