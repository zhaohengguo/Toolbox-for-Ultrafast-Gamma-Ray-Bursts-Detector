function [ points ] = points_at_zero( lines )
% This function is used to calculate the the intersections between the
% lines and the plane z=0.

% x_0 = lines(1,i)
% y_0 = lines(2,i)
% z_0 = lines(3,i)
% k_x = lines(4,i)
% k_y = lines(5,i)
% k_z = lines(6,i)


[A,B] = size(lines);
points = zeros(2,B);

for i = 1:B
    points(1,i) = lines(1,i)-lines(4,i)/lines(6,i)*lines(3,i);
    points(2,i) = lines(2,i)-lines(5,i)/lines(6,i)*lines(3,i);
end;

end

