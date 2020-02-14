clc;clear;

%% �ǂݍ��ރf�[�^�̑I��
select_data = 'test_data/non-LPF-High';


%% RADRA�f�[�^�̓ǂݍ���
% CSV����s��f�[�^�𐶐�
rada_raw_data = readmatrix(strcat(select_data, '/3.csv'));
rada_raw_data(end,:) = [];

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
acc_raw_data = readmatrix(strcat(select_data, '/acc.csv'));

acc_data = acc_raw_data;
acc_data(1,:) = [];
acc_data(:,1) = [];

acc_time_data = radar_time_data(:,1);
acc_time_data(1,:) = [];

simin_acc.signals.values = acc_data;
simin_acc.signals.dimensions = size(simin_acc.signals.values,2);
simin_acc.time = acc_time_data;


%% �O���t�̕`��
subplot(2,1,1)
mesh(radar_time_data, radar_dis_data, radar_amp_data.')
view(2)
xlim([25 35])
ylim([0.1 0.5])
subplot(2,1,2)
plot(acc_time_data, acc_data)
xlim([25 35])


%% �p�����[�^
stopTime = SimIn.time(end);
indexToMeter = radar_dis_data(1, 2) - radar_dis_data(1, 1);
