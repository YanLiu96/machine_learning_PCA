------------------------------------------------------------------------------------
COMP61021: Modelling and Visualization of High Dimensional Data

                    Lab 1: Applications of PCA
------------------------------------------------------------------------------------
The sumbmited folder has structure below:
YanLiu-lab1/
    data/
        digit.mat           - digit dataset for part2,3
        iris.mat            - iris dataset for part1

    readme.txt              - this file, instructions

    report.pdf              - the report for this lab

    code/
        lab1_part1.m        - code for part1 of the labwork 
        lab1_part2.m        - code for part2 of the labwork
        lab1_part3.m        - code for part3 of the labwork
        pov_k_pc.m          - code for selecting the optimal number of PC based on POV<=0.9
        mds.m               - mds algorithm: realize Classical multidimensional scaling
        pca1.m              - pca algorithm: Perform PCA using covariance
        pca2.m              - pca algorithm: Perform PCA using SVD
        display_digit.m     - code for displaying images
------------------------------------------------------------------------------------
To test my code, Please open the 'code' floder in matlab, then you can test.

-----------------------------
1. lab1_part1.m instructions
-----------------------------
First of all, I load the iris dataset and choose dataset.x as data, then get the number of sample (sample_num) which is 150.
Next, using PCA1 function, get the PC and V(variances). Then choose top three PC and name them as PC1,PC2,PC3 and combine every two PC together as a projection vector.
Next, I do pre-processing (miuns the mean value of train data).Then, do projection ：(The transpose of the projection vector) * (Processed data sets).
Next, add original label to them so that when visualizing all the datapoint, it will show different colours.

To run this code, just open this file（lab1_part1.m）, click on 'run' button! It may take a little time to end of the run. 

-----------------------------
2. lab1_part2.m instructions
-----------------------------
First of all, I load the digit dataset and choose dataset.train as train_set, then get the number of train samples (train_sample_num) which is 300. 
Then get the number of test samples which is 10 in same way.
Next, because the original image is 28*28, so i create a 784*300 zero matrix called train_data, change the train image into a column vector which is 1*784, put the image into train_data.
Next, I use pca2 function to get PC and Variances. 
Next, I use pov_k_pc (base on pov) functoin in pov_k_pc.m to get the optimal number of PC (47). 
Next, I plot the ten original test images.
Then, do pre-processing (miuns the mean value of train data) on test data.
Then， apply pca2 to processed test set and do projection(pc number=47). 
And do reconstruction(must add mean value of train data). Then plot the 10 reconstruction images.
Finally, I estimate their reconstruction errors based on Quadratic Reconstruction Error. And Get the mean Error that is 5.8611.


To run this code, just open this file（lab1_part2.m）, click on 'run' button!

-----------------------------
2. lab1_part3.m instructions
-----------------------------

First of all, in mds.m, I calculate the distance matrix of data points in the original space .
Then do data processing to avoid singular and get a unit matrix. Then get the Variances and sort them.
Next, get the rehuce matrix by pc*sqrt(v_sort).
In lab1_part3.m, get the sample number of train_set and test_set.
change the train and test image into a column vector of 28*28=784 dimensions
Then use Multidimensional Scaling (MDS) function to get the reduce matrix.
Do projection and get 2-dimensions image.
Then do reconstruction and plot the result to compare with original images.

To run this code, just open this file (lab1_part3.m), click on 'run' button!