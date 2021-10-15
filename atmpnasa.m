
clear all

N = 100000;

h = 0:N-1 ; % height in m
T(1) = 25 ;  % Temperature in C
p(1) = 101.325; % \Atmopshere pressure in KPa
rho_h(1) = 1.2; % density in Kg per m3

for t = 1:N-1

if h(t) <= 11000
T(t+1) =  15.04 - 0.00649.*h(t );
p(t+1) =  101.29 .*((T(t) + 273.15) /288.08).^5.256 ;

elseif 11000 < h(t) && h(t) <= 25000
T(t) = -56.46 ;
p(t+1) = 22.65.*exp(1.73-0.000157.*h(t));


else
T(t+1) = 131.21+0.00299.*h(t);
p(t+1) = 2.488 .* ((T(t) + 273.15)/216.6).^-11.388 ;
end

rho_h(t+1) = p(t) ./(0.2869 * (T(t) + 273.15 ));

end

figure(1 )
whos
plot(T,h)
grid on
xlabel("Temperature in C ")
ylabel("Altitude in Km")

figure(2 )
plot(h./1000, rho_h)
grid on
legend Density
xlabel("density in Kg per m3")
ylabel("Altitude in m")

figure(3)
whos
plot(p,h )
grid on
ylabel("pressure in KPa ")
xlabel("Altitude in Km")
