close all; clear all ; clc 

N=50;
variance=0;
sym=0;
[x,y] = polyData(N,variance,sym);

z=[y,x];

a = [0.2, -0.3]; na = length(a);
b = [0, 0.4, -0.2]; nb = length(b)-1;
nk = 1;
n = [na, nb, nk];

mARX = arxfit(z, n);

%% 1.b created id2tf function 

traf=id2tf(mARX);

ltiview('impulse',traf)


%% 1.c created idpredict & idsimulate function 

    