clc;clear;

%% RADRAデータの読み込み
% CSVから行列データを生成
rada_raw_data = readmatrix('test_data/1.csv');

% 振幅のみの行列にする
radar_amp_data = rada_raw_data;
radar_amp_data(1,:) = [];
radar_amp_data(:,1) = [];

% 時間のベクトルを生成
radar_time_data = rada_raw_data(:,1);
radar_time_data(1,:) = [];

% 距離のベクトルを生成
radar_dis_data = rada_raw_data(1,:);
radar_dis_data(:,1) = [];

% Simulinkに読ませるデータの生成
SimIn.signals.values = radar_amp_data;
SimIn.signals.dimensions = size(SimIn.signals.values,2);
SimIn.time = radar_time_data;


%% ジャイロデータの読み込み 
gyro_raw_data = readmatrix('test_data/gyro.csv');

gyro_data = gyro_raw_data;
gyro_data(1,:) = [];
gyro_data(:,1) = [];

gyro_time_data = gyro_raw_data(:,1);
gyro_time_data(1,:) = [];

simin_gyro.signals.values = gyro_data;
simin_gyro.signals.dimensions = size(simin_gyro.signals.values,2);
simin_gyro.time = gyro_time_data;


%% グラフの描画
subplot(2,1,1)
mesh(radar_time_data, radar_dis_data, radar_amp_data.')
view(2)

subplot(2,1,2)
plot(gyro_time_data, gyro_data)


%% シミュレーションの終了時間を設定
stopTime = SimIn.time(end);
