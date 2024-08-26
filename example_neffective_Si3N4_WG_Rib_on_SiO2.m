% This example calculates the effective index of Si3N4 rib waveguide on a
% SiO2 layer for the wavelenths from 1.4 um to 1.6 um.
clear; 
set(0,'defaultlinelinewidth',2)
set(0,'DefaultAxesFontSize',18)
set(0,'DefaultTextFontSize',18)
%%% Solving Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lambdas=linspace(1.4,1.6,11)*1e-6;       %% Wavelength (meter)
neff_guess=1.8;         %% Guess of the effective index solutions (NOT ACTIVATED)
neff_min=1.0;           %% filter the solutions where the effective index is superior than
neff_max=2.1;           %% filter the solutions where the effective index is inferior than
nmodes=16;            %% number of solutions asked

AbsorbingBoundaryCondition=0;     %% 0 or 1

%%% Plotting parameter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AAbs=0;               %% Plot abs(E,H)
RReal=0;              %% Plot real(E,H)
IImag=0;              %% Plot imag(E,H)

plotElectricalField=0;
plotMagneticalField=0;

%%% Optical index Geometry %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nx=81;                %% number of points in the direction x
Ny=71;                %% number of points in the direction y

%%% Grid definition %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = linspace(-2.0e-6, 2.0e-6, Nx);
y = linspace(-2.0e-6, 1.5e-6, Ny);
dx = x(2)-x(1);
dy = y(2)-y(1);

[X,Y] = meshgrid(x,y);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Lx=0.6e-6;
Ly=0.4e-6;
x0=0; y0=Ly/2;
idx  = 1 > abs((X-x0)/Lx*2);
idy  = 1 > abs((Y-y0)/Ly*2);
idXY = idx.*idy ;
neffs = [];

for ix = 1:length(lambdas)
    lambda = lambdas(ix);
    %%% Optical index definition %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    n_Si3N4 = sqrt(get_epsr_Si3N4(lambda*1e6));
    n_SiO2 = sqrt(get_epsr_sio2(lambda*1e6));
    n = n_Si3N4*idXY + (1)*(1-idXY);  %% ridge optical index
    n(Y<=0) = n_Si3N4;
    n(Y<=-1e-7)=n_SiO2;                %% substrate optical index

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if AbsorbingBoundaryCondition==1
        LOSS=1e-5;
        n(:,1)         = n(:,1)         + LOSS*i;
        n(:,end)       = n(:,end)       + LOSS*i;
        n(1,2:end-1)   = n(1,2:end-1)   + LOSS*i;
        n(end,2:end-1) = n(end,2:end-1) + LOSS*i;
    end
    eps=n.^2;
    [~,~,neff]=WG2D_SolveExEy_f(x,y,eps,lambda,nmodes,neff_guess,neff_min,neff_max);
    neffs = [neffs neff];
end


freqs = 3e8./lambdas;
x = freqs/1e12;

figure(11); clf;
plot(x,neffs(1,:), x,neffs(2,:), x,neffs(3,:), x,neffs(4,:),x,neffs(5,:));
xlabel('f (THz)');
ylabel('n_{eff}')
print -dpng figure_modes
