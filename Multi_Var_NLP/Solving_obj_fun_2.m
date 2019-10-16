clear;

Ini_Sol = [5;1];

%Using Cyclic coordinate search to sovle problem 2. Set the initial solution
%as Ini_Sol, iteration number as 10000, tolerance as 0.000001
[Cyclic_sol, Cyclic_fun_val, Cyclic_info, Cyclic_flag]=Cyclic_coordinate_search(@obj_fun_2, Ini_Sol, 10000, 0.000001);

%Using Steepest descent method to sovle problem 2. Set the initial solution
%as Ini_Sol, iteration number as 10000, tolerance as 0.000001
[Steepest_sol, Steepest_fun_val, Steepest_info, Steepest_flag]=Steepest_descent_method(@obj_fun_2, ...
    Ini_Sol, 10000, 0.000001);