clc;clear;

%% �ǂݍ��ރf�[�^�̑I��
select_data = 'test_data/use-LPF-Low';


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
gyro_raw_data = readmatrix(strcat(select_data, '/gyro.csv'));

gyro_data = gyro_raw_data;
gyro_data(1,:) = [];
gyro_data(:,1) = [];

gyro_time_data = gyro_raw_data(:,1);
gyro_time_data(1,:) = [];

% �]���ȂƂ�����J�b�g
for i = 1:numel(gyro_time_data)
    if gyro_time_data(i) > radar_time_data(end)
        gyro_time_data(i:end) = [];
        gyro_data(i:end) = [];
        break;
    end    
end

simin_gyro.signals.values = gyro_data;
simin_gyro.signals.dimensions = size(simin_gyro.signals.values,2);
simin_gyro.time = gyro_time_data;


%% �O���t�̕`��
subplot(2,1,1)
mesh(radar_time_data, radar_dis_data, radar_amp_data.')
view(2)

subplot(2,1,2)
plot(gyro_time_data, gyro_data)


%% �p�����[�^
stopTime = SimIn.time(end);
indexToMeter = radar_dis_data(1, 2) - radar_dis_data(1, 1);
