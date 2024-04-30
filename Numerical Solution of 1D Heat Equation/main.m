L = 0.1; %m, wall thickness
n = 10; %number of simulation nodes
T0 = 0; %deg C, initial temperature of wall
T1s = 40; %deg C, surface 1 cemperature
T2s = 20; %deg C, aurface 2 temperature

dx = L/n; %m, node thickness

alpha = 0.0001; %thermal diffusivity

t_final = 60; %s, simulation time
dt = 0.1; %s, fixed time step

x = dx/2:dx:L-dx/2;

T = ones(n, 1)*T0;

dTdt = zeros(n, 1);

t = 0:dt:t_final;
for j = 1:length(t)
  for i = 2:n-1
   dTdt(i) = alpha*(-(T(i)-T(i-1))/dx^2+(T(i+1)-T(i))/dx^2);
   end
   dTdt (1) = alpha*(-(T(1)-T1s) /dx^2+(T(2) -T (1) ) /dx^2) ;
   dTdt (n) = alpha* (-(T(n)-T(n-1))/dx^2+(T2s-T(n))/dx^2);
   T = T+dTdt*dt;
   figure (1)
   plot (x, T, 'Linewidth', 3)
   axis ( [0 L 0 50])
   xlabel ('Distance (m) ')
   ylabel ('Temperature (\circC) ')
   pause (0.1);
end
