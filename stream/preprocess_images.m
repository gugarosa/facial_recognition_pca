% Pre-process a batch of images
function [] = preprocess_images(identifier, height, width)

% Actual loading and writing images path, based on identifier passed as parameter
load_path = strcat('data/raw/', identifier, '/');
write_path = strcat('data/processed/', identifier, '/');

% Gets all images from the folder
imgs = dir(strcat(load_path, '*.jpg'));

% Gets the amount of images
L = length(imgs);

% Iterate through all images
for i = 1:L
    % Loads image
    img = imread(strcat(load_path, imgs(i).name));
    
    % Resizing image to a standard
    img = imresize(img, [height width]);
    
    % Split image name and adds .pgm extension
    split_img_name = strsplit(imgs(i).name, '.');
    new_img_name = strcat(split_img_name{1}, '.pgm');
    
    % Writes new image to desired folder
    imwrite(img, strcat(write_path, new_img_name));
end