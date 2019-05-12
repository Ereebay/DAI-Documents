
im2 = imread('flowers.tiff');
im1 = imread('flowers-tampered.tiff');

% ��ȡ��λ�۸������ͼ���Լ�ͳ������
[map,stat1] = CFAloc(im1);

data1 = log(stat1(:));
n_bins1 = round(sqrt(length(data1)));

subplot(2,2,1), imshow(im2), title('Not tampered image');
subplot(2,2,2), imshow(im1), title('Manipulated image');
subplot(2,2,3), imagesc(map),colormap('gray'), title('Probability map ');
subplot(2,2,4), hist(data1, n_bins1), title('Histogram of the proposed feature');