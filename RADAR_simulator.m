clc;clear;

%% �ǂݍ��ޔ͈͂̐ݒ�
start_time = 15;
end_time = 35;


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

% end_time = radar_time_data(end);

%% �����x�f�[�^�̓ǂݍ��� 
acc_raw_data = readmatrix(strcat(select_data, '/acc.csv'));

acc_data = acc_raw_data;
acc_data(1,:) = [];
acc_data(:,1) = [];


%% �f�[�^�̃g���~���O 
for i = 1:size(radar_time_data)
    if radar_time_data(i) >= start_time 
        radar_time_data(1:i) = [];
        radar_amp_data(1:i,:) = [];
        acc_data(1:i) = [];
        break;
    end
end

for i = 1:size(radar_time_data)
    if radar_time_data(i) >= end_time 
        radar_time_data(i:end) = [];        
        radar_amp_data(i:end,:) = [];
        acc_data(i:end,:) = [];
        break;
    end
end
acc_time_data = radar_time_data(:,1);

%% Simulink�ɓǂ܂���f�[�^�̐���
SimIn.signals.values = radar_amp_data;
SimIn.signals.dimensions = size(SimIn.signals.values,2);
SimIn.time = radar_time_data;

simin_acc.signals.values = acc_data;
simin_acc.signals.dimensions = size(simin_acc.signals.values,2);
simin_acc.time = acc_time_data;


%% �O���t�̕`��
subplot(2,1,1)
mesh(radar_time_data, radar_dis_data, radar_amp_data.')
view(2)
subplot(2,1,2)
plot(acc_time_data, acc_data)


%% �p�����[�^
stopTime = SimIn.time(end);
indexToMeter = radar_dis_data(1, 2) - radar_dis_data(1, 1);
