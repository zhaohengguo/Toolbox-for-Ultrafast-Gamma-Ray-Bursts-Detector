function [ index3 ] = find3( dis_12, dis_23, dis_13, N_1, N_2, N_3 )
% This function is used to look for those sets of three lines, where the
% distance between any two lines in this set is smaller than the limit.
% The function return a 3*N matrix, where the three numbers in a certain
% line are the index of the corresponding lines in three sets of lines.

limit = 0.001;
index3 = zeros(3,1);
num = 1;

for i = 1:N_1
    for j = 1:N_2
        if dis_12(i, j)<limit
            for k = 1:N_3
                if dis_23(j, k)<limit && dis_13(i, k)<limit
                    index3(1, num) = i;
                    index3(2, num) = j;
                    index3(3, num) = k;
                    num = num+1;
                end;
            end;
        end;
    end;
end;
                    
end

