% Use of test's output in order to derive some metrics
function [score] = metrics(y_train, y_test, min_index)

% Checks if predicted minimum distance image's label is equal to test image
% label
if (y_train(min_index) == y_test)
    % If yes, score will be set as 1
    score = 1;
else
    % If not, it will be set as 0
    score = 0;
end