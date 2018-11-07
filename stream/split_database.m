% Splits a database into training and testing sets
function [x_train, y_train, x_test, y_test] = split_database(x, y)

% We get a random index between 1 and the amount of data
random = round((size(x, 2) - 1) * rand(1, 1)) + 1;

% Creating testing set
x_test = x(:, random);
y_test = y(:, random);

% Creating training set
x_train = x(:, [1:random - 1 random + 1:end]);
y_train = y(:, [1:random - 1 random + 1:end]);