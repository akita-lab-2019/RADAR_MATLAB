% CSV����s��f�[�^�𐶐�
DATA = readmatrix('test_data/3.csv');

% ����
t = DATA(:,1);
t(1,:) = [];

% �ő�U�����o������
[a_max, d_index] = max(DATA.');
d_index = d_index.';
d_index(1,:) = [];
d = d_index * (DATA(1,3) - DATA(1,2)) + DATA(1,2);
