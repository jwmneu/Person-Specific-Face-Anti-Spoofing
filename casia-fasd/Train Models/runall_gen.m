%{
if matlabpool('size')<=0 %判断并行计算环境是否已然启动
    matlabpool('open','local',4); %若尚未启动，则启动并行环境
else
    disp('Already initialized'); %说明并行环境已经启动。
end
%}

Feat_Types = [1 3];
Methods = {'NULL' 'CS' 'OLS' 'PLS' 'PCA'};
Quality_Type = {'M'};


for t = 1:length(Feat_Types)
    for m = 1:length(Methods)
        train_GenericModel_specific_quality(Feats_train_SL, Labels_train_SL, Feats_test_SL, Labels_test_SL, Feat_Types(t), Quality_Type, Methods{m});
    end
end

%{
for m = 1:length(Methods)
    train_GenericModel_fusion_specific_quality(Feats_train_SL, Labels_train_SL, Feats_test_SL, Labels_test_SL, Feat_Types, Quality_Type, Methods{m});
end
%}

% train models with subject number
%{
for t = 1:length(Feat_Types)
    for m = 1:length(Methods)
        train_GenericModel_withSubNum_specific_quality(Feats_train_SL, Labels_train_SL, Feats_test_SL, Labels_test_SL, Feat_Types(t), Quality_Type, Methods{m});
    end
end
%}
%{
for m = 1:length(Methods)
    train_GenericModel_withSubNum_fusion_specific_quality(Feats_train_SL, Labels_train_SL, Feats_test_SL, Labels_test_SL, Feat_Types, Quality_Type, Methods{m});
end
%}

