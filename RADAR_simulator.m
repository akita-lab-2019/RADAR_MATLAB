clc;clear;

% CSV����s��f�[�^�𐶐�
DATA = readmatrix('test_data/1.csv');

% �U���݂̂̍s��ɂ���
amp_data = DATA;
amp_data(1,:) = [];
amp_data(:,1) = [];

% ���Ԃ̃x�N�g���𐶐�
time_data = DATA(:,1);
time_data(1,:) = [];

% Simulink�ɓǂ܂���f�[�^�̐���
SimIn.signals.values = amp_data;
SimIn.signals.dimensions = size(SimIn.signals.values,2);
SimIn.time = time_data;
