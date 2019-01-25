clear all;close all;clc;

I=mat2gray(dicomread('D:\Matlab Course\heart\IM_0419'));

%% Rotation by pi/4 = 45 degrees
T1 = [cos(pi/4) sin(pi/4) 0; -sin(pi/4) cos(pi/4) 0; 0 0 1]; 
T_R = affine2d (T1);
I_R = imwarp ( I, T_R);

%% Scaling by 0.5 in both diemensions
% T2 = [0.5 0 0; 0 0.5 0; 0 0 1]; 
T_S = affine2d ( [0.5 0 0; 0 0.5 0; 0 0 1]);
I_S = imwarp (I, T_S);

%% combine two transformations
I_C = imwarp (I_R, T_S);

figure, subplot(221), imshow (I,[])
        subplot(222), imshow (I_R,[])
        subplot(223), imshow (I_S,[])
        subplot(224), imshow (I_C,[])
%%
J = imrotate(I,-45,'bilinear','crop');
figure, subplot(121), imshow (I,[])
        subplot(122), imshow (J,[])
        
J1 = imresize(I, 0.5);
figure, subplot(121), imshow (I,[])
        subplot(122), imshow (J1,[])
%%
fixed  = dicomread('knee1.dcm');
moving = dicomread('knee2.dcm');

figure,imshowpair(fixed, moving,'Scaling','joint');
[optimizer, metric] = imregconfig('multimodal');

movingRegistered = imregister(moving, fixed, 'affine', optimizer, metric);

figure,imshowpair(fixed, movingRegistered,'Scaling','joint');