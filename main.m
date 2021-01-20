clear;
clc;
%planet and moon
earth;
moon;
l=M_m/M_e;
global ms;
ms=roots([1;3;3;-l;-2*l;-l]);
ms=ms(3);
ms=ms*r_m;

%initial position
x0_m=r_m;
y0_m=0;
z0_m=0;

inclination_m=0;
theta=degtorad(0.001);
phi=degtorad(1);
state_s=r_m*[1;0;0]+ms*[cos(theta);0;sin(theta)];

x0_s=state_s(1);
y0_s=state_s(2);
z0_s=state_s(3);

semimajor_m=norm([x0_m;y0_m;z0_m]);
v_m=sqrt(ue/semimajor_m);



xdot_m=0;
ydot_m=v_m*cos(inclination_m);
zdot_m=v_m*sin(inclination_m);


xdot_s=0;
ydot_s=ydot_m*(norm(state_s)/x0_m)*cos(0);
zdot_s=zdot_m*(norm(state_s)/x0_m)*sin(0);

state0=[x0_m;y0_m;z0_m;x0_s;y0_s;z0_s;
         xdot_m;ydot_m;zdot_m;xdot_s;ydot_s;zdot_s];


%timespan
period_m=2*pi*sqrt(semimajor_m.^3/ue);
orbitcount=1.5;
timespan=0:5000:orbitcount*period_m;


%diff equation

[t,state]=ode45(@station,timespan,state0);


x_m=state(:,1)/1000;
y_m=state(:,2)/1000;
z_m=state(:,3)/1000;

x_s=state(:,4)/1000;
y_s=state(:,5)/1000;
z_s=state(:,6)/1000;

[p,q,r]=sphere;
p=p*R_e/1000;
q=q*R_e/1000;
r=r*R_e/1000;


%plotting
hold on
for k=1:length(t);
    
    XC=[x_m(k),y_m(k),z_m(k)];
    hold on
    %view([1,1,1]);
    %view([90,90])
    campos([x_s(k),y_s(k),z_s(k)]);
    surf(p,q,r);
    axis(7e5*[-1,1,-1,1,-1,1,]);
    plot3(x_m(k),y_m(k),z_m(k),'r.');
    plot3(x_s(k),y_s(k),z_s(k),'b.');
    
    plot3(x_m(1:k),y_m(1:k),z_m(1:k),'r-');
    %plot3(x_s(1:k),y_s(1:k),z_s(1:k),'b-');
    pause(0.01);
    if k<length(t);
        clf;
    end
end
