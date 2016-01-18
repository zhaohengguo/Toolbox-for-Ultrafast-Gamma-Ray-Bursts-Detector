function [ dis ] = dis_p3( p_1, p_2, p_3 )
% This function is used to calculate the largest distance between any two
% points in three points. If the distance is larger than the limit, then
% this is not a true intersection point.

d_12 = sqrt((p_1(1)-p_2(1))^2+(p_1(2)-p_2(2))^2+(p_1(3)-p_2(3))^2);
d_23 = sqrt((p_2(1)-p_3(1))^2+(p_2(2)-p_3(2))^2+(p_2(3)-p_3(3))^2);
d_13 = sqrt((p_1(1)-p_3(1))^2+(p_1(2)-p_3(2))^2+(p_1(3)-p_3(3))^2);

dis = max([d_12, d_23, d_13]);

end

