% load data
decathlon_pca_data

X = zscore(scores);
[U,S,V] = svd(X);
D = diag(S);

% part a
figure
plot(1:n, D);
title('\sigma_j vs j');
xlabel('j')
ylabel('\sigma_j');
saveas(gcf, 'sigma_vs_j.jpg');

p = cumsum(D.^2) / sum(D.^2);
figure
plot(1:n, p);
title('p_j vs j');
xlabel('j')
ylabel('p_j');
saveas(gcf, 'power_vs_j.jpg');

p2 = p(2);

% part b
v1 = V(:,1);
v2 = V(:,2);

figure
scatter(v1, v2);
text(v1, v2, events);
title('Top 2 components of event data')
xlabel('v_1')
ylabel('v_2')
saveas(gcf, 'principal_components.jpg')


% part c
t = sum(X,2);
r = t' * X;
spatial_plot(v1, v2, r, 3);
title('Spatial plot with r for intensity (color)')
xlabel('v_1')
ylabel('v_2')
saveas(gcf, 'intensity_plot.jpg')

% part d
u1 = U(:, 1);
u2 = U(:, 2);
delta = (X(:, 1) + X(:,5) + X(:,6)) - (X(:,3) + X(:,7) + X(:,9));

spatial_plot(u1 , u2 , t , length(names));
title('Spatial plot with t (athlete standardized scores) for intensity (color)')
xlabel('u_1')
ylabel('u_2')
saveas(gcf, 'spatial_t.jpg')

spatial_plot(u1 , u2 , delta , length(names));
title('Spatial plot with r for intensity (color)')
xlabel('u_1')
ylabel('u_2')
saveas(gcf, 'spatial_delta.jpg')