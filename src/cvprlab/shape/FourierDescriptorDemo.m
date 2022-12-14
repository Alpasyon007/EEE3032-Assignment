%% EEE3032 - Computer Vision and Pattern Recognition (ee3.cvpr)
%%
%% FourierDescriptorDemo.m
%% A lab demo of Fourier Descriptors - user sketches a polygon and the
%% first 16 angular fourier descriptors are displayed.
%%
%% Usage:  FourierDescriptorDemo (no parameters, stand-alone demo program)
%%
%% (c) John Collomosse 2010  (J.Collomosse@surrey.ac.uk)
%% Centre for Vision Speech and Signal Processing (CVSSP)
%% University of Surrey, United Kingdom
 
close all;
clear all;

% Get a shape from the user.  This function returns a binary mask and a
% polygon of the drawn shape.  For now we will directly use the polygon and
% ignore the mask
[mask p]=DrawShape(200);
close all;

% Convert the polygon vertices into a set of points regularly sampled
% around the perimeter of the polygon.  This sampling is essential for
% Fourier Descriptors to work correctly.
samps=SamplePolygonPerimeter(p,100);

% Compute the fourier descriptors.  For 100 samples we can compute up to 50
% descriptors due to Nyquist's limit.  Here we are computing the first 16
% but ignoring the DC component - so we request 2:17 from the function.

%central fourier descriptors
%f=computeFD(samps,2:17,1);

%angular fourier descriptors
f=computeFDAngular(samps,2:17,1);


% Plot the original sketched shape and the Fourier Descriptors
figure;
subplot(1,2,1);
axis ij;
axis square;
axis on;
xlabel('X'); ylabel('Y');
plot(samps(1,:),samps(2,:),'rx');

subplot(1,2,2);
bar(f);
axis tight;
xlabel('n-th Fourier Descriptor'); ylabel('Response');
