function Refracted_Line = refraction(Line)

n_0 = 1;
n_1 = 1.4527;
n_2 = 1.264;
d_0 = 0;  
d_1 = 0.030;

% Here n_0, n_1 and n_2 refer to the indexes of refraction of the air, the
% glass and the Freon R134A. d_0 and d_1 refer to the thickness of calibration
% board and the glass, which normalized in millimeter.

x_0 = Line(1);
y_0 = Line(2);
z_0 = Line(3);
a_0 = Line(4);
b_0 = Line(5);
c_0 = Line(6);

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
c_1 = sqrt(1-k_1^2);


x_2 = x_1-a_1/c_1*d_1;
y_2 = y_1-b_1/c_1*d_1;
z_2 = z_1-d_1;

% The following part calculates the refraction between the glass and the
% freon.

k_2 = n_0/n_2*k_0;

a_2 = a_0/sqrt(a_0^2+b_0^2)*k_2;
b_2 = b_0/sqrt(a_0^2+b_0^2)*k_2;
c_2 = sqrt(1-k_2^2);



Refracted_Line(1) = x_2;
Refracted_Line(2) = y_2;
Refracted_Line(3) = z_2;
Refracted_Line(4) = a_2;
Refracted_Line(5) = b_2;
Refracted_Line(6) = c_2;