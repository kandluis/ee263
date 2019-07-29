sector_neutral_portfolio_data

% construct the relevant matrices from the data
M=[2*lambda*diag(sigmas.^2) F' ones(n,1);
    F zeros(k,k) zeros(k,1);
    ones(1,n) zeros(1,k) 0];
v=[mu;zeros(k,1);1];
% this solves the set of linear equations M*all_vars = v
all_vars = M\v;
% extract the portfolio weights
x=all_vars(1:n);
% plug in to find the optimal objective value
objective = -(-mu'*x + lambda*x'*diag(sigmas.^2)*x);
r = mu'*x;
R_id = x'*diag(sigmas.^2)*x;