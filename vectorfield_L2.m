clear;
clc;
earth;
moon;
l=M_m/M_e;
ms=roots([1;3;3;-l;-2*l;-l]);
ms=ms(3);
ms=ms*r_m;
ms=ms+r_m;

X=4e8:5e6/4:4.1e8;
Y=-20e7:15e6:20e7;
Z=-20e7:15e6:20e7;
[x,y,z]=meshgrid(X,Y,Z);

u1=-(ue/(x.^2+y.^2+z.^2).^2).*(x.*sqrt(x.^2+y.^2));
v1=-(ue/(x.^2+y.^2+z.^2).^2).*(y.*sqrt(x.^2+y.^2));
w1=-(ue/(x.^2+y.^2+z.^2).^2).*(z.*sqrt(x.^2+y.^2+z.^2));


u2=-(um/((x-r_m).^2+y.^2+z.^2).^2).*((x-r_m).*sqrt((x-r_m).^2+y.^2));
v2=-(um/((x-r_m).^2+y.^2+z.^2).^2).*(y.*sqrt((x-r_m).^2+y.^2));
w2=-(um/((x-r_m).^2+y.^2+z.^2).^2).*(z.*sqrt((x-r_m).^2+y.^2+z.^2));
s=1;
u=u1+u2-u1-u2;
v=(v1+v2)/s;
w=(w1+w2)/s;

h1=quiver3(x,y,z,u,v,w);
set(h1,'AutoScale','on', 'AutoScaleFactor', 1);
%view([2,0,0]);
hold on
% plot3(0,0,0,'b.');
 %plot3(r_m,0,0,'r.');
plot3(ms,0,0,'r.','MarkerSize',55);