function [ ref_lines ] = refraction2( lines )
% This function is used to calculate the refraction. The difference between
% this function and the refraction.m is that this function can treat the
% lines as an array, whereas the other function can only treat one line at
% one time.

n_0 = 1;
n_1 = 1.4527;
n_2 = 1.264; % I don't know the exact number of the refraction index if feron.
d_0 = (n_1-1)*0.0016;  
d_1 = 0.03;

[A, B] = size(lines); % B is the number of lines.
ref_lines = zeros(6,1); % ref_lines is the array of lines after the refraction.

for i = 1:B
    x_0 = lines(1,i);
    y_0 = lines(2,i);
    z_0 = lines(3,i);
    a_0 = lines(4,i);
    b_0 = lines(5,i);
    c_0 = lines(6,i);

    a_0 = a_0/sqrt(a_0*a_0+b_0*b_0+c_0*c_0);
    b_0 = b_0/sqrt(a_0*a_0+b_0*b_0+c_0*c_0);
    c_0 = c_0/sqrt(a_0*a_0+b_0*b_0+c_0*c_0);

% The following part considers the thickness of the calibration board. One
% thing we need to take care is that here c_0, which is the slope in z
% direction, must be positive. Otherwise the whole calculation will be
% wrong.

    x_1 = x_0-a_0*(z_0+d_0)/c_0;
    y_1 = y_0-b_0*(z_0+d_0)/c_0;
    z_1 = -d_0;

% The following part calculates the refraction between the air and the
% glass.

    k_0 = sqrt((a_0^2+b_0^2)/(a_0^2+b_0^2+c_0^2));
    k_1 = n_0/n_1*k_0;

    a_1 = a_0/sqrt(a_0^2+b_0^2)*k_1;
    b_1 = b_0/sqrt(a_0^2+b_0^2)*k_1;
    c_1 = sign(c_0)*sqrt(1-k_1^2);

    x_2 = x_1-a_1/c_1*d_1;
    y_2 = y_1-b_1/c_1*d_1;
    z_2 = z_1-d_1;

% The following part calculates the refraction between the glass and the
% freon.

    k_2 = n_0/n_2*k_0;

    a_2 = a_0/sqrt(a_0^2+b_0^2)*k_2;
    b_2 = b_0/sqrt(a_0^2+b_0^2)*k_2;
    c_2 = sign(c_0)*sqrt(1-k_2^2);

    ref_lines(1,i) = x_2;
    ref_lines(2,i) = y_2;
    ref_lines(3,i) = z_2;
    ref_lines(4,i) = a_2;
    ref_lines(5,i) = b_2;
    ref_lines(6,i) = c_2;
end;

end

