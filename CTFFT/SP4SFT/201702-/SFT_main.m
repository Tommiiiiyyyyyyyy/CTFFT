clear

[ N, N_h, n, n_h, B, omega, shift, k, d, dk, flatwin_eps, flatwin_eps_d, flatwin_f, flatwin_delta, flatwin_w, I, L ] = define_param();


[ x ] = make_sample_data_1( n );
[ F_M ] = F_M( n, omega );
[ IF_M ] = IF_M( n, omega );

[ std_win, std_win_ft ] = make_stdwinfunc( flatwin_delta, flatwin_w, flatwin_eps, flatwin_eps_d, n, shift, F_M);

[ flatwin, flatwin_ft ] = make_flatwinfunc(  std_win, std_win_ft, n, IF_M, flatwin_eps_d, flatwin_f);

[ check_result_fw, check_para ] = check_flatwinfunc( flatwin_ft, flatwin_eps, flatwin_eps_d, flatwin_delta, I, n)

if check_para == 1
    TAU = zeros(L, 1);
    SIGMA = zeros(L, 1);
    SIGTAU = zeros(n, L);
    
    
    [ I, I_HASH, I_OFFSET, TAU, SIGMA, Z_I ] = Outer_Loop1( L, n, flatwin, x, flatwin_w, B, dk, TAU, SIGMA );
    
    [ I_d ] = Outer_Loop2_3( I, L, n );
    
    [ x_hat ] = Outer_Loop4( flatwin_ft, L,Z_I, I_HASH, I_OFFSET, TAU, omega, n, B );
    
    [ X_hat_d ] = Outer_Loop5( n, I_d, x_hat );
    
    
absX_hat_d = abs(X_hat_d);
[ x_ft ] = normal_fft( x );
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
plot(PLOT(:,1),'r-.');
hold on;plot(PLOT(:,2));
legend('original','sFFT')
xlabel(['L = ',num2str(L)])

    
end
