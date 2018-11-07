% Face Recognition using PCA

% Initial variables
db_identifier = 'AT&T';

height = 112;
width = 92;

n_features = 80;
n_persons = 40;
n_images_per_person = 10;

% Any dataset different from AT&T needs to be pre-processed
if not (strcmp(db_identifier, 'AT&T'))
    preprocess_images(db_identifier, height, width)
end

% Calling actual database loading function
[x, y] = load_database(db_identifier, height * width, n_persons, n_images_per_person);

% Splitting database
[x_train, y_train, x_test, y_test] = split_database(x, y);

% Training the model with PCA
[eigenfaces, projection, mean] = train(n_features, x_train, y_train);

% Testing the model
[test_eigenface, min_index, max_index] = test(eigenfaces, projection, mean, x_test, y_test);

% Plotting actual minimum and maximum distance faces, along with the test one
plot_faces(x_train, x_test, min_index, max_index);

% Also plotting their eigenspace (first two dimensions)
plot_eigenspace(eigenfaces, test_eigenface, min_index, max_index);