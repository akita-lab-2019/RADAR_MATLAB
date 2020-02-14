clc;clear;

%% 読み込むデータの選択
select_data = 'test_data/non-LPF-High';


%% RADRAデータの読み込み
% CSVから行列データを生成
rada_raw_data = readmatrix(strcat(select_data, '/3.csv'));
rada_raw_data(end,:) = [];

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
acc_raw_data = readmatrix(strcat(select_data, '/acc.csv'));

acc_data = acc_raw_data;
acc_data(1,:) = [];
acc_data(:,1) = [];

acc_time_data = radar_time_data(:,1);
acc_time_data(1,:) = [];

simin_acc.signals.values = acc_data;
simin_acc.signals.dimensions = size(simin_acc.signals.values,2);
simin_acc.time = acc_time_data;


%% グラフの描画
subplot(2,1,1)
mesh(radar_time_data, radar_dis_data, radar_amp_data.')
view(2)
xlim([25 35])
ylim([0.1 0.5])
subplot(2,1,2)
plot(acc_time_data, acc_data)
xlim([25 35])


%% パラメータ
stopTime = SimIn.time(end);
indexToMeter = radar_dis_data(1, 2) - radar_dis_data(1, 1);
