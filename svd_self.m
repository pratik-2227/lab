X = ones(657,1800);
X(1:323,1:900) = 0;

figure(1)
subplot(2,2,1)
imagesc(X)
title('two independent vectors');

[U,S,V] = svd(X);

% Informaiton contained in major singular values
figure(2)
subplot(1,2,2)
semilogy(diag(S),'.')
title('two independent vectors');


% truncated svd
r = [1 2 3];
for ii=1:length(r)
    Xapprox = U(:,1:r(ii))*S(1:r(ii),1:r(ii))*V(:,1:r(ii))';
    figure(1); subplot(2,2,ii+1);
    imagesc(Xapprox);
end