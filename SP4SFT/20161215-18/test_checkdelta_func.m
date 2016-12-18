clear

esp = 0.11;
esp_d = 0.06;
delta = 2*10^-9;
W = 133;
n = 256;

G = zeros(n,1);

espn = floor(n*esp);
espdn = ceil(n*esp_d);

G(1:espdn) = 1;
G(n - espdn) = 1;


[check] = check_delta(G,eps, eps_d, delta, n, W)