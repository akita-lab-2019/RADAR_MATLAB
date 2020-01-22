clc;clear;

% CSVから行列データを生成
DATA = readmatrix('test_data/1.csv');

% 振幅のみの行列にする
amp_data = DATA;
amp_data(1,:) = [];
amp_data(:,1) = [];

% 時間のベクトルを生成
time_data = DATA(:,1);
time_data(1,:) = [];

% Simulinkに読ませるデータの生成
SimIn.signals.values = amp_data;
SimIn.signals.dimensions = size(SimIn.signals.values,2);
SimIn.time = time_data;
