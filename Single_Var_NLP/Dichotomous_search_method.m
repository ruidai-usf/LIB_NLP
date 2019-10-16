function [opt_solution, opt_fun_val, iter_info, exit_flag] = Dichotomous_search_method(obj_function, ...
    initial_lower, initial_upper, iter_num,epsilon,tolerance)
% The input includes objective function, the lower and upper bound of the initial interval, 
% iteration number, epsilon, tolerance for terminating the search. 
% Users need to set all this parameters by themselves.
% The output is the optimal solution and optimal function value. And iter_info shows the update 
% of the lower bound and upper bound. The exit_flag denote the tolerance is reached if it is
% equal to 1, or the iteration number is reached if it is equal to 0.

exit_flag = 0;
current_lower = initial_lower;
current_upper = initial_upper;
iteration_info = [0,current_lower,current_upper];

for i = 1:iter_num
    
    lambada = (current_lower+current_upper)/2-epsilon;
    miu = (current_lower+current_upper)/2+epsilon;
    
    f_lambada = feval(obj_function,lambada);
    f_miu = feval(obj_function,miu);
    
    if f_lambada<f_miu
        current_upper = miu;
    else
        current_lower = lambada;
    end
    
    iteration_info = [iteration_info;[i,current_lower,current_upper]];
    
    if current_upper-current_lower<tolerance
        exit_flag=1;
        break
    end
   
end

iter_info = iteration_info;
opt_solution = (current_lower+current_upper)/2;
opt_fun_val = feval(obj_function,opt_solution);