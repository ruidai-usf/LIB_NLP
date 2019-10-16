clear;

Ini_Sol = [0;0];

%% DFP Method
%Using DFP Method to sovle problem 1. Set the initial solution as Ini_Sol, 
%iteration number as 10000, tolerance as 0.0001
[DFP_sol, DFP_fun_val, DFP_info, DFP_flag]=Davidon_Fletcher_Powell_Method(@obj_fun_1, Ini_Sol, 10000, 0.0001);
%Generate the direction set
DFP_direction = DFP_info(:,4:end);

%% BFGS Method
%Using BFGS Method to sovle problem 1. Set the initial solution as Ini_Sol, 
%iteration number as 10000, tolerance as 0.0001
[BFGS_sol, BFGS_fun_val, BFGS_info, BFGS_flag]=BFGS_Method(@obj_fun_1, Ini_Sol, 10000, 0.0001);
%Generate the direction set
BFGS_direction = BFGS_info(:,4:end);

%% Conjugate Gradient Method
%Using Conjugate Gradient Method to sovle problem 1. Set the initial solution as Ini_Sol, 
%iteration number as 10000, tolerance as 0.0001
[CG_sol, CG_fun_val, CG_info, CG_flag]=Conjugate_Gradient_Method(@obj_fun_1, Ini_Sol, 10000, 0.0001);
%Generate the direction set
CG_direction = CG_info(:,4:end);