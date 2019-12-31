% CSVから行列データを生成
DATA = readmatrix('test_data/3.csv');

% 時間
t = DATA(:,1);
t(1,:) = [];

% 最大振幅が出た距離
[a_max, d_index] = max(DATA.');
d_index = d_index.';
d_index(1,:) = [];
d = d_index * (DATA(1,3) - DATA(1,2)) + DATA(1,2);
