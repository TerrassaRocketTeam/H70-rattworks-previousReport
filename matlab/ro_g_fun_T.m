function ro = ro_g_fun_T( T )
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
% log_e (ro/ro_c) = b1(1/T-1)^(1/3) + b2(1/T-1)^(2/3) + b3(1/T-1) + ...
%                     ... b4(1/T-1)^(4/3) + b5(1/T-1)^(5/3)
%
% Where:
% ro = density at saturated vapour in kg/m3
% ro_c = 452 kg/m3 (critical pressure)
% T = reduced temperature in K  (T / Tc), where Tc = 309.57K
% b1 = -1.00900
% b2 = -6.28792
% b3 = 7.50332
% b4 = -7.90463
% b5 = 0.629427
%
% Reference:
% Equation 4.3 in Thermophysical properties of nitrous oxide; IHS ESDU; 91022; September 1991
% http://edge.rit.edu/edge/P07106/public/Nox.pdf

T = T ./ 309.57;

RHS = (...
  -1.00900.*(1./T-1).^(1/3) -...
  6.28792.*(1./T-1).^(2/3) +...
  7.50332.*(1./T-1) -...
  7.90463.*(1./T-1).^(4/3) +...
  0.629427.*(1./T-1).^(4/3)...
);

ro = exp(RHS) .* 452;

end

