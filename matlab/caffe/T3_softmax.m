function mu = T3_softmax(eta)
    % Softmax function for 2 dim
    % mu(i,c) = exp(eta(i,c))/sum_c' exp(eta(i,c'))
    eeta = exp(eta);
    deta = repmat(sum(eeta,1),[size(eta,1),1]);
    mu = eeta./deta;
end
