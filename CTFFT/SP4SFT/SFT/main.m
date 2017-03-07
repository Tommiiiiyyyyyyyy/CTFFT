clear

CD = cd;%���݂̃t�H���_�̃p�X��ۑ��B

FWF = 'FlatWindowFunc';% Flat Window Function ��ۑ�����t�H���_�̖��O�B
SR = 'SimulationResults';% Simulation ���ʂ�ۑ�����t�H���_�̖��O�B

fwf = exist(FWF,'dir');%���݂̃t�H���_���� FlatWindowFunction ��ۑ�����t�H���_�̑��݂̊m�F�B���݂���ꍇ�A7��Ԃ��܂��B
sr = exist(SR, 'dir');%���݂̃t�H���_���� �V�~�����[�V�������ʂ�ۑ�����t�H���_�̑��݂̊m�F�B���݂���ꍇ�A7��Ԃ��܂��B

if fwf ~= 7
    mkdir(FWF);%FlatWindowFunction ��ۑ�����t�H���_�̍쐬�B
end

if sr ~= 7
    mkdir(SR);%�V�~�����[�V�������ʂ�ۑ�����t�H���_�̍쐬�B
end

[ N, c, flatwin_c, d_c, l, k, B, prm_mat, filename_prm, R_S ] = define_param( );%�V�~�����[�V�����ɂ����Đ݌v����p�����[�^�̊֐��B
[ N_h, n, n_h, B, omega, k, d, dk, flatwin_eps, flatwin_eps_d, flatwin_f, flatwin_delta, flatwin_w, I, L ] = make_other_prm( N, c, flatwin_c, d_c, l, k, B);%�ݒ肵���p�����[�^����Z�o���邻�̑��̃p�����[�^�B


[ x ] = make_sample_data_1( n );%�T���v���f�[�^�̍쐬�B

[ check_flatwinresl ] = check_flatwin_exist( prm_mat, CD, FWF )%Falt Window Function �����݂��邩�m�F�B���݂���Ȃ�A2��Ԃ��܂��B

if check_flatwinresl == 2%���݂���ꍇ�A�ǂݍ��݁B
    
    filename_fw_l = ['flatwin', filename_prm, '.mat'];
    filename_fw_ft_l = ['flatwin_ft', filename_prm, '.mat'];
    
    cd(FWF);
    load(filename_fw_l);
    load(filename_fw_ft_l);
    cd(CD);
    
else%���݂��Ȃ��ꍇ�A�쐬�B

    [ std_win, std_win_ft ] = make_stdwinfunc(flatwin_delta, flatwin_w, flatwin_eps, flatwin_eps_d, n, omega);

    [ flatwin, flatwin_ft ] = make_flatwinfunc( flatwin_w, std_win_ft, n, flatwin_eps_d, flatwin_f);

    filename_fw = ['flatwin', filename_prm, '.mat'];
    filename_fw_ft = ['flatwin_ft', filename_prm, '.mat'];
    
    cd(FWF);
    save(filename_fw,'flatwin');
    save(filename_fw_ft,'flatwin_ft');
    cd(CD);
end

[ check_result_fw, check_para ] = check_flatwinfunc( flatwin_ft, flatwin_eps, flatwin_eps_d, flatwin_delta, I, n);%Flat Window Function �������𖞂������ǂ����̔���B

check_result_fw

if check_para == 1%�����𖞂����ꍇ�A�V�~�����[�V�������J�n����B
     [ X_hat_d, I_d, SIGMA, TAU ] = SFT(  L, n, flatwin, x, flatwin_w, B, dk, flatwin_ft, omega );%SFT �{�́B

    
    
absX_hat_d = abs(X_hat_d);
[ x_ft ] = normal_fft( x );
absx_ft = abs(x_ft);

n_absX_hat_d = absX_hat_d/max(absX_hat_d);%
n_absx_ft = absx_ft/max(absx_ft);%���K��

PLOT = [n_absx_ft', n_absX_hat_d];

figure;
plot(PLOT(:,1),'r-.');
hold on;
plot(PLOT(:,2));
legend('fft of original','sFFT')
xlabel(['L = ',num2str(L),', ', 'B = ', num2str(B),', ', 'dk = ', num2str(dk)]);
hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�@�p�����[�^����ь��ʂ��\���̂ɂ܂Ƃ߂ĕۑ�
foldername = [datestr(now, 'yyyymmdd_HHMMSS'),'_results'];
filename_str = 'result_str.mat';%�t�@�C�����ɃV�~�����[�V����������������B

field1 = 'n';  value1 = n;
field2 = 'B';  value2 = B;
field3 = 'c';  value3 = c;
field4 = 'flatwin_c';  value4 = flatwin_c;
field5 = 'd_c';  value5 = d_c;
field6 = 'l';  value6 = l;
field7 = 'k';  value7 = k;
field8 = 'L';  value8 = L;
field9 = 'dk';  value9 = dk;
field10 = 'SIGMA';  value10 = SIGMA;
field11 = 'TAU';  value11 = TAU;
field12 = 'x';  value12 = x;
field13 = 'PLOT';  value13 = PLOT;
field14 = 'R_S';  value14 = R_S;

s = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7,field8,value8,field9,value9,field10,value10,field11,value11,field12,value12,field13,value13,field14,value14);
cd(SR);
mkdir(foldername);
cd(foldername);
save(filename_str,'-struct','s');
save([field1,'.mat'],field1);
save([field2,'.mat'],field2);
save([field3,'.mat'],field3);
save([field4,'.mat'],field4);
save([field5,'.mat'],field5);
save([field6,'.mat'],field6);
save([field7,'.mat'],field7);
save([field8,'.mat'],field8);
save([field9,'.mat'],field9);
save([field10,'.mat'],field10);
save([field11,'.mat'],field11);
save([field12,'.mat'],field12);
save([field13,'.mat'],field13);
save([field14,'.mat'],field14);
save('prm.tex','prm_mat');
cd(CD);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
