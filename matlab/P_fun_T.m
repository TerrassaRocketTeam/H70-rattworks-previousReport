function P = P_fun_T( T )
% Made by: Pep Rodeja
%
% Input: Temperature in K
% Output: Pressure in Pa
%
% Range of applicability:
% -90 to 36 ºC
%
% Solves the following function:
%
% log_e (P/P_c) = (1/T) [b1(1-T) + b2(1-T)^(3/2) + b3(1-T)^(5/2) + b4(1-T)^5]
%
% Where:
% P = pressure in Pa
% P_c = 7251000 Pa (critical pressure)
% T = reduced temperature in K  (T / Tc), where Tc = 309.57K
% b1 = -6.71893
% b2 = 1.35966
% b3 = -1.3779
% b4 = -4.051
%
% Reference:
% Equation 4.1 in Thermophysical properties of nitrous oxide; IHS ESDU; 91022; September 1991
% http://edge.rit.edu/edge/P07106/public/Nox.pdf

T = T ./ 309.57;

RHS = (1./T).*(...
  -6.71893.*(1-T) +...
  1.35966.*(1-T).^(3/2) -...
  1.3779.*(1-T).^(5/2) -...
  4.051.*(1-T).^(5)...
);

P = exp(RHS) .* 7251000;

end

