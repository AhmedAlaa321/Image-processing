clear all;close all;clc;

I=mat2gray(dicomread('E:\material matlap imageprocess\heart\IM_0419'));

%%% average filter
h1 = fspecial('average',[3 3]);
I1 = imfilter(I,h1);

h2 = fspecial('average',[7 7]);
I2 = imfilter(I,h2);

figure,subplot(131),imshow(I)
subplot(132),imshow(I1)
subplot(133),imshow(I2)

%%%%% median filter
B1 = medfilt2(I, [3 3]);
B2 = medfilt2(I, [7 7]);

figure,subplot(131),imshow(I)
subplot(132),imshow(B1)
subplot(133),imshow(B2)
%%
%%% laplacian filter

% The Laplacian of an image highlights regions of rapid intensity change and is therefore often used for edge detection
h3 = fspecial('laplacian',0.2);
I3 = imfilter(I,h3);

h4 = fspecial('laplacian',1);
I4 = imfilter(I,h4);

figure,subplot(131),imshow(I)
subplot(132),imshow(I3)
subplot(133),imshow(I4)
%%
h5=(1/9)*[1 1 1;1 1 1;1 1 1];
I5 = imfilter(I,h5);

figure,subplot(131),imshow(I)
subplot(132),imshow(I1)
subplot(133),imshow(I5)