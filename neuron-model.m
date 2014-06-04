C=100; vr=-60; vt=-40; k=0.7; % parameters used for RS
a=0.03; b=-2; c=-50; d=100; % neocortical pyramidal neurons
vpeak=35; % spike cutoff
T=1000; tau=1; % time span and step (ms)
n=round(T/tau); % number of simulation steps
v=vr*ones(1,n); u=0*v; % initial values
I=[zeros(1,0.1*n),70*ones(1,0.9*n)];% pulse of input DC current
for i=1:n-1 % forward Euler method
v(i+1)=v(i)+tau*(k*(v(i)-vr)*(v(i)-vt)-u(i)+I(i))/C;
u(i+1)=u(i)+tau*a*(b*(v(i)-vr)-u(i));
if v(i+1)>=vpeak % a spike is fired!
v(i)=vpeak; % padding the spike amplitude
v(i+1)=c; % membrane voltage reset
u(i+1)=u(i+1)+d; % recovery variable update
end;
end;
plot(tau*(1:n), v); % plot the result
