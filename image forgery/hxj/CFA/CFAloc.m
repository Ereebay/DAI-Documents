
function [map,stat1] = CFAloc(im1)

% Pattern of CFA on green channel
Bayer = [0, 1;
         1, 0];
     
% ȡ��ɫͨ��
im1 = im1(:,:,2);

% ��ȡͼ��Ŀ�Ⱥ͸߶�
dim1 = size(im1);

% ��ֵ
pre1 = prediction(im1);

% �ɼ����غ��ڲ����صľֲ��仯
[var_map1,] = getVarianceMap(pre1, Bayer, dim1);

% ��ȡ����
stat1 = getFeature(var_map1, Bayer);

% GMMģ�Ͳ�������
[mu, sigma] = MoGEstimationZM(stat1);

% ������Ȼͼ ��ͳ�Ƶ��������з���
loglikelihood_map = loglikelihood(stat1, mu, sigma);

% ����Ȼͼ������ֵ�˲�
func = @(x) sum(x(:));
log_L_cum = blkproc(loglikelihood_map,[3 3],func);
map = medfilt2(log_L_cum,[3 3]);

return
