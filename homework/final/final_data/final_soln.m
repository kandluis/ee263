un_voting_patterns

% ======== Part (a) ======== 
S = svd(votes);
stem(diag(S));
title('Stem plot of singular values of votes')
ylabel('Singular value')
saveas(gcf, 'stem_plot.jpg');

% compute variance.
f2 = (S(1) + S(2)) / sum(S);

% ======== Part (b) ======== 
prevA = votes;
A = zeros(size(votes));
while  norm(prevA - A) > 0.0001
    prevA = A;
    [U, S, V] = svd(A);
    lowRankApprox = S(1,1) .* U(:,1) * V(:,1)' + S(2,2) .*  U(:,2) * V(:,2)';
    A = lowRankApprox;
    A(votes == 1) = 1;
    A(A > 0)= 1;
    A(votes == -1) = -1;
    A(A < 0) = -1;
end;
% Count the number of 1s and -1s.
numOnes = sum(A(:) == 1);
numNegOnes = sum(A(:) == -1);

% ======== Part (c) ======== 
% Get singular values
[U, S, V] = svd(A);
% 0 represents 'Cap'
class = zeros(size(countries(:,2)));
u1 = U(:, 1);
u2 = U(:, 2);
for i = 1:size(class)
    if strcmp(countries(i, 2), 'Soc')
        class(i) = 1;
    elseif strcmp(countries(i,2),'Com')
        class(i) = 2;
    elseif strcmp(countries(i,2), 'Cap')
        class(i) = 0;
    else
        disp('Error!')
    end
end
spatial_plot(u1, u2, class, 3, eye(3));
title('Scatter plot of primary diads colored by country classification')
xlabel('u_1')
ylabel('u_2')
saveas(gcf, 'country_scatter_classification.jpg');

% sum columns and take sign to know which was majority vote.
majorityVote = sign(sum(A, 1));
fractionMaj = zeros(size(countries(:,2)));
for i = 1:size(fractionMaj)
    fractionMaj(i) = sum(A(i, :) == majorityVote) / 633;
end

spatial_plot(u1 , u2 , fractionMaj , 10);
title('Scatter plot colored by fraction of votes aligned with majority.')
xlabel('u_1')
ylabel('u_2')
saveas(gcf, 'country_majority_scatter_plot.jpg')

% ======== Part (d) ======== 
v1 = V(:, 1);
v2 = V(:, 2);
totalSupport = sum(A, 1);
spatial_plot(v1, v2, totalSupport, size(unique(totalSupport), 2));
title('Scatter plot colored by support received by vote j.')
xlabel('v_1')
ylabel('v_2')
saveas(gcf, 'votes_by_total_support.jpg')

capVotes = sum(A(class == 0, :), 1) ./ sum(class == 0);
comVotes = sum(A(class == 2, :), 1) ./ sum(class == 2);
partisanSupport = capVotes - comVotes;
spatial_plot(v1, v2, partisanSupport, size(unique(partisanSupport), 2));
title('Scatter plot colored by partisan support received by the vote.')
xlabel('v_1')
ylabel('v_2')
saveas(gcf, 'votes_by_partisan_support.jpg')






    