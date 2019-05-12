



function [statistics] = getFeature(var_map,Bayer)

% logical �����еķ�����1 �����߼�0
% sigma() �±�����
% prod ��������Ԫ�ص����˻�
% func ��ģ��Bayer�� �����źŵ����˻�/��ֵ�źŵ����˻�


func = @(x) (sqrt(prod(x(logical(Bayer)))))/(sqrt(prod(x(not(logical(Bayer))))));

statistics = blkproc(var_map,[2 2],func);



return

