function [ dis_12, dis_23, dis_13 ] = dis_l3( line_1, line_2, line_3, N_1, N_2, N_3 )
% This function is used to calculate the 3D distance of any two lines from
% two different cameras. This function reture three matrices.

dis_12 = zeros(N_1, N_2);
dis_23 = zeros(N_2, N_3);
dis_13 = zeros(N_1, N_3);

for i = 1:N_1
    for j = 1:N_2
        dis_12(i, j) = dis_l(line_1(:,i), line_2(:,j));
    end;
end;

for i = 1:N_2
    for j = 1:N_3
        dis_23(i, j) = dis_l(line_2(:,i), line_3(:,j));
    end;
end;

for i = 1:N_1
    for j = 1:N_3
        dis_13(i, j) = dis_l(line_1(:,i), line_3(:,j));
    end;
end;


end

