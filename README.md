# CBIR-in-LTLL-Dataset-MATLAB
Content Based Image Retrieval in LTLL Dataset (old and new Images of famous places) 

The retrieval process in CBIR is that low-level visual features of each image are extracted and stored in a database, 
for example, color, shape, texture, layout, etc. 
These features are "content" in CBIR. When a query is in the input, its properties are extracted and a similarity (or dissimilarity) 
criterion is used to compare them with the previously coded samples. 
The larger the score (or smaller), the image is more similar to the query, and then the images can be ranked according to the score. 
Finally, the most similar images are returned to the user. To do the CBIR project, there are four steps: 
GUI sections, feature selection, similarity measurement And Relevance Feedback.

1-GUI :
  cbirrf.m
  cbirrf.fig
2-Feature Selection
3-Similarity:
  cosine similarity
4-Relevance

Download Dataset :

# Description
rename.m : Rename the datasets to search more efficiently. \n
text.m : Make a text file of images name. \n
scores.m : Save the scores of all images in a matrix. \n


