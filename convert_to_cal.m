function [ lines ] = convert_to_cal( x_n,Rc,Tc )
% This function convert the vectors in the camera frame to the lines in the
% calibration plane frame.

line = zeros(6,1); % The one is the line before calculating the refraction.
lines = zeros(6,1);


[A, B] = size(x_n);


% Here we need to calculate the position of the given pixel in camera
% coordinate then transfer it into calibration blank coordinate. First we
% should calculate the position of the camera frame's origin.

p_origin = -Rc\Tc;

num = 1;

for i = 1:B
    
    ver_cal = Rc\[x_n(1,i);x_n(2,i);1];

%     x_2 = p_origin(1);
%     y_2 = p_origin(2);
%     z_2 = p_origin(3);
%             
%     k_x = ver_cal(1);
%     k_y = ver_cal(2);
%     k_z = ver_cal(3);

    line(1:3) = p_origin(1:3);
    line(4:6) = ver_cal(1:3);
%    line = refraction(line);
    
    lines(1:6, num) = line(1:6);
            
    num = num+1;
end;


end

