train_imaging_spk = [];
test_imaging_spk = [];
for locs = 1:8
    loc_inds{locs} = get_loc_inds(imaging_spk,locs);
    trials = loc_inds{locs};
    trials = shuffle(trials);
    num_trials = length(loc_inds{locs});
    num_train_trials = ceil(num_trials*.7);
    num_test_trials = num_trials - num_train_trials;
    train_trials = trials(1:num_train_trials);
    test_trials = trials(num_train_trials+1:end);
    train_imaging_spk = cat(2,train_imaging_spk,imaging_spk(train_trials));
    test_imaging_spk = cat(2,test_imaging_spk,imaging_spk(test_trials));
    if isempty(intersect(train_trials,test_trials))==0
        keyboard
    end
end

save train_imaging_spk train_imaging_spk '-v7.3'
save test_imaging_spk test_imaging_spk '-v7.3'