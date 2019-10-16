function [f_x, grad_f] = obj_fun_1(X)

%compute fun value
f_x = -12*X(2)+4*X(1)^2+4*X(2)^2+4*X(1)*X(2);

%compute gradient
grad_f = 8*X(1) + 4*X(2);

grad_f = [grad_f;-12 + 8*X(2) + 4*X(1)];

end

