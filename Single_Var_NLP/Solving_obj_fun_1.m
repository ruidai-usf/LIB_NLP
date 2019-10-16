clear;

%Using Golden section method to sovle problem 1. Set the initial interval
%as [-10000,10000], iteration number as 10000, tolerance as 0.0001
[Golden_sol, Golden_fun_val, Golden_info, Golden_flag]=Golden_section_method(@obj_fun_1, -10000,10000,10000,0.0001);

%Using Dichotomous search method to sovle problem 1. Set the initial interval
%as [-10000,10000], iteration number as 10000, epsilon as 0.00001, tolerance as 0.0001
[Dichotomous_sol, Dichotomous_fun_val, Dichotomous_info, Dichotomous_flag]=Dichotomous_search_method(...
    @obj_fun_1, -10000,10000,10000,0.00001,0.0001);

%Using Newton method to sovle problem 1. Set the initial solution
%as 100, iteration number as 10000, tolerance as 0.0001
[Newton_sol, Newton_fun_val, Newton_info, Newton_flag]=Newton_method(@obj_fun_1, 100,10000,0.0001);

%Using Bisection search method to sovle problem 1. Set the initial interval
%as [-10000,10000], iteration number as 10000, tolerance as 0.0001
[Bisection_sol, Bisection_fun_val, Bisection_info, Bisection_flag]=Bisection_search_method(@obj_fun_1, ...
    -10000,10000,10000,0.0001);