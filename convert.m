function [ lines ] = convert( x_kk,fc,cc,kc,alpha_c,Rc,Tc )
% This function is used to convert the pixels on the photo to the 3D
% lines in the calibration plane frame. In this function the refraction
% part will be taken into consideration.

xn = normalize(x_kk,fc,cc,kc,alpha_c);

lines = convert_to_cal(xn,Rc,Tc);

end

