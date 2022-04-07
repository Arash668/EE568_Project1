Lstack =20e-3;
Airgap_min = 0.5e-3;
Airgap_max = 2.5e-3;
u0 = pi*4e-7;
I_dc = 3 ; 
Nseries = 250; % number of turns
Stator_Pole_arc = 74*pi/180;
% Stator_Pole_arc = 67.5*pi/180;
% there are two airgaps Upper one I call Airgap1 and lower one Airgap2

% when rotor position is 90 deg minimum reluctance is achieved 
% 74 degree is the arc of the rotor pole
Rmin =  Airgap_min/(u0*12e-3*Stator_Pole_arc*Lstack);
% when rotor position is 0 deg maximum reluctance is achieved
Rmax = Airgap_max/(u0*10e-3*Stator_Pole_arc*Lstack); 

theta = 0:360;
% I consider a sinusoidal variatoin for the reluctance
% there are two airgap, here I just calculated the torque for airgap1 and
% at the end we multiply the torque by 2 to 
R_airgap = (Rmax+Rmin)/2+(Rmax-Rmin)*cosd(2*theta)/2;

L = Nseries^2./R_airgap;
% drivative of the inductance L has been taken by hand and below is the
% resutltant dl/dtheta
DL_Dtheta = -1*(Nseries^2)*((Rmax-Rmin)/2*(-2*sind(2*theta)))./(R_airgap.^2);

Torque = 2*(I_dc^2*DL_Dtheta)/2;

figure
plot(theta,R_airgap)
xlabel('Rotor Rotation deg ');
ylabel(' Reluctance');
figure
plot(theta,L*1000)
xlabel('Rotor Rotation deg ');
ylabel(' Inductance mH');
figure
plot(theta,Torque)
xlabel('Rotor Rotation deg ');
ylabel(' Torque Nm');

