function [ points ] = corners_on_plane( x_n,Rc_1,Tc_1,Rc_2,Tc_2,Rc_3,Tc_3,index )
% I want to use this function to transform the lines from vectors in the
% camera frame to the calibration plant frame. Then I want to project all
% the corners on the z=0 plane to see whether they can form the
% rectangle or not. 

% Here (x_0, y_0) is the coordinate of the origin in the calibration plate.
% Number size_x and size_y demonstrate the size of the picture.

if index == 1
    Rc_ext = Rc_1;
    Tc_ext = Tc_1;
    fprintf('This is case 1!\n');
else
    if index == 2
        Rc_ext = Rc_2;
        Tc_ext = Tc_2;
        fprintf('This is case 2!\n');
    else
        if index ==3
            Rc_ext = Rc_3;
            Tc_ext = Tc_3;
            fprintf('This is case 3!\n');
        end;
    end;
end; 

points = zeros(2,1);

[A, B] = size(x_n);


% Here we need to calculate the position of the given pixel in camera
% coordinate then transfer it into calibration blank coordinate. First we
% should calculate the position of the camera frame's origin.

p_origin = -Rc_ext\Tc_ext;

count_lines = 1;

for i = 1:B
    
    ver_cal = Rc_ext\[x_n(1,i);x_n(2,i);1];

    x_2 = p_origin(1);
    y_2 = p_origin(2);
    z_2 = p_origin(3);
            
    k_x = ver_cal(1);
    k_y = ver_cal(2);
    k_z = ver_cal(3);

    points(1, count_lines) = x_2-z_2*k_x/k_z;
    points(2, count_lines) = y_2-z_2*k_y/k_z;
            
    count_lines = count_lines+1;
end;

end