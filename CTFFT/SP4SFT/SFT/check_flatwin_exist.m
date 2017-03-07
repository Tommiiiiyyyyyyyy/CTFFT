function [ check_flatwinresl ] = check_flatwin_exist( prm_mat, CD, FWF )
%UNTITLED6 この関数の概要をここに記述
%   詳細説明をここに記述
cd(FWF);

filename_prm = num2str(prm_mat);
filename_fw = ['flatwin_ft', filename_prm,'.mat'];

check_flatwinresl = exist(filename_fw,'file');
cd(CD);
end

