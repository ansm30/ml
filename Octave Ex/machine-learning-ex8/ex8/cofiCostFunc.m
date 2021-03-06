function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly

J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

%X
%Theta
%Y
%R
%num_users
%num_movies
%num_features
%X_grad
%Theta_grad

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

#for i=1:

#J = (1/2) * sum( (Theta_grad' * X) - Y).^2;
cost_temp = (X * Theta' - Y).^2;
J = (1 / 2) * sum(sum(cost_temp(R == 1))) + lambda/2 .* sum(sum(Theta.^2)) + lambda/2 .* sum(sum(X.^2));

#for m = 1:num_movies;
  #for f = 1:num_features;
    #temp = 0;
    #if R(m, f) == 1
      #temp = ((X(m, f) * Theta(m,f) - Y(m,f))) * Theta(m,f);
    #end
    #X_grad(m,f) = temp;
  #end
#end

#for u = 1:num_users;
  #for f = 1:num_features;
      #temp = 0;
      #if R(m, f) == 1
        #temp = ((X(m, f) * Theta(m,f) - Y(m,f))) * X(m,f);
      #end
      #Theta_grad(m,f) = temp;  
  #end
#end 

X_grad = ((X * Theta' - Y) .* R) * Theta+ lambda.*X; # multiply by R because we only need to see records those have 1
Theta_grad = ((X * Theta' - Y) .* R)' * X+ lambda.*Theta;
  












% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
