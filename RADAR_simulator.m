clc;clear;

%% 読み込む範囲の設定
start_time = 15;
end_time = 35;


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

% end_time = radar_time_data(end);

%% 加速度データの読み込み 
acc_raw_data = readmatrix(strcat(select_data, '/acc.csv'));

acc_data = acc_raw_data;
acc_data(1,:) = [];
acc_data(:,1) = [];

%% Simulinkに読ませるデータの生成
SimIn = createSimuIn(radar_time_data, radar_amp_data);
simin_acc = createSimuIn(radar_time_data, acc_data);

%% データのトリミング 
% for i = 1:size(radar_time_data)
%     if radar_time_data(i) >= start_time 
%         radar_time_data(1:i) = [];
%         radar_amp_data(1:i,:) = [];
%         acc_data(1:i) = [];
%         break;
%     end
% end
% 
% for i = 1:size(radar_time_data)
%     if radar_time_data(i) >= end_time 
%         radar_time_data(i:end) = [];        
%         radar_amp_data(i:end,:) = [];
%         acc_data(i:end,:) = [];
%         break;
%     end
% end
acc_time_data = radar_time_data(:,1);
acc_time_data(end,:) = [];

%% グラフの描画
subplot(2,1,1)
mesh(radar_time_data, radar_dis_data, radar_amp_data.')
view(2)
subplot(2,1,2)
plot(acc_time_data, acc_data)


%% パラメータ
stopTime = SimIn.time(end);
indexToMeter = radar_dis_data(1, 2) - radar_dis_data(1, 1);
