


function [mu,sigma,mix_perc] = MoGEstimationZM (statistics)

% Expectation Maximization Algorithm with Zero-Mean forced first component 

% E/M algorithm parameters inizialization
% ���������
tol = 1e-3;

% NaN and Inf management

statistics(isnan(statistics)) = 1;
data = log(statistics(:)); 
data = data(not(isinf(data)|isnan(data)));                     

% E/M algorithm

[alpha, sg1, mu1, sg2] = EMGaussianZM(data, tol); 

% ����ģ�Ͳ���
% �۸ĺ��ͼ��muֵ����    
mu= [mu1 ; 0];   

sigma = sqrt([sg2; sg1]);
%disp(sigma)
mix_perc = [1-alpha;alpha];
%disp(mix_perc)
return

