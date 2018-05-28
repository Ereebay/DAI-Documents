



function [statistics] = getFeature(map,Bayer)

% logical �����еķ�����1 �����߼�0
% sigma() �±�����
% prod ��������Ԫ�ص����˻�
% ����CFA��ֵʱ���ɼ��ź������ϵķ���Ȳ�ֵ�ź������ϵķ���Ҫ��
% ������ʱ��������û������

% dimensione of statistics
Nb = 2;
% func ��ģ��Bayer�� �����źŵ����˻�/��ֵ�źŵ����˻�
func = @(sigma) (prod(sigma(logical(Bayer))))/(prod(sigma(not(logical(Bayer)))));


% blkproc ��ͼ�������[nb, nb]Ϊ��λ�ֿ鴦��
statistics = blkproc(map,[Nb Nb],func);

return

