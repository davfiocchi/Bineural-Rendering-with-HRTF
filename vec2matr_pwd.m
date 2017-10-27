function [ pwd_matr ] = vec2matr_pwd( pwd_coeff, azimuth, elevation, angles_tuple )
%Converts the vectorial form of the coefficents into its matrix form (useful
%just for CYPIC and test)
%   pwd_coeff: matrix of pwd coefficents (dimension: <nangles, w>)
%   azimuth: vector of azimuth (dimension: <nazimuth,1>)
%   elevation: vector of elevation (dimension: <nelevation,1>)
%   angles_tuple: tuple of angles generated by the combinations of azimuth
%       and elevation (dimension: <nazimuth*nelevation,2>)

pwd_matr = zeros(size(azimuth,1), size(elevation,1), size(pwd_coeff,2));

for i=1:size(pwd_coeff,1)
    azi = find(azimuth == angles_tuple(i,1));
    ele = find(elevation == angles_tuple(i,2));
    for w=1:size(pwd_coeff,2)
        pwd_matr(azi, ele, w) = pwd_coeff(i, w);
    end
end

end

