% Face Recognition using PCA

% Clearing all vars
clearvars

% Adding all subfolders in order to work
addpath(genpath(pwd))

% Initial variables
db_identifier = 'AT&T';

height = 112;
width = 92;

n_features = 80;
n_persons = 40;
n_images_per_person = 10;

n_runs = 100;
score = 0;

% Any dataset different from AT&T needs to be pre-processed
if not (strcmp(db_identifier, 'AT&T'))
    preprocess_images(db_identifier, height, width)
end

% Calling actual database loading function
[x, y] = load_database(db_identifier, height * width, n_persons, n_images_per_person);

for k = 1:n_runs
    % Splitting database
    [x_train, y_train, x_test, y_test] = split_database(x, y);

    % Training the model with PCA
    [eigenfaces, projection, mean] = train(n_features, x_train, y_train);

    % Testing the model
    [test_eigenface, min_index, max_index] = test(eigenfaces, projection, mean, x_test);

    % Using test's output in order to derive some metrics
    score = score + metrics(y_train, y_test, min_index);
end

% We measure accuracy by dividing the score per number of runnings
accuracy = score / n_runs