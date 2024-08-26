function epsr_sio2 = get_epsr_sio2(LAMBDA)
% LAMBDA needs to be in micrometer
n_SiO2=sqrt(1+0.6961663./(1-(0.0684043./LAMBDA).^2)+0.4079426./(1-(0.1162414./LAMBDA).^2)+0.8974794./(1-(9.896161./LAMBDA).^2));
epsr_sio2 = n_SiO2.^2;