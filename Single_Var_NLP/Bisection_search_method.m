function [opt_solution, opt_fun_val, iter_info, exit_flag] = Bisection_search_method(obj_function, ...
    initial_lower, initial_upper, iter_num,tolerance)
% The input includes objective function, the lower and upper bound of the initial interval, 
% iteration number, tolerance for terminating the search. 
% Users need to set all this parameters by themselves.
% The output is the optimal solution and optimal function value. And iter_info shows the update 
% of the lower bound and upper bound. The exit_flag denote the tolerance is reached if it is
% equal to 1, or the iteration number is reached if it is equal to 0.

exit_flag = 0;
current_lower = initial_lower;
current_upper = initial_upper;
iteration_info = [0,current_lower,current_upper];

for i = 1:iter_num
    
    [f_mid, df_mid] = feval(obj_function,(current_lower+current_upper)/2);
    
    if df_mid==0
        exit_flag=1;
        break
    elseif df_mid>0
        current_upper = (current_lower+current_upper)/2;
    elseif df_mid<0
        current_lower = (current_lower+current_upper)/2;
    end
    
    iteration_info = [iteration_info;[i,current_lower,current_upper]];
    
    if current_upper-current_lower<tolerance
        exit_flag=1;
        break
    end
   
end

iter_info = iteration_info;
opt_solution = (current_lower+current_upper)/2;
opt_fun_val = f_mid;