% d_0 = 0; % d_0 is the thickness of the calibration plant.
% d_1 = 0.03; % d_1 is the thickness of the front glass.
% d_2 = 0.045; % d_2 is the size of the bubble chamber.

% In the function convert.m, the variable alpha_c is set to zero.

line_1 = convert( p1,fc_P1_13,cc_P1_13,kc_P1_13,0,Rc_P1_13,Tc_P1_13 );
line_2 = convert( p2,fc_P2_13,cc_P2_13,kc_P2_13,0,Rc_P2_13,Tc_P2_13 );
line_3 = convert( p3,fc_P3_13,cc_P3_13,kc_P3_13,0,Rc_P3_13,Tc_P3_13 );

line_1 = refraction2(line_1);
line_2 = refraction2(line_2);
line_3 = refraction2(line_3);

[M_1, N_1] = size(line_1);
[M_2, N_2] = size(line_2);
[M_3, N_3] = size(line_3);

[ dis_12, dis_23, dis_13 ] = dis_l3( line_1, line_2, line_3, N_1, N_2, N_3 );

index3  = find3( dis_12, dis_23, dis_13, N_1, N_2, N_3 );

bubbles = point3( index3, line_1, line_2, line_3 );

scatter3(bubbles(1,:),bubbles(2,:),bubbles(3,:));

xlabel('X');
ylabel('Y');
zlabel('Z');



% points_1 = points_at_zero(line_1);
% points_3 = points_at_zero(line_3);
% 
% scatter(points_3(1,:),points_3(2,:));
