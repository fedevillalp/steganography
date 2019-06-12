% By Federico Villalpando
% This codes creates two images that look like white noise.
% When superimposed, the images greate a third image.

%Algorithm
%Flip coin
%Select pattern based on coin flip result
%Save pattern in four pixels in image A
%Move to next pixel in image A
%Save pattern in four pixels in image B
%Move to next pixel in image B

clear

%Create image and represent as binary
I = imread('cow2.png');
I = rgb2gray(I);
BW = imbinarize(I);

%figure
%imshowpair(I,BW,'montage')

[rows,columns] = size(BW);
A = zeros(rows);
B = zeros(rows);
z=1;

%Read pixel
for y = 1:rows
    for x = 1:columns
            
            if BW(y,x) == 1 && randi([0 1]) ==1
                        A(z,x*2+1) = 1;
                        A(z,x*2+2) = 0; 
                        A(z+1,x*2+1) = 0;
                        A(z+1,x*2+2) = 1; 
                        B(z,x*2+1) = 0;
                        B(z,x*2+2) = 1; 
                        B(z+1,x*2+1) = 1;
                        B(z+1,x*2+2) = 0;
            elseif BW(y,x) == 1 && randi([0 1]) ==0
                        A(z,x*2+1) = 0;
                        A(z,x*2+2) = 1; 
                        A(z+1,x*2+1) = 1;
                        A(z+1,x*2+2) = 0; 
                        B(z,x*2+1) = 1;
                        B(z,x*2+2) = 0; 
                        B(z+1,x*2+1) = 0;
                        B(z+1,x*2+2) = 1;
            elseif BW(y,x) == 0 && randi([0 1]) ==1
                        A(z,x*2+1) = 1;
                        A(z,x*2+2) = 0; 
                        A(z+1,x*2+1) = 0;
                        A(z+1,x*2+2) = 1; 
                        B(z,x*2+1) = 1;
                        B(z,x*2+2) = 0; 
                        B(z+1,x*2+1) = 0;
                        B(z+1,x*2+2) = 1;
            elseif BW(y,x) == 0 && randi([0 1]) == 0
                        A(z,x*2+1) = 0;
                        A(z,x*2+2) = 1; 
                        A(z+1,x*2+1) = 1;
                        A(z+1,x*2+2) = 0; 
                        B(z,x*2+1) = 0;
                        B(z,x*2+2) = 1; 
                        B(z+1,x*2+1) = 1;
                        B(z+1,x*2+2) = 0;
            end
           
    end
 z=2*y+1;
end


A = uint8(A*255);  %Image A  0-1 to 0-255 and 
B = uint8(B*255);  %Image B

C = A | B;          %Add image A + B to get decoded picture
C = uint8(C*255);

imshow(C)

imwrite(A,'/Users/federico/Desktop/A.png');
imwrite(B,'/Users/federico/Desktop/B.png');
imwrite(C,'/Users/federico/Desktop/C.png');


%------------------
% Comented Code:

%imwrite(A,'/Users/federico/Desktop/A', 'tif');
%imwrite(B,'/Users/federico/Desktop/B','tif');
%imwrite(C,'/Users/federico/Desktop/C','tif');
%A=imbinarize(A);
%B=imbinarize(B);

% imwrite(A,'/Users/federico/Desktop/A', 'png','BitDepth', 8);
% imwrite(B,'/Users/federico/Desktop/B','png','BitDepth', 8);
% imwrite(C,'/Users/federico/Desktop/C','png','BitDepth', 8);

% imwrite(A,'/Users/federico/Desktop/A','png','BitDepth',8);
% imwrite(B,'/Users/federico/Desktop/B','png','BitDepth',8);
%imwrite(C,'/Users/federico/Desktop/C','tif');

%A = mat2gray(A);
%B = mat2gray(B);
%C = imfuse(A,B);
%imshowpair(A,B);
%C = A | B;
%imshow(C);
%hold on
%imshow(C);

%A = imread('/Users/federico/Desktop/AA.bmp');
%B = imread('/Users/federico/Desktop/BB.tif');










