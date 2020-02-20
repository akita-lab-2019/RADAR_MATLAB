clc;clear;

%% 読み込む範囲の設定
start_time = 15;
end_time = 35;

%% 読み込むデータの選択
select_data = 'test_data/non-LPF-High';

%% RADRAデータの読み込み
% CSVから行列データを生成
radar_raw_data = readmatrix(strcat(select_data, '/3.csv'));
radar_raw_data(end,:) = [];
radar_amp_data = radar_raw_data(2:end,2:end);
radar_time_data = radar_raw_data(2:end,1);
radar_dis_data = radar_raw_data(1,2:end);

%% 加速度データの読み込み 
acc_raw_data = readmatrix(strcat(select_data, '/acc.csv'));
acc_raw_data(end,:) = [];
acc_time_data = acc_raw_data(:,1);
acc_data = acc_raw_data(:,2);

%% Simulinkに読ませるデータの生成
SimIn = createSimuIn(radar_time_data, radar_amp_data);
Simin_dis = createSimuIn(0, radar_dis_data);
simin_acc = createSimuIn(acc_time_data, acc_data);

%% グラフの描画
subplot(2,1,1)
mesh(SimIn.time, radar_dis_data, SimIn.signals.values.')
view(2)
subplot(2,1,2)
plot(radar_dis_data, SimIn.signals.values)
% plot(simin_acc.time, simin_acc.signals.values)

%% パラメータ
stopTime = SimIn.time(end);
indexToMeter = radar_dis_data(1, 2) - radar_dis_data(1, 1);
