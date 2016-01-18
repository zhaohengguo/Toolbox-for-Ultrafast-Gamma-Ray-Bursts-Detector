function mid = midpoint( line_1, line_2 )
% This function calculates the midpoint between two lines.

% Here we need to calculate the midpoint between two lines. The so-called
% midpoint is defined in following way. Consider point A on line 1 and
% point B on line 2, we can find A_0 and B_0 to make distance between A and B
% shortest. The midpoint between two lines is defined as the middle point
% of the line segment A_0-B_0.

p1 = [line_1(1), line_1(2), line_1(3)];
p2 = [line_2(1), line_2(2), line_2(3)];
D = p1 - p2;

k1 = [line_1(4), line_1(5), line_1(6)];
k2 = [line_2(4), line_2(5), line_2(6)];

A = [norm(k1)^2, -dot(k1,k2); dot(k1,k2), -norm(k2)^2];
B = -[dot(k1, D); dot(k2, D)];
T = A\B;

t1 = T(1,1);
t2 = T(2,1);

mid = 0.5*(p1 + p2 + t1*k1 + t2*k2);

end

