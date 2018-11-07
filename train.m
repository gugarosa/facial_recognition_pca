% Trains a face recognition system using PCA
function [eigenfaces, V, x_train_mean] = train(n_features, x_train, y_train)

% Creates a temporary ones training matrix
x_train_temp = uint8(ones(1, size(x_train, 2)));

% Calculates the mean of training set
x_train_mean = uint8(mean(x_train, 2));

% Gather training images without their mean
x_train_without_mean = x_train - uint8(single(x_train_mean) * single(x_train_temp));

% Calculares the correlation matrix
correlation = single(x_train_without_mean)'*single(x_train_without_mean);

% Gather its eigenspace projection
[V, d] = eig(correlation);

% Transforms it into a projection matrix
V = single(x_train_without_mean) * V;

% We only need the first n_features dimesions
V = V(:, end:-1:end - (n_features - 1));

% Creates an empty eigenfaces matrix for faster processing
eigenfaces = zeros(size(x_train, 2), n_features);

% Iterate through all training set
for i = 1:size(x_train, 2)
    % Calculate the eigenfaces by multiplying mean-removed images with
    % PCA's projection
    eigenfaces(i, :) = single(x_train_without_mean(:, i))' * V;
end