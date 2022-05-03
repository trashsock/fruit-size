%for image 1
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;
fontSize = 10;
fullFileName = "images.jfif";
[folder, baseFileName, ext] = fileparts(fullFileName);
% Read in demo image.
rgbImage = imread(fullFileName);
[rows, columns, numberOfColorChannels] = size(rgbImage);
% Display the original image.
subplot(2, 2, 1);
imshow(rgbImage, []);
axis on;
caption = sprintf('Original Color Image, %s', baseFileName);
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
drawnow;
% Set up status line to see values when you mouse over the image.
hp = impixelinfo(); 
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0.05 1 0.95]);
% Display the image.
subplot(2, 2, 4);
imshow(mask, []);
axis on;
title('Mask Image', 'FontSize', fontSize, 'Interpreter', 'None');
hp = impixelinfo();
drawnow;
subplot(2, 2, 1); % Switch back to the original image in the upper left.
hold on;
boundaries = bwboundaries(mask);
numberOfBoundaries = size(boundaries, 1);
for k = 1 : numberOfBoundaries
  thisBoundary = boundaries{k};
  plot(thisBoundary(:,2), thisBoundary(:,1), 'y', 'LineWidth', 3);
end
hold off;
