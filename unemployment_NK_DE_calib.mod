% Toy model of unemployment
% gauthier@vermandel.fr

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var rr c n u w y k i lb mc pi r q x v_H v_P e mu g tau gy_obs gc_obs gi_obs pi_obs r_obs u_obs varrho;
var e_a e_g e_c e_m e_i e_r e_t;


varexo eta_a eta_g eta_c eta_m eta_i eta_r eta_t;
 
parameters beta delta alpha sigmaC sigmaL delta_N chi phi gy b  Gam eta gamma epsilon kappa rho phi_y phi_pi xi
			tau0 y0 sig theta1 theta2 varphi A piss  rho_a rho_g rho_c rho_m rho_i rho_r rho_t;
            
            
%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------
delta_N = .01;		% separation rate %
eta		= .62;		% negotiation share %
phi		= 0.3;		% shape hiring cost function %
beta 	= 0.9922; 	% Discount factor firms %
delta 	= 0.02;	    % Depreciation rate %
alpha 	= 0.217;	% Capital share %
gy 		= 0.2326;   % Public spending in GDP %
sigmaC 	= 1.13;		% Consumption risk aversion %
sigmaL 	= 4; 		% Elasticity of labor %
epsilon = 6;		% Elasticity between goods %
rho 	= .83;		% Monetary policy smoothing %
phi_y	= 0.3;		% Monetary policy reaction to output %
phi_pi	= 0.2;		% Monetary policy reaction to inflation %
xi 		= 30;		% Adjustment costs on prices
kappa	= 4;		% adjustment costs on investment
gamma	= .63;		% unemployment insurance as % of real wage
varphi	= 0.3;		% elasticity of emission to GDP %
piss	= 1.005;	% steady state inflation %

% value of main variables:
tau0 	= 44.6 /1000;	% value of carbon tax (euros/ton) %
sig		= 0.150; 		% Carbon intensity fr 0.4 Gt / Trillions euros %
y0	 	= 4.5;		% trillions euros PPA https://data.worldbank.org/indicator/NY.GDP.MKTP.CD %
theta1  = 0.05;		% level of abatement costs
theta2  = 2.6;		% curvature abatement cost
Hss		= 0.41;		% labor supply in ss %

% autoregressive roots parameters
rho_a	= 0.95;
rho_g	= 0.95;
rho_c	= 0.95;
rho_m  	= 0.95;
rho_i	= 0.95;
rho_r	= 0.40;
rho_t	= 0.8;

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model; 
	%% Household
	[name='marginal utility of consumption']
	lb = e_c*c^-sigmaC;
	[name='Euler']
	beta*lb(+1)/lb*rr = 1;
	[name='Labor Supply']
	v_H = w - b - chi/lb + beta*(1-delta_N)*v_H(+1);
	[name='Employment law of motion']
	n = (1-delta_N)*n(-1) + x*u;

	%% Production
	[name='technology']
	y = A*e_a*(k(-1)^alpha)*(n^(1-alpha));
	[name='Capital law of motion']
	i*e_i*(1-(kappa/2)*(i/i(-1)-1)^2) = k-(1-delta)*k(-1);
	[name='FOC k']
	((1-delta)*q(+1)+alpha*varrho(+1)*y(+1)/k) = q*rr;
	[name='FOC i']
 	e_i*q = 1 + e_i*q*(kappa/2)*( 1 + ( 3*i/i(-1)-4 )*i/i(-1) )
			+ beta*lb(+1)/lb*e_i(+1)*q(+1)*kappa*(1-i(+1)/i)*(i(+1)/i)^2;
	[name='FOC n']
	v_P = (1-alpha)*varrho*y/n - w + beta*lb(+1)/lb*(1-delta_N)*v_P(+1);
	[name='FOC x']
	Gam*x^phi = v_P;
	[name='NKPC']
	(1-epsilon) + epsilon*mc - xi*pi*(pi-steady_state(pi)) + xi*beta*lb(+1)/lb*y(+1)/y*pi(+1)*(pi(+1)-steady_state(pi));
	[name='wage']
	(1-e_m*eta)*v_H = e_m*eta*v_P;
	[name='FOC y']
	varrho = mc - theta1*mu^theta2 - tau*(1-varphi)*sig*(1-mu)*y^-varphi;
	[name='FOC mu']
	((tau*sig*y^(1-varphi))/(theta2*theta1))^(1/(theta2-1)) = mu;
	
	
	%% AGGREGATION
	[name='Resources Constraint']
	y = c + i + g  + xi/2*(pi-steady_state(pi))^2*y + Gam/(1+phi)*x^(1+phi)*u;
	[name='Unemployment rate']
	u = 1-n;	
	[name='Fisherian equation']
	rr = r/pi(+1);
	[name='Total emissions']
	e = sig*(1-mu)*y^(1-varphi);
	
	%%% Policy instruments
	[name='Monetary Policy rule']
	r = r(-1)^rho * (steady_state(r)*(pi/steady_state(pi))^phi_pi*(y/steady_state(y))^phi_y)^(1-rho) * e_r;
	[name='Public spending']
	g = gy*steady_state(y)*e_g;
	[name='Carbon tax']
	tau = tau0*e_t;
	
	
	%% Observable variables 
	[name='measurement GDP']
	gy_obs = log(y/y(-1));
	[name='measurement consumption']
	gc_obs = log(c/c(-1));
	[name='measurement investment']
	gi_obs = log(i/i(-1));
	[name='measurement inflation']
	pi_obs = pi - steady_state(pi);
	[name='measurement interest rate']
    r_obs = r - r(-1);
	[name='measurement unemployment']
    u_obs = u - u(-1);
	
	[name='shocks']
	log(e_a) = rho_a*log(e_a(-1))+eta_a;
	log(e_g) = rho_g*log(e_g(-1))+eta_g;
	log(e_c) = rho_c*log(e_c(-1))+eta_c;
	log(e_i) = rho_i*log(e_i(-1))+eta_i;
    log(e_m) = rho_m*log(e_m(-1))+eta_m;
    log(e_r) = rho_r*log(e_r(-1))+eta_r;  
    log(e_t) = rho_t*log(e_t(-1))+eta_t;  
end;

    
%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------
steady_state_model;
	pi		= piss;
	rr		= 1/beta;
	r		= rr*pi;
	tau 	= tau0;
	y		= y0;
	mu		= (tau*sig*y^(1-varphi)/(theta2*theta1))^(1/(theta2-1));
	mc		= (epsilon-1)/epsilon;
	varrho 	= mc - theta1*mu^theta2 - tau*(1-varphi)*sig*(1-mu)*y^(-varphi);
	q		= 1;
	u 		= .075;
	n 		= 1-u;
%	k		= n*(A*(rr-(1-delta))/(alpha*varrho))^(1/(alpha-1));
	k		=	alpha*varrho*y/(rr-(1-delta));

	A		= y/(k^alpha*n^(1-alpha));
	i		= delta*k;
	x 		= delta_N*n/u;	
	Gam 	= 0.01*y / (x^(1+phi)*u/(1+phi));
	v_P 	= Gam*x^phi;
	v_H 	= eta/(1-eta)*v_P;
	w 		= (1-alpha)*varrho*y/n - v_P  + beta*((1-delta_N-0*x)*v_P+0*phi/2*x^2);
	c  		= (1-gy)*y-i-Gam/(1+phi)*x^(1+phi)*u;
	lb 		= c^-sigmaC;
	chi 	= ((1-gamma)*w - v_H*(1-beta*(1-delta_N-0*x)))*lb;
	g 		= gy*y;
	b		= gamma*w;
	e 		= sig*(1-mu)*y^(1-varphi);
	e_a 	= 1;
	e_g 	= 1;
	e_c 	= 1;
	e_m 	= 1;
	e_i 	= 1;
	e_r 	= 1;
	e_t 	= 1;
	gy_obs = 0;
    gc_obs = 0;
    gi_obs = 0;
    pi_obs = 0;
    r_obs = 0;
    u_obs = 0; 
end;


%%% SIMULATIONS
shocks;
	var eta_a;	stderr 0.01;
	var eta_g;	stderr 0.01;
	var eta_c;	stderr 0.01;
	var eta_m;	stderr 0.01;
	var eta_i;	stderr 0.01;
	var eta_r;	stderr 0.01;
end;
	
% resid(1);
resid;
% check;

% VARIABLES OBSERVEES
varobs gy_obs gc_obs gi_obs pi_obs r_obs u_obs ;
% PARAMETRES A ESTIMER AVEC LES PRIORS ET VALEURS INITIALES ASSOCIEES
estimated_params;
    stderr eta_g,    ,       ,       ,       INV_GAMMA_PDF,  .01,      2;
    rho_g,   .92,     ,       ,       beta_pdf,       .5,      0.2;
    stderr eta_m,    ,       ,       ,       INV_GAMMA_PDF,  .01,      2;
    rho_m,   .92,     ,       ,       beta_pdf,       .5,      0.2;
    stderr eta_r,    ,       ,       ,       INV_GAMMA_PDF,  .01,      2;
    rho_r,   .5,      ,       ,       beta_pdf,       .5,      0.2;
    stderr eta_c,    ,       ,       ,       INV_GAMMA_PDF,  .01,      2;
    rho_c,   .96,     ,       ,       beta_pdf,       .5,      0.2;
    stderr eta_i,    ,       ,       ,       INV_GAMMA_PDF,  .01,      2;
    rho_i,   .9,      ,       ,       beta_pdf,       .5,      0.2;

    sigmaC,  2,       ,       ,       normal_pdf,     1.5,     0.35;
    delta_N, .08,     ,       ,       beta_pdf,       .1,     0.05;
    kappa,   6,       ,       ,       gamma_pdf,      4,       1.5;
    xi,      30,    0,      ,       gamma_pdf,      50,     15;
    rho,     .45,     ,       ,       beta_pdf,       .75,     0.1;
    phi_pi,  1.8,     ,       ,       gamma_pdf,      1.75,     0.5;
    phi_y,   0.05,    ,       ,       gamma_pdf,      0.12,    0.05;
end;



%%% estimation of the model
estimation(datafile=myobs_DE,    % your datafile, must be in your current folder
first_obs=1,                  % First data of the sample
mode_compute=4,               % optimization algo, keep it to 4
mh_replic=5000,               % number of sample in Metropolis-Hastings
mh_jscale=0.48,               % adjust this to have an acceptance rate between 0.2 and 0.3
prefilter=1,                  % remove the mean in the data
lik_init=2,                   % Don't touch this,
mh_nblocks=1,                 % number of mcmc chains
forecast=8                    % forecasts horizon
) gy_obs pi_obs r_obs gc_obs gi_obs u_obs;


% Load estimated parameters IN THE MODEL
fn = fieldnames(oo_.posterior_mean.parameters);
for ix = 1:size(fn,1)
	set_param_value(fn{ix},eval(['oo_.posterior_mean.parameters.' fn{ix} ]))
end
% Load estimated shocks IN THE MODEL
fx = fieldnames(oo_.posterior_mean.shocks_std);
for ix = 1:size(fx,1)
	idx = strmatch(fx{ix},M_.exo_names,'exact');
	M_.Sigma_e(idx,idx) = eval(['oo_.posterior_mean.shocks_std.' fx{ix}])^2;
end


% SIMULATE THE ESTIMATED MODEL
stoch_simul(irf=30,conditional_variance_decomposition=[1,4,10,100],order=1) y c i pi r u x w;


load(options_.datafile);
if exist('T') ==1
	Tvec = T;
else
	Tvec = 1:size(dataset_,1);
end
Tfreq = mean(diff(Tvec));


%%%%%%%%%%%%%%%%% COUNTERFACTUAL EXERCISES %%%%%%%%%%%%%%%%%%
%% stacks shocks in matrix
fx = fieldnames(oo_.SmoothedShocks);
for ix=1:size(fx,1)
	shock_mat = eval(['oo_.SmoothedShocks.' fx{ix}]);
	if ix==1; ee_mat = zeros(length(shock_mat),M_.exo_nbr); end;
	ee_mat(:,strmatch(fx{ix},M_.exo_names,'exact')) = shock_mat;
end

%%% Simulate baseline scenario
% solve decision rule
[oo_.dr, info, M_.params] = resol(0, M_, options_, oo_.dr, oo_.dr.ys, oo_.exo_steady_state, oo_.exo_det_steady_state);
% simulate the model
y_            = simult_(M_,options_,oo_.dr.ys,oo_.dr,ee_mat,options_.order);

%%% Simulate alternative scenario: reducing UI
% make a copy
Mx  = M_;
oox = oo_;
% change parameter
Mx.params(strcmp('gamma',M_.param_names)) = .1;
% solve new decision rule
steady;
[oox.dr, info, Mx.params] = resol(0, Mx, options_, oox.dr, oox.dr.ys, oox.exo_steady_state, oox.exo_det_steady_state);
y_lessUI            = simult_(Mx,options_,oox.dr.ys,oox.dr,ee_mat,options_.order);

%%% Simulate alternative scenario: increasing UI
% make a copy
Mx  = M_;
oox = oo_;
% change parameter
Mx.params(strcmp('gamma',M_.param_names)) = 1;
% solve new decision rule
steady;
[oox.dr, info, Mx.params] = resol(0, Mx, options_, oox.dr, oox.dr.ys, oox.exo_steady_state, oox.exo_det_steady_state);
y_moreUI            = simult_(Mx,options_,oox.dr.ys,oox.dr,ee_mat,options_.order);

% draw result
var_names={'y','c','i','pi','r','u','w'};
Ty = [T(1)-Tfreq;T];
draw_tables(var_names,M_,Ty,[],y_,y_lessUI,y_moreUI)
legend('Baseline','Reduce UI','Increase UI')

%%%%%%%%%%%%%%%%% FORECAST UNDER ALTERNATIVE POLICY %%%%%%%%%%%%%%%%%%
Thorizon 	= 12; % number of quarters for simulation
% Built baseline forecast
fx = fieldnames(oo_.SmoothedShocks);
for ix=1:size(fx,1)
	shock_mat = eval(['oo_.SmoothedShocks.' fx{ix}]);
	if ix==1; ee_mat2 = zeros(length(shock_mat),M_.exo_nbr); end;
	ee_mat2(:,strmatch(fx{ix},M_.exo_names,'exact')) = shock_mat;
end
% add mean-wise forecast with zero mean shocks
ee_mat2 	= [ee_mat;zeros(Thorizon,M_.exo_nbr)];
Tvec2 		= Tvec(1):Tfreq:(Tvec(1)+size(ee_mat2,1)*Tfreq);

%%% Simulate baseline scenario
% solve decision rule
[oo_.dr, info, M_.params] = resol(0, M_, options_, oo_.dr, oo_.dr.ys, oo_.exo_steady_state, oo_.exo_det_steady_state);
% simulate the model
y_baseline            = simult_(M_,options_,oo_.dr.ys,oo_.dr,ee_mat2,options_.order);

%%% Scenario 1: Lower Unemployment Insurance (gamma = 0.1)
% make a copy of model and shock matrix
Mx_lowerUI  = M_;
oox_lowerUI = oo_;

% Update the gamma parameter to 0.1
Mx_lowerUI.params(strcmp('gamma', M_.param_names)) = 0.1;

% solve decision rule for new scenario
[oox_lowerUI.dr, info, Mx_lowerUI.params] = resol(0, Mx_lowerUI, options_, oox_lowerUI.dr, oox_lowerUI.dr.ys, oox_lowerUI.exo_steady_state, oox_lowerUI.exo_det_steady_state);

% simulate the model with lower UI
y_lowerUI = simult_(Mx_lowerUI, options_, oox_lowerUI.dr.ys, oox_lowerUI.dr, ee_mat2, options_.order);

%%% Scenario 2: Higher Unemployment Insurance (gamma = 1.0)
% make a copy of model and shock matrix
Mx_higherUI  = M_;
oox_higherUI = oo_;

% Update the gamma parameter to 1.0
Mx_higherUI.params(strcmp('gamma', M_.param_names)) = 1.0;

% solve decision rule for new scenario
[oox_higherUI.dr, info, Mx_higherUI.params] = resol(0, Mx_higherUI, options_, oox_higherUI.dr, oox_higherUI.dr.ys, oox_higherUI.exo_steady_state, oox_higherUI.exo_det_steady_state);

% simulate the model with higher UI
y_higherUI = simult_(Mx_higherUI, options_, oox_higherUI.dr.ys, oox_higherUI.dr, ee_mat2, options_.order);

%%% Simulate alternative scenario: fiscal shock (for comparison)
% make a copy of shock matrix
ee_matx = ee_mat2;
% select fiscal shock
idx = strmatch('eta_g',M_.exo_names,'exact');
ee_matx(end-Thorizon+1,idx) = 0.05; % add a 5 percent increase in public spending
% simulate the model
y_fiscal = simult_(M_,options_,oo_.dr.ys,oo_.dr,ee_matx,options_.order);

%%% Simulate alternative scenario: carbon price shock (for comparison)
% make a copy of shock matrix
ee_matx = ee_mat2;
% select carbon shock
idx = strmatch('eta_t',M_.exo_names,'exact');
ee_matx(end-Thorizon+1,idx) = 0.5; % add a 50 percent increase in carbon price 
% simulate the model
y_carbon = simult_(M_,options_,oo_.dr.ys,oo_.dr,ee_matx,options_.order);

%%% Simulate alternative scenario: monetary policy shock (for comparison)
% make a copy of shock matrix
ee_matx = ee_mat2;
% select monetary policy shock
idx = strmatch('eta_r',M_.exo_names,'exact');
ee_matx(end-Thorizon+1,idx) = -0.05; % add a negative monetary policy shock 
% simulate the model
y_monetary = simult_(M_,options_,oo_.dr.ys,oo_.dr,ee_matx,options_.order);

% Now we will plot the results for all scenarios

% Define variables to observe and plot
var_names={'y','c','i','pi','r','u','w'};

% Time vector for plotting
Ty = [T(1)-Tfreq;T];

% Plot the results
draw_tables(var_names, M_, Tvec2, [2023 Tvec2(end)], y_baseline, y_lowerUI, y_higherUI, y_fiscal, y_carbon, y_monetary);
legend('Baseline', 'Lower UI (gamma=0.1)', 'Higher UI (gamma=1.0)', 'Fiscal Shock', 'Carbon Price Shock', 'Monetary Policy Shock');
