
function [map, stat1,stat2] = CFAloc(im1,im2)

% Pattern of CFA on green channel
Bayer = [0, 1;
         1, 0];
     
% ȡ��ɫͨ��
im1 = im1(:,:,2);
im2 = im2(:,:,2);
% ��ȡͼ��Ŀ�Ⱥ͸߶�
dim1 = size(im1);
dim2 = size(im2);

% ��ֵ
pre1 = prediction(im1);
pre2 = prediction(im2);
% �ɼ����غ��ڲ����صľֲ��仯
var_map1 = getVarianceMap(pre1, Bayer, dim1);
var_map2 = getVarianceMap(pre2, Bayer, dim2);

% ��ȡ����
stat1 = getFeature(var_map1, Bayer);
stat2 = getFeature(var_map2, Bayer);
% GMMģ�Ͳ�������
[mu, sigma] = MoGEstimationZM(stat1);

% ������Ȼͼ
loglikelihood_map = loglikelihood(stat1, mu, sigma);

% ����Ȼͼ������ֵ�˲�
map = medfilt2(loglikelihood_map,[5 5],'symmetric');

return
