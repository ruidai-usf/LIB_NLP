function [opt_solution, opt_fun_val, iter_info, exit_flag] = Davidon_Fletcher_Powell_Method(obj_function, ...
    initial_sol, iter_num,tolerance)
% The input includes objective function, the initial solution, iteration number, tolerance for terminating the search.
% Users need to set all this parameters by themselves.
% The output is the optimal solution and optimal function value. And iter_info shows the update 
% of the lower bound and upper bound. The exit_flag denote the tolerance is reached if it is
% equal to 1, or the iteration number is reached if it is equal to 0.

exit_flag = 0;

dim_n = size(initial_sol,1);
D_matrix = eye(dim_n);
current_sol = initial_sol;
iteration_info = [];

NaN_set = [];
for k = 1:dim_n
    NaN_set = [NaN_set,[NaN]];
end

for i = 1:iter_num
    
    previous_sol = current_sol;
    [temp_fun_val, temp_grad] = feval(obj_function,current_sol);
    
    direction = -D_matrix*temp_grad;
        
    iteration_info = [iteration_info;[i,current_sol',direction']];
    
    f_lambada = @(temp_lambada)(obj_function(current_sol+temp_lambada*direction));
    lambada = Dichotomous_search_method(f_lambada,-10000,10000,10000,0.00001,0.0001);
    current_sol = current_sol+lambada*direction;
    
    [temp_fun_val_new, temp_grad_new] = feval(obj_function,current_sol);
    
    p = lambada*direction;
    q = temp_grad_new - temp_grad;
    C_matrix = (p*p')/(p'*q)-(D_matrix*q*q'*D_matrix)/(q'*D_matrix*q);
    D_matrix = D_matrix + C_matrix;
    
    if normest(current_sol-previous_sol)<tolerance
        exit_flag=1;
        break
    end
end

iteration_info = [iteration_info;[i+1,current_sol',NaN_set]];

iter_info = iteration_info;
opt_solution = current_sol;
opt_fun_val = feval(obj_function,opt_solution);