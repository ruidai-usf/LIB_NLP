function [opt_solution, opt_fun_val, iter_info, exit_flag] = Cyclic_coordinate_search(obj_function, ...
    initial_sol, iter_num,tolerance)
% The input includes objective function, the initial solution, iteration number, tolerance for terminating the search.
% Users need to set all this parameters by themselves.
% The output is the optimal solution and optimal function value. And iter_info shows the update 
% of the lower bound and upper bound. The exit_flag denote the tolerance is reached if it is
% equal to 1, or the iteration number is reached if it is equal to 0.

exit_flag = 0;

dim_n = size(initial_sol,1);
ele_matrix = eye(dim_n);
current_sol = initial_sol;

iteration_info = [0,current_sol'];

for i = 1:iter_num
    if mod(i,2) ==1
        pre_pre_sol = current_sol;
    end
    
    previous_sol = current_sol;
    
    for j = 1:dim_n
        e_j = ele_matrix(:,j);
        f_lambada = @(temp_lambada)(obj_fun_2(current_sol+temp_lambada*e_j));
        lambada = Dichotomous_search_method(f_lambada,-10000,10000,10000,0.00001,0.0001);
        current_sol = current_sol+lambada*e_j;
    end
    
    iteration_info = [iteration_info;[i,current_sol']];
    
    if normest(current_sol-previous_sol)<tolerance||normest(current_sol-pre_pre_sol)<tolerance
        exit_flag=1;
        break
    end
end

iter_info = iteration_info;
opt_solution = current_sol;
opt_fun_val = feval(obj_function,opt_solution);