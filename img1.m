%for image 1
clc;   
close all;  
workspace;  
format long g;
format compact;
fontSize = 10;
fullFileName = "images.jfif";
[folder, baseFileName, ext] = fileparts(fullFileName);
% read image
rgbImage = imread(fullFileName);
[rows, columns, numberOfColorChannels] = size(rgbImage);
% display original image
subplot(2, 2, 1);
imshow(rgbImage, []);
axis on;
caption = sprintf('Original Color Image, %s', baseFileName);
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
drawnow;
hp = impixelinfo(); 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0.05 1 0.95]);
% display image
subplot(2, 2, 4);
imshow(mask, []);
axis on;
title('Mask Image', 'FontSize', fontSize, 'Interpreter', 'None');
hp = impixelinfo();
drawnow;
subplot(2, 2, 1);
hold on;
boundaries = bwboundaries(mask);
numberOfBoundaries = size(boundaries, 1);
for k = 1 : numberOfBoundaries
  thisBoundary = boundaries{k};
  plot(thisBoundary(:,2), thisBoundary(:,1), 'y', 'LineWidth', 3);
end
hold off;
