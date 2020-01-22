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


% CSV����s��f�[�^�𐶐�
gyro_raw_data = readmatrix('test_data/gyro.csv');

gyro_data = gyro_raw_data;
gyro_data(1,:) = [];
gyro_data(:,1) = [];

gyro_time_data = gyro_raw_data(:,1);
gyro_time_data(1,:) = [];

simin_gyro.signals.values = gyro_data;
simin_gyro.signals.dimensions = size(simin_gyro.signals.values,2);
simin_gyro.time = gyro_time_data;


