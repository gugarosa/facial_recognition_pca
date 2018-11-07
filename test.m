% Tests a face recognition system calculating distance between eigenfaces
function [test_eigenface, min_img, max_img] = test(eigenfaces, V, mean, x_test, y_test)

% Creates a test image without the mean image
x_test_without_mean = x_test - mean;

% Gather its eigenface by multiplying its value with the projection learnt
% from PCA
test_eigenface = single(x_test_without_mean)' * V;

% Holds an array of distance norms
z = [];

% Iterate through all eigenfaces
for i = 1:size(eigenfaces, 1)
    % Append to the array, the norm between the ith eigenface and the test
    % eigendace
    z = [z, norm(eigenfaces(i, :) - test_eigenface, 2)];
end

% Gather minimum norm value and its index
[a, min_img] = min(z);

% Also father maximum norm value and its index
[b, max_img] = max(z);