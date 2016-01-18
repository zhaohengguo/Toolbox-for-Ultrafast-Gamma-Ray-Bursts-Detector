function d = dis_l( line_1, line_2 )
% This function calculates the distance between two given lines. 

% Here we use the geometical trick to calculate the distance between two
% given lines. This function will be used in the function mid_point(),
% which calculates the approximated intersection between one line and a set
% of lines.

p1 = [line_1(1), line_1(2), line_1(3)];
p2 = [line_2(1), line_2(2), line_2(3)];
D = p1 - p2;

k1 = [line_1(4), line_1(5), line_1(6)];
k2 = [line_2(4), line_2(5), line_2(6)];

k3 = cross(k1, k2);

d = abs(dot(D, k3))/norm(k3);

% % fprintf('The distance calculated in the first way is %d.\n', d);
% % 
% % %%%%%%%%%%% The second way %%%%%%%%%%%%
% % 
% % A = [norm(k1)^2, -dot(k1,k2); dot(k1,k2), -norm(k2)^2];
% % B = -[dot(k1, D); dot(k2, D)];
% % T = A\B;
% % 
% % t1 = T(1,1);
% % t2 = T(2,1);
% % 
% % d2 = norm((p1+t1*k1)-(p2+t2*k2));
% % 
% % fprintf('The distance calculated in the second way is %d.\n', d2);


end

