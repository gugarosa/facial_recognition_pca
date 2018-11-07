% Loads a database
function [X, Y] = load_database(identifier, n_features, n_persons, n_images_per_person)

% Persists all variables, so it is only loaded once
persistent loaded_db;
persistent x;
persistent y;

% Derive initial variables
n_images = n_persons * n_images_per_person;

% Creates temporary matrices to hold data
temp_x = zeros(n_features, n_images);
temp_y = zeros(1, n_images);

% Loading data
if (isempty(loaded_db))
    % Initial counter value
    k = 1;
    % Iterate through all individuals
    for i = 1:n_persons
        % Iterate through all individual images
        for j = 1:n_images_per_person
            % Loads input image
            img = imread(strcat('data/processed/', identifier, '/', num2str(i), '-', num2str(j), '.pgm'));
            
            % Convert image matrix to image vector
            img_vec = mat2vec(img);
            
            % Apply current image to temporary matrices
            temp_x(:, k) = reshape(img_vec, size(img_vec, 1) * size(img_vec, 2), 1);
            temp_y(k) = i;
            
            % Increment the counter
            k = k + 1;
        end
    end
    % Convert to unsigned 8 bit numbers to save memory
    x = uint8(temp_x);
    y = uint8(temp_y);
end

% Set loaded flag
loaded_db = 1;

% Return outputs
X = x;
Y = y;