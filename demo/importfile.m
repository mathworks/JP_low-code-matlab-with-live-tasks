function dataNORU = importfile(filename, dataLines)
%IMPORTFILE テキスト ファイルからデータをインポート
%  DATANORU = IMPORTFILE(FILENAME) は既定の選択に関してテキスト ファイル FILENAME
%  からデータを読み取ります。  データを table として返します。
%
%  DATANORU = IMPORTFILE(FILE, DATALINES) はテキスト ファイル FILENAME
%  の指定された行区間のデータを読み取ります。DATALINES
%  を正の整数スカラーとして指定するか、行区間が不連続の場合は正の整数スカラーからなる N 行 2 列の配列として指定します。
%
%  例:
%  dataNORU = importfile("C:\Users\minoue\OneDrive - MathWorks\Shared with Everyone\20211111_IntroMATLAB\Demo_sampleScript\data_NORU.csv", [2, Inf]);
%
%  READTABLE も参照してください。
%
% MATLAB からの自動生成日: 2022/04/21 13:22:36

%% 入力の取り扱い

% dataLines が指定されていない場合、既定値を定義します
if nargin < 2
    dataLines = [2, Inf];
end

%% インポート オプションの設定およびデータのインポート
opts = delimitedTextImportOptions("NumVariables", 8);

% 範囲と区切り記号の指定
opts.DataLines = dataLines;
opts.Delimiter = ",";

% 列名と型の指定
opts.VariableNames = ["ID", "Name", "Time", "Grade", "Latitude", "Longitude", "Pressure", "WindSpeed"];
opts.VariableTypes = ["double", "categorical", "datetime", "double", "double", "double", "double", "double"];

% ファイル レベルのプロパティを指定
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 変数プロパティを指定
opts = setvaropts(opts, "Name", "EmptyFieldRule", "auto");
opts = setvaropts(opts, "Time", "InputFormat", "yyyy/MM/dd HH:mm:ss");

% データのインポート
dataNORU = readtable(filename, opts);

end