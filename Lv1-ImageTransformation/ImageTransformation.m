clear;
clc;

% Point out four corners of the outline of image to make it in the right
% position. Input order should align to target image's left-top, right-top,
% left-bottom, right-bottom
addpath('../includes/ginputc/');
originImage = imread(uigetfile('*.png'));
[height, width, channel] = size(originImage);
imshow(originImage);
targetCorners = [1, 1; width, 1; 1, height; width, height];
[X, Y] = ginputc(4, 'Color', 'r', 'ShowPoints', true);
originCorners = [X, Y];
transformation = fitgeotrans(targetCorners, originCorners, 'projective');
resultImage = imwarp(originImage, transformation);
imshow(resultImage)