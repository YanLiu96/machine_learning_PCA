clc;
close all;  
clear;
%dataset is 4 dimension and 150 examples
dataset=load('../data/iris.mat')
data=dataset.X;
sample_num=size(data,2)
[PC,V] = pca1(data)
%choose top three PC
PC1=PC(:,1)
PC2=PC(:,2)
PC3=PC(:,3)
%combine two PC (to project data into two dimension)
PC1_2=[PC1,PC2]
PC1_3=[PC1,PC3]
PC2_3=[PC2,PC3]
%pre-processing(miuns mean of data)
mean = mean(data,2);
data = data-repmat(mean,1,sample_num);
%do projection
projection1_2= PC1_2'*data;
projection1_3= PC1_3'*data;
projection2_3= PC2_3'*data;
%add label value so that it is able to distinguish different labels when visualizing
projection1_2=[projection1_2;dataset.y];
projection1_3=[projection1_3;dataset.y];
projection2_3=[projection2_3;dataset.y];
%visualizing all the datapoint
figure(1)
subplot(1,3,1);
for i=1:sample_num
    x=projection1_2(1,i);
    y=projection1_2(2,i);
    label=projection1_2(3,i);
    if label==1
        scatter(x,y,'r');
        hold on
    elseif label==2
        scatter(x,y,'g');
        hold on
    else
        scatter(x,y,'b');
        hold on
    end
end
title('PC1-PC2 subspaces')
subplot(1,3,2);
for i=1:sample_num
    x=projection1_3(1,i);
    y=projection1_3(2,i);
    label=projection1_3(3,i);
    if label==1
        scatter(x,y,'r');
        hold on
    elseif label==2
        scatter(x,y,'g');
        hold on
    else
        scatter(x,y,'b');
        hold on
    end
end
title('PC1-PC3 subspaces')
subplot(1,3,3);
for i=1:sample_num
    x=projection2_3(1,i);
    y=projection2_3(2,i);
    label=projection2_3(3,i);
    if label==1
        scatter(x,y,'r');
        hold on
    elseif label==2
        scatter(x,y,'g');
        hold on
    else
        scatter(x,y,'b');
        hold on
    end
end
title('PC2-PC3 subspaces')

