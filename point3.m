function [ points ] = point3( index3, line_1, line_2, line_3 )
% This function is used to calculate the true points of intersections.

limit = 0.001;
[M, N] = size(index3);
points = zeros(3,1);
num = 1;


for i = 1:N
    point_1 = midpoint(line_1(:,index3(1,i)), line_2(:,index3(2,i))); 
    point_2 = midpoint(line_2(:,index3(2,i)), line_3(:,index3(3,i)));
    point_3 = midpoint(line_1(:,index3(1,i)), line_3(:,index3(3,i)));
    if dis_p3(point_1, point_2, point_3)<limit
        points(:, num) = (point_1+point_2+point_3)/3;
        num = num+1;
    end;
end;

num

end

