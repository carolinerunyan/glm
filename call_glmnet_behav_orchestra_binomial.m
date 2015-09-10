function call_glmnet_behav_orchestra_binomial(base)

load([base 'behav_response.mat'])
load([base 'big_matrix.mat'])
load([base 'big_matrix_ids.mat'])
load([base 'fold_ids.mat'])

threshold = 0.015;
response = behav_response>threshold;

lsfid = str2num(getenv('LSB_JOBINDEX'));
cel = lsfid;
features = 1:size(big_matrix,1);

response_sample = response(cel,:);

opts.alpha = 0.95;

options = glmnetSet(opts);

fol_id = ones(size(response_sample));

CVerr = cvglmnet(big_matrix(features,:)',response_sample','binomial',options,'deviance',length(unique(fold_ids)),fold_ids,0,[])
single_glmnet.cel = cel;
single_glmnet.Beta = cvglmnetCoef(CVerr,'lambda_min');
single_glmnet.Info = CVerr;
single_glmnet.features = big_matrix_ids(features);
save([base 'single_glmnet_behav_binomial_' num2str(cel)], 'single_glmnet')
