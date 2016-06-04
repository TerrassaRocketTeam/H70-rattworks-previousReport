function ro = ro_l_fun_T( T )
% Made by: Pep Rodeja
%
% Input: Temperature in K
% Output: density in kg/m3
%
% Range of applicability:
% -90 to 36 ºC
%
% Solves the following function:
%
% log_e (ro/ro_c) = b1(1-T)^(1/3) + b2(1-T)^(2/3) + b3(1-T) + b4(1-T)^(4/3)
%
% Where:
% ro = density at saturated liquid in kg/m3
% ro_c = 452 kg/m3 (critical pressure)
% T = reduced temperature in K  (T / Tc), where Tc = 309.57K
% b1 = 1.72328
% b2 = -0.83950
% b3 = 0.51060
% b4 = -0.10412
%
% Reference:
% Equation 4.2 in Thermophysical properties of nitrous oxide; IHS ESDU; 91022; September 1991
% http://edge.rit.edu/edge/P07106/public/Nox.pdf

T = T ./ 309.57;

RHS = (...
  1.72328.*(1-T).^(1/3) -...
  0.83950.*(1-T).^(2/3) +...
  0.51060.*(1-T) -...
  0.10412.*(1-T).^(4/3)...
);

ro = exp(RHS) .* 452;

end

