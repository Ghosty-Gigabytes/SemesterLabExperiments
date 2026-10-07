clc;
clear;
loadXcosLibs();

scs_m = scicos_diagram();

scs_m.objs($+1) = BIGSOM_f("define");
scs_m.objs($).graphics.orig = [100 100];

xcos(scs_m);
