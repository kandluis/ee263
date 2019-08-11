% Load the data
bs_det_data;

% Find the eigenvalues of Y*Y.T
[U,S,V] = svd(Y);
eigenValue = S(1,1)^2;
u = U(:,1);
w = u / norm(u) * T / eigenValue; 

% Verify w satisfies optimality conditions with some tolerance.
eps = 0.00001;
assert(all((w  - 1/eigenValue * Y * Y' * w) < eps));
assert(all((w' * Y * Y' * w - T) < eps));

% Plot histogram
hist(w'*Y, 50);