% Plotting minimum and maximum distance faces, along with the test one
function [] = plot_faces(x_train, x_test, min_index, max_index)

% Creates a subplot for first cell and plot test image
subplot(2, 3, 1);
imshow(vec2mat(x_test), []);
title('Finding ...', 'FontWeight', 'bold', 'Fontsize', 16, 'color', 'black');

% We also need to define this for the minimum distance face
subplot(2, 3, 2);
imshow(vec2mat(x_train(:, min_index)), []);
title('Best!', 'FontWeight', 'bold', 'Fontsize', 16, 'color', 'blue');

% Again for the maximum distance face
subplot(2, 3, 3);
imshow(vec2mat(x_train(:, max_index)), []);
title('Worst!', 'FontWeight', 'bold', 'Fontsize', 16, 'color', 'red');