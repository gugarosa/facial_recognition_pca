% Transforms a matrix into a vector
function vector = mat2vec(matrix)

% Deriving variables from matrix parameter
[height, width] = size(matrix);

% Iterating through height
for i = 1:height
    vector((i - 1) * width + 1:i * width) = matrix(i, :);
end