% Load the data
bs_det_data;

% Find the eigenvalues of Y*Y.T
[U,S,V] = svd(Y);

% Take the eigenvector with largest eigenvalue.
eigenValue = S(1,1)^2;
u = U(:,1);

% Normalize it to be the right size.
w = u / norm(u) * T / eigenValue; 

% Verify w satisfies optimality conditions with some tolerance.
eps = 0.00001;
assert(all((w  - 1/eigenValue * Y * Y' * w) < eps));
assert(all((w' * Y * Y' * w - T) < eps));

% Plot histogram
figure
hist(w'*Y, 50);
title('Histogram of w^TY (estimated signal) values');
xlabel('Estimated signal value')
ylabel('Count');
saveas(gcf, 'blind_signal.jpg');

% Compute the estimated \hat{s} (or it's negation).
shat = sign(w'*Y);
errorRate = sum(shat ~= s) / T;