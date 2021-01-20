function d_state=station(t,state);
earth
moon
global ms;

r_m=state(1:3);   %moon position vector
r_s=state(4:6);   %station vector from moon to station
r_ms=r_s-r_m;

me_hat=r_m/norm(r_m);
es_hat=r_s/norm(r_s);
ms_hat=r_ms/norm(r_ms);

v_m=state(7:9);
v_s=state(10:12);

rnorm_m=norm(r_m);
rhat_m=r_m/rnorm_m;

%Fm=(ue*M_m/(rnorm_m.^2))*(-rhat_m);
a_m=(ue/(rnorm_m.^2))*(-rhat_m);

a_s=(ue/(norm(r_s).^2))*(-es_hat)+(um/(norm(r_ms).^2))*(-ms_hat);



d_state=[v_m;v_s;a_m;a_s];