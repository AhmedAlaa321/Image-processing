clear all;close all;clc;

I=mat2gray(dicomread('E:\material matlap imageprocess\heart\IM_0419'));
[x, y] = size ( I );

h = fspecial('sobel');
%%%% filtering in spatial domain
I_s = imfilter(I,h);
%%%% filtering in frequency domain
I_f = fft2(I);

H=freqz2(h,[x y]);
H=ifftshift(H);

I_f1 = H.*I_f;
I_f2 = ifft2(I_f1);

figure,subplot(131),imshow(I,[])
subplot(132),imshow(I_s,[]),title('spatial domain filtering');
subplot(133),imshow(I_f2,[]),title('frequency domain filtering');

%% add noise to image

I_n=imnoise ( I, 'salt & pepper', 0.02);
I_n_filt=medfilt2(I_n);

figure,subplot(131),imshow(I)
subplot(132),imshow(I_n),title('noisy image');
subplot(133),imshow(I_n_filt),title('filtered image');

%%%%%%
I_n1=imnoise ( I, 'gaussian');

h2=fspecial('gaussian',[7 7],1);
I_n_filt1=imfilter(I_n1,h2);

I_n_filt2=medfilt2(I_n1);

figure,subplot(221),imshow(I)
subplot(222),imshow(I_n1),title('noisy image');
subplot(223),imshow(I_n_filt1),title('gaussian filter');
subplot(224),imshow(I_n_filt2),title('median filter');

%% noise estimation

figure,subplot(221),imshow(I_n,[])

N=I_n(20:60,10:50);
subplot(222),imshow(N,[])

subplot(223),imhist(N),xlim([-1 2])

%%%%%
figure,subplot(221),imshow(I_n1,[])

N1=I_n1(20:60,10:50);
subplot(222),imshow(N1,[])

subplot(223),imhist(N1),xlim([-1 2])
