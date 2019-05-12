

function [var_map,var_map_interpolated] = getVarianceMap(im,Bayer,dim)

% ��BayerΪģ������γ��, pattern ��ͼ���С��ͬ pattern�������� �������źźͲ�ֵ�źŷֿ�
pattern = kron(ones(dim(1)/2,dim(2)/2), Bayer);

window = gaussian_window();

% ��һ��
mc = sum(sum(window));% ��˹�˵�ϵ��
window_mean = window./mc;% ��һ��
vc = 1 - (sum(sum((window.^2)))); %��ƫ��������

%  variance of acquired pixels
acquired = im.*(pattern);%�Ѳ����źų������
mean_map_acquired = imfilter(acquired,window_mean,'replicate').*pattern;%��˹�˲��������������ź� ���ΪԤ�����ֲ���Ȩ��ֵ
sqmean_map_acquired = imfilter(acquired.^2,window_mean,'replicate').*pattern;%��˹�˲�������������ź�
var_map_acquired =  (sqmean_map_acquired - (mean_map_acquired.^2))/vc;   % �ֲ���Ȩ����

%  variance of interpolated pixels
interpolated = im.*(1-pattern);
mean_map_interpolated = imfilter(interpolated,window_mean,'replicate').*(1-pattern); %��˹�˲�
sqmean_map_interpolated = imfilter(interpolated.^2,window_mean,'replicate').*(1-pattern); %��˹�˲�
var_map_interpolated = (sqmean_map_interpolated - (mean_map_interpolated.^2))/vc;% �ֲ���Ȩ����

var_map = var_map_acquired + var_map_interpolated;

return