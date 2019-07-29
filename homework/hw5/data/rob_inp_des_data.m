randn('state',0)
m = 2;n = 5;K = 50;
y_des = [1;1];

% generate the A matrix
A0 = diag([100 1])*randn(m,n); % our base matrix
Delta = randn(m,n,K); % matrix perturbations
A = Delta;
for i=1:K
    A(:,:,i) = A0+Delta(:,:,i);
end
clear A0 Delta i  % remove unneeded variables

% plotting template
% you need to define m x K matrices Y_ln and Y_mmse:
% Y_ln = [ y_ln^(1) ... y_ln^(K) ]
% Y_mmse = [ y_mmse^(1) ... y_mmse^(K) ]
% figure
% subplot(211)
% hold on; scatter(y_des(1),y_des(2),'k+'); 
% scatter(Y_ln(1,:),Y_ln(2,:));hold off
% title('Least norm method')
% axis([-1 3 -1 3]);grid
% 
% subplot(212)
% hold on; scatter(y_des(1),y_des(2),'k+');
% scatter(Y_mmse(1,:),Y_mmse(2,:));hold off;
% title('Minimum mean square error method')
% axis([-1 3 -1 3]);grid

