% blind signal detection exercise
T=1000;
n=20;
randn('state',0);
rand('state',0);
a=randn(n,1);
s = 2*(rand(1,T)>0.5)-1;  % random binary signal
Y=a*s+2*randn(n,T); % received signal
