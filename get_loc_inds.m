function inds = get_loc_inds(imaging_spk,loc)
inds = [];
for trial = 1:length(imaging_spk)
    if isempty(imaging_spk(trial).binned)==0
        if imaging_spk(trial).sound_location==loc
            inds = cat(1,inds,trial);
        end
    end
end
            
        