clc;clear;

%% RADRA�f�[�^�̓ǂݍ���
% CSV����s��f�[�^�𐶐�
rada_raw_data = readmatrix('test_data/1.csv');

% �U���݂̂̍s��ɂ���
radar_amp_data = rada_raw_data;
radar_amp_data(1,:) = [];
radar_amp_data(:,1) = [];

% ���Ԃ̃x�N�g���𐶐�
radar_time_data = rada_raw_data(:,1);
radar_time_data(1,:) = [];

% �����̃x�N�g���𐶐�
radar_dis_data = rada_raw_data(1,:);
radar_dis_data(:,1) = [];

% Simulink�ɓǂ܂���f�[�^�̐���
SimIn.signals.values = radar_amp_data;
SimIn.signals.dimensions = size(SimIn.signals.values,2);
SimIn.time = radar_time_data;


%% �W���C���f�[�^�̓ǂݍ��� 
gyro_raw_data = readmatrix('test_data/gyro.csv');

gyro_data = gyro_raw_data;
gyro_data(1,:) = [];
gyro_data(:,1) = [];

gyro_time_data = gyro_raw_data(:,1);
gyro_time_data(1,:) = [];

simin_gyro.signals.values = gyro_data;
simin_gyro.signals.dimensions = size(simin_gyro.signals.values,2);
simin_gyro.time = gyro_time_data;


%% �O���t�̕`��
subplot(2,1,1)
mesh(radar_time_data, radar_dis_data, radar_amp_data.')
view(2)

subplot(2,1,2)
plot(gyro_time_data, gyro_data)


%% �V�~�����[�V�����̏I�����Ԃ�ݒ�
stopTime = SimIn.time(end);
