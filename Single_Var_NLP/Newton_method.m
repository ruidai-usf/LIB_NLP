function [opt_solution, opt_fun_val, iter_info, exit_flag] = Newton_method(obj_function, ...
    initial_sol, iter_num,tolerance)
% The input includes objective function, the initial solution, iteration number, tolerance for terminating the search. 
% Users need to set all this parameters by themselves.
% The output is the optimal solution and optimal function value. And iter_info shows the update 
% of current solutions. The exit_flag denote the tolerance is reached if it is equal to 1, or
% the iteration number is reached if it is equal to 0.

exit_flag = 0;
current_sol = initial_sol;
iteration_info = [0,current_sol];

for i = 1:iter_num
    
    previous_sol = current_sol;
    
    [f_pre, df_pre, d2f_pre] = feval(obj_function,previous_sol);
    
    current_sol = previous_sol - df_pre/d2f_pre;
    
    iteration_info = [iteration_info;[i,current_sol]];
    
    if abs(current_sol-previous_sol)<tolerance
        exit_flag=1;
        break
    end
   
end

iter_info = iteration_info;
opt_solution = current_sol;
opt_fun_val = f_pre;