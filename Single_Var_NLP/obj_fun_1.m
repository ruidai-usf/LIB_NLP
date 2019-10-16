function [f_x, df_x, d2f_x] = obj_fun_1(x)

%compute fun value
f_x = exp(-x)+x^2;

%compute the first order derivative
df_x = -exp(-x)+2*x;

%compute the second order derivative
d2f_x = exp(-x)+2;

end

