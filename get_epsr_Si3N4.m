function epsr_Si3N4 = get_epsr_Si3N4(LAMBDA)
% LAMBDA needs to be in micrometer
n_Si3N4=sqrt(1+3.0249./(1-(0.1353406./LAMBDA).^2)+40314./(1-(1239.842./LAMBDA).^2));
epsr_Si3N4 = n_Si3N4.^2;