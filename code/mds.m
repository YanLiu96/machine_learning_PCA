function [reduce] = mds(data,k)
% mds: Perform classic Multidimensional Scaling(MDS)
% data - MxN matrix of input data (M dimensions, N trials)
% k - the dimension
[m,~]=size(data);

t = zeros(m,m);
%Calculate the distance matrix of data points in the original space
for i = 1:m
    for j = 1:m
        t(i,j)=(norm(data(i,:)-data(j,:)))^2;
    end
end
%avoid singular and get a unit matrix
m1 = eye(m);
m2 = ones(m,1);
m3 = m1-(m2*m2')./m;
m4 = (-1/2)*m3*t*m3;
[PC,V] = eig(m4);
%sort the variance
v_sort = sqrt(V);
%get the reduce matrix
reduce = PC(:,1:k)*sqrt(v_sort(1:k,1:k));
end