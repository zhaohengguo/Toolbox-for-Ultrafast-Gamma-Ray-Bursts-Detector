function point = intersection( line_1, line_set )
% This function is used to calculate the intersection.

% This function is devised in the following way: First, we find the desired
% line, the distance between which and line_1 is the shortest, in line_set.
% We name this line line_2. Then we calculate the midpoint between line_1
% and line_2.

[A, B] = size(line_set); % Here B demonstrate the number of lines in line set.

min = distance(line_1, line_set(1:6, 1));
index = 1;
limit = 0.0001;

for i = 1:B
    if min > distance (line_1, line_set(1:6, i))
        min = distance (line_1, line_set(1:6, i));
        index = i;
    end;
end;

point = midpoint(line_1, line_set(1:6, index));

if point(3)>0
    fprintf('The z is %d.\n', point(3));
end;

end

