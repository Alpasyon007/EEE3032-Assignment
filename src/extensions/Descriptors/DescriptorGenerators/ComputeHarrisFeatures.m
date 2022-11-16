function ComputeHarrisFeatures(img)

img=rgb2gray(img);
corners = detectHarrisFeatures(img);
figure('Name',"Harris Features",'NumberTitle','off')
imshow(img); hold on;
plot(corners.selectStrongest(200));

mask = poly2mask(corners.selectStrongest.x, corners.selectStrongest.y, 16, 16);
% extractedPixelValues = grayImage(mask);
imgshow(mask);