


function [mu,sigma] = MoGEstimationZM (statistics)

% Expectation Maximization Algorithm with Zero-Mean forced first component 
% NaN and Inf management

statistics(isnan(statistics)) = 1;
data = log(statistics(:)); 
data = data(not(isinf(data)|isnan(data)));  
                   

% E/M algorithm

[mu1,v1,v2] = EMGaussianZM(data); 

% �۸ĺ��ͼ��muֵ����    
mu= [mu1 ; 0];   

sigma = sqrt([v2; v1]);

return

