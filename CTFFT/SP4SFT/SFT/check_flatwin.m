function [ check_flatwinresl ] = check_flatwin( prm_mat )
%UNTITLED6 ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
filename_prm = num2str(prm_mat);
filename_fw = ['flatwin_ft', filename_prm];

check_flatwinresl = exist(filename_fw, 'file');
end

