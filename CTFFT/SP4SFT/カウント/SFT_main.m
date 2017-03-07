clear

COUNT_SFT = 0;
COUNT_NORMAL = 0;

[ N, c, flatwin_c, d_c, l, k, B ] = define_param( );
[ N_h, n, n_h, B, omega, k, d, dk, flatwin_eps, flatwin_eps_d, flatwin_f, flatwin_delta, flatwin_w, I, L ] = make_other_prm( N, c, flatwin_c, d_c, l, k, B);


[ x ] = make_sample_data_1( n );


[ std_win, std_win_ft ] = make_stdwinfunc(flatwin_delta, flatwin_w, flatwin_eps, flatwin_eps_d, n, omega);

[ flatwin, flatwin_ft ] = make_flatwinfunc( flatwin_w, std_win_ft, n, flatwin_eps_d, flatwin_f);

[ check_result_fw, check_para ] = check_flatwinfunc( flatwin_ft, flatwin_eps, flatwin_eps_d, flatwin_delta, I, n)

if check_para == 1
     [ X_hat_d, I_d, COUNT_SFT ] = SFT(  L, n, flatwin, x, flatwin_w, B, dk, flatwin_ft, omega, COUNT_SFT );

    
    
absX_hat_d = abs(X_hat_d);
[ x_ft ] = normal_fft( x );
COUNT_NORMAL = n*log2(n);

absx_ft = abs(x_ft);

n_absX_hat_d = absX_hat_d/max(absX_hat_d);
n_absx_ft = absx_ft/max(absx_ft);

PLOT = [n_absx_ft', n_absX_hat_d];
%PLOT = [n_absx_ft, n_absX_hat_d];

x_ft2 = absx_ft/n;
x_ft1 = x_ft2(1:n/2+1);
x_ft1(2:end-1) = 2*x_ft1(2:end-1);

X_hat_d2 = absX_hat_d/n;
X_hat_d1 = X_hat_d2(1:n/2+1);
X_hat_d1(2:end-1) = 2*X_hat_d1(2:end-1);

PLOT2 = [x_ft1'/max(x_ft1), X_hat_d1/max(X_hat_d1)];
%PLOT2 = [x_ft1/max(x_ft1), X_hat_d1/max(X_hat_d1)];

f = n*(0:(n/2))/n;
% plot(PLOT)
figure
plot(PLOT(:,1),'r-.');
hold on;plot(PLOT(:,2));
legend('original','sFFT')
xlabel(['L = ',num2str(L)])

COUNT = [COUNT_SFT, COUNT_NORMAL];
figure
bar(COUNT);    

end
