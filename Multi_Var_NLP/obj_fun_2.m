function [f_x, grad_f] = obj_fun_2(X)

%compute fun value
f_x = (X(1)^3-X(2))^2+2*(X(2)-X(1))^4;

%compute gradient
grad_f = 8*(X(1) - X(2))^3 - 6*X(1)^2*(- X(1)^3 + X(2));

grad_f = [grad_f;2*X(2) - 8*(X(1) - X(2))^3 - 2*X(1)^3];

end

