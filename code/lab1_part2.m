clc;
close all;  
clear;
dataset=load('../data/digit.mat');

train_set=dataset.train;
% get the sample number of train_set
train_sample_num = size(train_set, 2);

test_set=dataset.test;
% get the sample number of test_set
test_sample_num = size(test_set, 2);

%change the train image into a column vector of 28*28=784 dimensions
train_data = zeros(28^2, train_sample_num);
for i = 1: train_sample_num
    train_data(:, i) = train_set{i}(:);
end

% use pca2 (PCA SVD)
[PC,V] = pca2(train_data);
k_pc = pov_k_pc(V)
reduce=PC(:,1:k_pc);

% get projection matrix
projection= reduce'* train_data;

%plot 10 original test images
figure(1)
set(figure(1),'NumberTitle','off','Name','10 original test images');
for i=1:10
    Image=test_set{i};
    subplot(2, 5, i);
    display_digit(Image);
end

% change the test image into a column vector of 28*28=784 dimensions
test_data = zeros(28^2, test_sample_num);
for i = 1:test_sample_num
    test_data(:, i) = test_set{i}(:);
end
% Apply PCA2 to test set.
mean = mean(train_data,2);
optimal_pc=k_pc;
% do dimension reduction
test_projection=reduce'* (test_data-repmat(mean,1,test_sample_num));

%reconstruction
reconstruction= reduce*test_projection+repmat(mean,1,test_sample_num);
figure(2)
set(figure(2),'NumberTitle','off','Name','Corresponding reconstructed images for comparison');
for i=1:test_sample_num
    col=reconstruction(:,i);
    image=reshape(col,28,28);
    subplot(2, 5, i);
    display_digit(image);
end

%estimate their reconstruction errors
rc_err = zeros(1, test_sample_num);
difference=test_data-reconstruction;
for i = 1: test_sample_num
    rc_err(i) = norm(difference(:,i))^2;
end
reconstruction_errors=sum(rc_err)/test_sample_num



