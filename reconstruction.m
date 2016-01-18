function points = reconstruction( line_set_1, line_set_2 )
% This function is used to calculate all the 3d positions of the all the
% intersections.

% This fucntion inputs two line set. First we need to decide which set has
% less amount of lines, and we name such set as set A. Then we tranverse
% all the lines in set A, and calculate the midpoints one by one. 

[M_1, N_1] = size(line_set_1);
[M_2, N_2] = size(line_set_2);

points = zeros(1, 3);

if N_1 < N_2
    fprintf('The number is %d.', N_1);
    for i = 1:N_1
        points(i, 1:3) = intersection(line_set_1(1:6, i), line_set_2);
    end;
else
    fprintf('The number is %d.', N_1);
    for i = 1:N_2
        points(i, 1:3) = intersection(line_set_2(1:6, i), line_set_1);        
    end;
end;


end

