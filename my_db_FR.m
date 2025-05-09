[output_table,~,T] = call_dbnomics('OECD/QNA/FRA.B1_GE.CQRSA.Q','OECD/QNA/FRA.P31DC.CQRSA.Q','OECD/QNA/FRA.P51.CQRSA.Q','OECD/QNA/FRA.B1_GE.DNBSA.Q','Eurostat/LFSQ_EWHAIS/Q.TOTAL.SAL.TOTAL.Y_GE15.T.HR.FR','OECD/KEI/IR3TIB01.FRA.ST.Q', 'Eurostat/LFSQ_URGACOB/Q.TOTAL.T.Y15-74.PC.FR');

% Output, Consumption, Investment, Deflator, Weekly Hours, Nominal Rate, Unemployment rate

% select non NaN ids
idx 			= find(~isnan(sum(output_table(:,2:end),2)));
output_table 	= output_table(idx,:);
T				= T(idx);

% Filter data from 2003 onwards (start of quarterly data)
start_year = 2003;
start_idx = find(T >= start_year, 1);
output_table = output_table(start_idx:end, :);
T = T(start_idx:end);

% we normalize to one prices and in population for 2015
id2015 = find(T==2015);
def = output_table(:,5)/output_table(id2015,5);


%% taking in real growth rates per capita
gy_obs  = diff(log(output_table(:,2)./(def)));
gc_obs  = diff(log(output_table(:,3)./(def)));
gi_obs  = diff(log(output_table(:,4)./(def)));

% inflation rate
pi_obs  = diff(log(def));
% quarterly interest rate
r_obs	= output_table(:,7)/400;

% unemployment rate
u_obs = output_table(:,8)/100;

% load dseries object
initialize_dseries_class();
% convert data into dseries object
ts = dseries(u_obs, '2003Q1');
% create the x13 object
o = x13(ts);
% adjust options
o.transform('function','log');
o.arima('model',' (0 1 1)4');
o.x11('save','(d10)');
% run
o.run();
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

u_obs = (o.y.data)./(season_y.data);

T = T(2:end);
u_obs = diff(u_obs);
r_obs = diff(r_obs);

timeSeriesList = {gy_obs, gc_obs, gi_obs, pi_obs, r_obs, u_obs};

% Boucle sur chaque série temporelle
for i = 1:length(timeSeriesList)
    data = timeSeriesList{i};

    % Perform Augmented Dickey-Fuller test
    [h, pValue, stat, cValue, reg] = adftest(data, 'model', 'AR', 'alpha', 0.05);

    % Afficher les résultats
    fprintf('Résultats du test ADF pour la série %d:\n', i);
    fprintf('h = %d\n', h);
    fprintf('pValue = %.4f\n', pValue);
    fprintf('stat = %.4f\n', stat);
    fprintf('criticalValue = %.4f\n', cValue);
    fprintf('-------------------------\n');
end

% save into myobs.mat
save myobs_FR gy_obs gc_obs gi_obs T pi_obs r_obs u_obs;

figure;
subplot(2,3,1)
plot(T,gy_obs)
xlim([min(T) max(T)]);
title('output growth')
subplot(2,3,2)
plot(T,gc_obs)
xlim([min(T) max(T)]);
title('consumption growth')
subplot(2,3,3)
plot(T,gi_obs)
xlim([min(T) max(T)]);
title('investment growth')
subplot(2,3,4)
plot(T,pi_obs)
xlim([min(T) max(T)]);
title('inflation rate')
subplot(2,3,5)
plot(T,r_obs)
xlim([min(T) max(T)]);
title('nominal rate')
subplot(2,3,6)
plot(T,u_obs);
xlim([min(T) max(T)]);
title('unemployment rate')
