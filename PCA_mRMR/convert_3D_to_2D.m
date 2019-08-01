
load indian_pines_gt

gt = indian_pines_gt;

[r, c] = size(gt);
nineClassArray = zeros(r*c,1);

i1 = 1;

for i = 1:r
    for j = 1:c
        if gt(i,j) == 2 || gt(i,j) == 3 || gt(i,j) == 5 || gt(i,j) == 6 || gt(i,j) == 8 || gt(i,j) == 10 || gt(i,j) == 11 || gt(i,j) == 12 || gt(i,j) == 14
            nineClassArray(i1,1) = gt(i,j);
        end
        i1 = i1+1;
    end
end

save nineClass nineClassArray