ability_difficulty_data;
% svd
[U,Sigma,V] = svd(G, 'econ');
% extract the top dyad
u1 = U(:,1);
v1 = V(:,1);
s1 = Sigma(1,1);
% normalize d
a = m*s1*v1/sum(1./u1);
d = m./(sum(1./u1)*u1);
% compute optimal cost
Jopt = sqrt(1/(m*n))*norm(G-(1./d)*a','fro');
RMSgrades = sqrt(1/(m*n))*norm(G,'fro');
ratio=Jopt/RMSgrades;