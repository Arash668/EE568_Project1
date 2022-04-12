Lstack =20e-3;
Airgap_min = 2*0.5e-3;
Airgap_max = 2*2.5e-3;
u0 = pi*4e-7;
I_dc = 3 ; 
Nseries = 250; % number of turns
Stator_Pole_arc = 74*pi/180; % 74 degree is the arc of the staor pole facing rotor
% Stator_Pole_arc = 67.5*pi/180;
Stator_radius = 12e-3;
% there are two airgaps Upper one I call Airgap1 and lower one Airgap2

% when rotor position is 90 deg minimum reluctance is achieved 

Area = Stator_radius*Stator_Pole_arc*Lstack;
Rmin =  Airgap_min/(u0*Area);
% when rotor position is 0 deg maximum reluctance is achieved
Rmax = Airgap_max/(u0*Area);

theta = 0:360;

Lmax = Nseries^2/Rmin;
Lmin = Nseries^2/Rmax;
LL = (Lmax+Lmin)/2+(Lmax-Lmin)*cosd(2*theta)/2;
R_airgap = Nseries^2./LL;
DL_Dtheta = -2*(Lmax-Lmin)*sind(2*theta)/2;

Torque = (I_dc^2*DL_Dtheta)/2;

figure
plot(theta,R_airgap)
xlabel('Rotor Rotation deg ');
ylabel(' Reluctance');
figure
plot(theta,LL*1000)
xlabel('Rotor Rotation deg ');
ylabel(' Inductance mH');
figure
plot(theta,Torque)
xlabel('Rotor Rotation deg ');
ylabel(' Torque Nm');

