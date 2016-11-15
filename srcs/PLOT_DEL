clear

[x_o, n, N, w] = CTFFT_prm();

T = 1/N;                % Sampling period
L = N;                  % Length of signal
t = (0:L-1)*T;          % Time vector

figure;
plot(N*t(1:N),x_o)
xlabel('Time'); ylabel('x_o');

function [x_std_d, x_d, x_ft_d, x_ft, x_ft_ded, x_std_ded] = DELET_BuiltinFFT(x_o, N, k, l);

P2= abs(x_ft/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = N*(0:(L/2))/L;

figure;
plot(f,P1)
xlabel('f (Hz)')
ylabel('x_ft')


P4= abs(x_ft_d/L);
P3 = P4(1:L/2+1);
P3(2:end-1) = 2*P3(2:end-1);

figure;
plot(f,P3)
xlabel('f (Hz)')
ylabel('x_ft_d')

figure;
plot(N*t(1:N),x_o,N*t(1:N),x_std_d)
xlabel('Time'); ylabel('x_o & x_d');

subplot(3,1,1), plot(N*t(1:N), x_o);
xlabel('Time'); ylabel('x_o');


subplot(3,1,2), plot(N*t(1:N),x_std_d);
xlabel('Time'); ylabel('x_d');

subplot(3,1,3), plot(N*t(1:N),x_std_ded);
xlabel('Time'); ylabel('x_ded');
