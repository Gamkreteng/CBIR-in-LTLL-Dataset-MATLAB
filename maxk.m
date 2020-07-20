function [B, I]=maxk(A,k)
[Values, Indexes]=sort(A, 'descend');
B = Values(1:k);
I = Indexes(1:k);
end