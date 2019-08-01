clear all;
clc;

load pcaData

y = variance;

[r c] = size(y);
cum_var = zeros(r*c,1);
i1 = 1;

sum_var = sum(y);

cum_var_per = zeros(r*c,1);

for i = 2:r
    cum_var(i-1,1) = cum_var(i1,1) + y(i-1,1);
    cum_var_per(i-1,1) = (cum_var(i-1,1) * 100)/sum_var;
    i1 = i-1;
end

save cum_var_per cum_var_per






