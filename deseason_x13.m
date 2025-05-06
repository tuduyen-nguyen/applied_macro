% load Airline data
% load Data_Airline;
load myobs.mat;


% obtain Dynare directory
% get_dynare_src = strrep(which('dynare'),'dynare.m','');


% load dseries object
% addpath([get_dynare_src 'modules\dseries\src\'],[get_dynare_src 'missing\rows_columns\'])
initialize_dseries_class();


% convert data into dseries object
% ts = dseries(Data,'1949M1');
ts = dseries(u_obs, '1994Q1');
% disp(ts)

% create the x13 object
o = x13(ts);
disp(o)
% adjust options
o.transform('function','log');
o.arima('model',' (0 1 1)4');
o.x11('save','(d10)');
% run
o.run();
disp(fieldnames(o.results));


% extract the multiplicative seasonal pattern
season_y = o.results.d10;


% delete useless files
hk = char('d10','err','log','out','spc');
for i0 = 1:size(hk,1)
    eval(['delete ' o.results.name '.' hk(i0,:) ';']);
end


% display results
figure;
plot(T,o.y.data,T,(o.y.data)./(season_y.data))
xlim([min(T),max(T)])
datetick('x','mm-yyyy','keeplimits')
grid on;
