function [ check_flatwinresl ] = check_flatwin( prm_mat )
%UNTITLED6 この関数の概要をここに記述
%   詳細説明をここに記述
filename_prm = num2str(prm_mat);
filename_fw = ['flatwin_ft', filename_prm];

check_flatwinresl = exist(filename_fw, 'file');
end

