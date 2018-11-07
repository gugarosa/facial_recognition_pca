% Transforms a vector into a matrix
function matrix = vec2mat(vector)

% Defining initial variables
height = 112;
width = 92;

% Creates a zeros matrix for faster operations
matrix = zeros(height, width);

% Iterate through height size
for i = 1:height
    matrix(i, :) = vector((i - 1) * width + 1:i * width);
end