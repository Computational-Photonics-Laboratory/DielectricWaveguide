clear; 
%%%%%%%%%%%%%%%%%%%%%%%%%%
set(0,'defaultlinelinewidth',2)
set(0,'DefaultAxesFontSize',18)
set(0,'DefaultTextFontSize',18)

%%% Parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lambda=1550e-9;       %% Wavelength (meter)

neff_guess=1.8;         %% Guess of the effective index solutions (NOT ACTIVATED)
neff_min=1.0;           %% filter the solutions where the effective index is superior than
neff_max=2.1;           %% filter the solutions where the effective index is inferior than
nmodes=16;            %% number of solutions asked

AbsorbingBoundaryCondition=0;     %% 0 or 1

%%%% Plotting parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AAbs=1;               %% Plot abs(E,H)
RReal=0;              %% Plot real(E,H)
IImag=0;              %% Plot imag(E,H)

plotElectricalField=1;
plotMagneticalField=0;

%%% Optical index Geometry %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nx=81;                %% number of points in the direction x
Ny=71;                %% number of points in the direction y

%%%% Grid definition %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
half_xmax=2E-6;              %% map

x = linspace(-half_xmax, half_xmax, Nx);
y = linspace(-2.0e-6, 1.5e-6, Ny);
dx = x(2)-x(1);
dy = y(2)-y(1);

[X,Y] = meshgrid(x,y);

%%%% Optical index definition %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Lx=1.3e-6;
Ly=0.4e-6;

x0=0; y0=Ly/2;

idx  = 1 > abs((X-x0)/Lx*2);
idy  = 1 > abs((Y-y0)/Ly*2);
idXY = idx.*idy ;

n_Si3N4 = sqrt(get_epsr_Si3N4(lambda*1e6));
n_SiO2 = sqrt(get_epsr_sio2(lambda*1e6));

%% ridge optical index
n = n_Si3N4*idXY + (1)*(1-idXY);  
n(Y<=0) = n_Si3N4;

%% substrate optical index
n(Y<=-3.2e-7)=n_SiO2;                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if AbsorbingBoundaryCondition==1
    LOSS=1e-5;
    n(:,1)         = n(:,1)         + LOSS*i;
    n(:,end)       = n(:,end)       + LOSS*i;
    n(1,2:end-1)   = n(1,2:end-1)   + LOSS*i;
    n(end,2:end-1) = n(end,2:end-1) + LOSS*i;
end

eps=n.^2;

% Plot Geometry  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot_geometry;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Hx=[];Hy=[];Hz=[];Ex=[];Ey=[];Ez=[];

[Ex,Ey,neff]=WG2D_SolveExEy_f(x,y,eps,lambda,nmodes,neff_guess,neff_min,neff_max);

display(strcat('neff = ',num2str(neff,'%.5f')   ));

if plotElectricalField==1
    for i=1:length(neff)
        Ez(:,:,i)=WG2D_GetEz_f(x,y,Ex(:,:,i),Ey(:,:,i),eps,neff(i),lambda);
    end
end

if plotMagneticalField==1
    for i=1:length(neff)
        [Hx(:,:,i),Hy(:,:,i),Hz(:,:,i)]=WG2D_GetHxHyHz_f(x,y,Ex(:,:,i),Ey(:,:,i),eps,neff(i),lambda);
    end
end

%%%%%% Generate Field Figures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot_fields
