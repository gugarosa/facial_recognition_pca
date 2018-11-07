% Plots minimum distance eigenface, maximum distance eigenface and the test
% eigenface first two dimensions
function [] = plot_eigenspace(eigenfaces, test_eigenface, min_index, max_index)

% Creates a subplot holding two cells
subplot(2, 2, [3,4]);

% Actual plot function
p = plot(test_eigenface(1), test_eigenface(2), 'o', eigenfaces(min_index, 1), eigenfaces(min_index, 2), '*', eigenfaces(max_index, 1), eigenfaces(max_index, 2), 'x');
title('2D Eigenspace Projetion', 'FontWeight', 'bold', 'Fontsize', 16, 'color', 'black');

% There are some important visual variables that we need to define
p(1).Color = 'black';
p(1).MarkerSize = 10;

p(2).Color = 'blue';
p(2).MarkerSize = 10;

p(3).Color = 'red';
p(3).MarkerSize = 10;