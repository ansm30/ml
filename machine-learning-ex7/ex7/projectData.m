function Z = projectData(X, U, K)
%PROJECTDATA Computes the reduced data representation when projecting only 
%on to the top k eigenvectors
%   Z = projectData(X, U, K) computes the projection of 
%   the normalized inputs X into the reduced dimensional space spanned by
%   the first K columns of U. It returns the projected examples in Z.
%

% You need to return the following variables correctly.
Z = zeros(size(X, 1), K);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the projection of the data using only the top K 
%               eigenvectors in U (first K columns). 
%               For the i-th example X(i,:), the projection on to the k-th 
%               eigenvector is given as follows:
%                    x = X(i, :)';
%                    projection_k = x' * U(:, k);
%


U_reduce = U(:, 1:K);
for i=1: size(X,1); # should not use lenght because it gives max from row and column and it would be problem when we have more number of features than example, but that would be impossible :)
   x = X(i, :);
   for new_k=1: K;
     Z(i, new_k) = x * U(:, new_k); # x = 2*1, U(:, new_k) = 1*2;
   end
end

% =============================================================

end
