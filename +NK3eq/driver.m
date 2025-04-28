%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clearvars -global
clear_persistent_variables(fileparts(which('dynare')), false)
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'NK3eq';
M_.dynare_version = '6.3';
oo_.dynare_version = '6.3';
options_.dynare_version = '6.3';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(3,1);
M_.exo_names_tex = cell(3,1);
M_.exo_names_long = cell(3,1);
M_.exo_names(1) = {'eta_D'};
M_.exo_names_tex(1) = {'eta\_D'};
M_.exo_names_long(1) = {'eta_D'};
M_.exo_names(2) = {'eta_S'};
M_.exo_names_tex(2) = {'eta\_S'};
M_.exo_names_long(2) = {'eta_S'};
M_.exo_names(3) = {'eta_R'};
M_.exo_names_tex(3) = {'eta\_R'};
M_.exo_names_long(3) = {'eta_R'};
M_.endo_names = cell(6,1);
M_.endo_names_tex = cell(6,1);
M_.endo_names_long = cell(6,1);
M_.endo_names(1) = {'y'};
M_.endo_names_tex(1) = {'y'};
M_.endo_names_long(1) = {'y'};
M_.endo_names(2) = {'pi'};
M_.endo_names_tex(2) = {'pi'};
M_.endo_names_long(2) = {'pi'};
M_.endo_names(3) = {'r'};
M_.endo_names_tex(3) = {'r'};
M_.endo_names_long(3) = {'r'};
M_.endo_names(4) = {'e_D'};
M_.endo_names_tex(4) = {'e\_D'};
M_.endo_names_long(4) = {'e_D'};
M_.endo_names(5) = {'e_S'};
M_.endo_names_tex(5) = {'e\_S'};
M_.endo_names_long(5) = {'e_S'};
M_.endo_names(6) = {'e_R'};
M_.endo_names_tex(6) = {'e\_R'};
M_.endo_names_long(6) = {'e_R'};
M_.endo_partitions = struct();
M_.param_names = cell(10,1);
M_.param_names_tex = cell(10,1);
M_.param_names_long = cell(10,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'sigma'};
M_.param_names_tex(2) = {'sigma'};
M_.param_names_long(2) = {'sigma'};
M_.param_names(3) = {'varphi'};
M_.param_names_tex(3) = {'varphi'};
M_.param_names_long(3) = {'varphi'};
M_.param_names(4) = {'rho'};
M_.param_names_tex(4) = {'rho'};
M_.param_names_long(4) = {'rho'};
M_.param_names(5) = {'phi_pi'};
M_.param_names_tex(5) = {'phi\_pi'};
M_.param_names_long(5) = {'phi_pi'};
M_.param_names(6) = {'phi_y'};
M_.param_names_tex(6) = {'phi\_y'};
M_.param_names_long(6) = {'phi_y'};
M_.param_names(7) = {'theta'};
M_.param_names_tex(7) = {'theta'};
M_.param_names_long(7) = {'theta'};
M_.param_names(8) = {'rho_D'};
M_.param_names_tex(8) = {'rho\_D'};
M_.param_names_long(8) = {'rho_D'};
M_.param_names(9) = {'rho_S'};
M_.param_names_tex(9) = {'rho\_S'};
M_.param_names_long(9) = {'rho_S'};
M_.param_names(10) = {'rho_R'};
M_.param_names_tex(10) = {'rho\_R'};
M_.param_names_long(10) = {'rho_R'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 6;
M_.param_nbr = 10;
M_.orig_endo_nbr = 6;
M_.aux_vars = [];
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = true;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.nonzero_hessian_eqs = [];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.eq_nbr = 6;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 5 11;
 0 6 12;
 1 7 0;
 2 8 0;
 3 9 0;
 4 10 0;]';
M_.nstatic = 0;
M_.nfwrd   = 2;
M_.npred   = 4;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 4;
M_.ndynamic   = 6;
M_.dynamic_tmp_nbr = [0; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , 'IS curve' ;
  2 , 'name' , 'AS curve' ;
  3 , 'name' , 'Monetary Policy Rule' ;
  4 , 'name' , 'demand shock' ;
  5 , 'name' , 'supply shock' ;
  6 , 'name' , 'monetary policy shock' ;
};
M_.mapping.y.eqidx = [1 2 3 ];
M_.mapping.pi.eqidx = [1 2 3 ];
M_.mapping.r.eqidx = [1 3 ];
M_.mapping.e_D.eqidx = [1 4 ];
M_.mapping.e_S.eqidx = [2 5 ];
M_.mapping.e_R.eqidx = [3 6 ];
M_.mapping.eta_D.eqidx = [4 ];
M_.mapping.eta_S.eqidx = [5 ];
M_.mapping.eta_R.eqidx = [6 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 3;
M_.block_structure.block(1).mfs = 3;
M_.block_structure.block(1).equation = [ 4 5 6];
M_.block_structure.block(1).variable = [ 4 5 6];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 6;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [1 2 3 4 5 6 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 3;
M_.block_structure.block(2).mfs = 3;
M_.block_structure.block(2).equation = [ 3 1 2];
M_.block_structure.block(2).variable = [ 3 1 2];
M_.block_structure.block(2).is_linear = true;
M_.block_structure.block(2).NNZDerivatives = 11;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [1 4 5 6 8 9 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([1 1 2 1 2 3 1 3 2 2 3 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([1 4 4 5 5 5 6 6 8 9 9 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 2 2 2 4 7 9 9 10 12 ]);
M_.block_structure.variable_reordered = [ 4 5 6 3 1 2];
M_.block_structure.equation_reordered = [ 4 5 6 3 1 2];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 3 3;
 4 4;
 5 5;
 6 6;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 1;
 1 3;
 1 4;
 2 1;
 2 2;
 2 5;
 3 1;
 3 2;
 3 3;
 3 6;
 4 4;
 5 5;
 6 6;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 1 1;
 1 2;
 2 2;
];
M_.block_structure.dyn_tmp_nbr = 0;
M_.state_var = [4 5 6 3 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(6, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(10, 1);
M_.endo_trends = struct('deflator', cell(6, 1), 'log_deflator', cell(6, 1), 'growth_factor', cell(6, 1), 'log_growth_factor', cell(6, 1));
M_.NNZDerivatives = [23; 0; -1; ];
M_.dynamic_g1_sparse_rowval = int32([3 4 5 6 1 2 3 2 3 1 3 1 4 2 5 3 6 1 1 2 4 5 6 ]);
M_.dynamic_g1_sparse_colval = int32([3 4 5 6 7 7 7 8 8 9 9 10 10 11 11 12 12 13 14 14 19 20 21 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 1 2 3 4 5 8 10 12 14 16 18 19 21 21 21 21 21 22 23 24 ]);
M_.dynamic_g2_sparse_indices = int32([]);
M_.lhs = {
'y'; 
'pi'; 
'r'; 
'e_D'; 
'e_S'; 
'e_R'; 
};
M_.static_tmp_nbr = [0; 0; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 4];
M_.block_structure_stat.block(1).variable = [ 4];
M_.block_structure_stat.block(2).Simulation_Type = 3;
M_.block_structure_stat.block(2).endo_nbr = 1;
M_.block_structure_stat.block(2).mfs = 1;
M_.block_structure_stat.block(2).equation = [ 5];
M_.block_structure_stat.block(2).variable = [ 5];
M_.block_structure_stat.block(3).Simulation_Type = 3;
M_.block_structure_stat.block(3).endo_nbr = 1;
M_.block_structure_stat.block(3).mfs = 1;
M_.block_structure_stat.block(3).equation = [ 6];
M_.block_structure_stat.block(3).variable = [ 6];
M_.block_structure_stat.block(4).Simulation_Type = 6;
M_.block_structure_stat.block(4).endo_nbr = 3;
M_.block_structure_stat.block(4).mfs = 3;
M_.block_structure_stat.block(4).equation = [ 1 2 3];
M_.block_structure_stat.block(4).variable = [ 3 1 2];
M_.block_structure_stat.variable_reordered = [ 4 5 6 3 1 2];
M_.block_structure_stat.equation_reordered = [ 4 5 6 1 2 3];
M_.block_structure_stat.incidence.sparse_IM = [
 1 2;
 1 3;
 1 4;
 2 1;
 2 2;
 2 5;
 3 1;
 3 2;
 3 3;
 3 6;
 4 4;
 5 5;
 6 6;
];
M_.block_structure_stat.tmp_nbr = 0;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(4).g1_sparse_rowval = int32([1 3 2 3 1 2 3 ]);
M_.block_structure_stat.block(4).g1_sparse_colval = int32([1 1 2 2 3 3 3 ]);
M_.block_structure_stat.block(4).g1_sparse_colptr = int32([1 3 5 8 ]);
M_.static_g1_sparse_rowval = int32([2 3 1 2 3 1 3 1 4 2 5 3 6 ]);
M_.static_g1_sparse_colval = int32([1 1 2 2 2 3 3 4 4 5 5 6 6 ]);
M_.static_g1_sparse_colptr = int32([1 3 6 8 10 12 14 ]);
close all;
M_.params(1) = 0.9951;
beta = M_.params(1);
M_.params(2) = 1;
sigma = M_.params(2);
M_.params(3) = 1;
varphi = M_.params(3);
M_.params(7) = 0.75;
theta = M_.params(7);
M_.params(4) = 0.80;
rho = M_.params(4);
M_.params(5) = 1.5;
phi_pi = M_.params(5);
M_.params(6) = 0.2;
phi_y = M_.params(6);
M_.params(8) = 0.80;
rho_D = M_.params(8);
M_.params(9) = 0.95;
rho_S = M_.params(9);
M_.params(10) = 0.40;
rho_R = M_.params(10);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.02)^2;
M_.Sigma_e(2, 2) = (0.004)^2;
M_.Sigma_e(3, 3) = (0.001)^2;
options_.irf = 30;
options_.order = 1;
var_list_ = {'y';'pi';'r'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'NK3eq_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK3eq_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK3eq_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK3eq_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK3eq_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK3eq_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK3eq_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'NK3eq_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
