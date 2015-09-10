split_imaging_train_test
base = cd;
cd(base)
big_matrix = [];
the_matrix = [];
behav_response = [];
fold_ids = [];
for folds = 1:3;
    temp_imaging_spk = [];
    temp_imaging_spk = train_imaging_spk(trial_ids{folds});
    [big_matrix_temp,big_matrix_ids,the_matrix_temp,the_matrix_ids,response_temp] = make_big_matrix_final(temp_imaging_spk,'behav');
    fold_ids = cat(2,fold_ids,ones(1,size(response_temp,2)).*folds);
    big_matrix = cat(2,big_matrix,big_matrix_temp);
    the_matrix = cat(2,the_matrix,the_matrix_temp);
    behav_response = cat(2,behav_response,response_temp);
   
end

save behav_response behav_response
save big_matrix big_matrix
save big_matrix_ids big_matrix_ids

cd([base '\test\'])
[big_matrix,big_matrix_ids,the_matrix,the_matrix_ids,behav_response,trial_start,thisloc,thisfreq] = make_big_matrix_final(test_imaging_spk,'behav');

save behav_response behav_response
save big_matrix big_matrix
save big_matrix_ids big_matrix_ids