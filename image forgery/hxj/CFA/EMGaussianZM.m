
function [alpha, sg1, mu1, sg2] = EMGaussianZM(x, tol)
%
% estimate Gaussian mixture parameters from data x with EM algorithm
% assume x distributed as alpha * N(0,v1) + (1 - alpha) * N(mu2, v2)

% ����������
max_iter = 500;
% ��ʼ�����ر�ѡ�еĸ���
alpha = 0.5;
% mean(x) ����x�ľ�ֵ 
mu1 = mean(x);
% var(x) ����Ϊ�����ܶȺ���f�Ķ��׾أ�����x�ķ���
sg2 = var(x);
sg1 = sg2/10;
alpha_old = 1;
k = 1;
while abs(alpha - alpha_old) > tol && k < max_iter
    alpha_old = alpha;
    k = k + 1;
    % expectation E�� ���ݵ�ǰ�Ĳ�������������
    f1 = alpha * exp(-x.^2/2/sg1)/sqrt(sg1);
    f2 = (1 - alpha) * exp(-(x - mu1).^2/2/sg2)/sqrt(sg2);
    alpha1 = f1 ./ (f1 + f2);
    alpha2 = f2 ./ (f1 + f2);
    % maximization M�� ����E���м���ĺ�������ټ����µĲ���
    alpha = mean(alpha1);
    sg1 = sum(alpha1 .* x.^2) / sum(alpha1);
    mu1 = sum(alpha2 .* x) / sum(alpha2);
    sg2 = sum(alpha2 .* (x - mu1).^2) / sum(alpha2);
end

return