clear; close all; clc;
s = tf('s');
SM = 0.1/(0.1*s+1);
SMMF = feedback(SM, 1)
TB = (1-1.5*s)/(1+(0.5*1.5*s))
GR = ((1/2)*1/s);
GRMF = feedback(GR, 0)
FTMA = SMMF*TB*GRMF

    
    for z=0:2:18
        G = feedback(FTMA, z);
        pause(0.1);
        subplot1 = subplot(3, 1, 1);
        step(G);
        xlim(subplot1,[0 30]);
        ylim(subplot1,[-1 1]);
        subplot2 = subplot(3, 1, 2);
        pzmap(G) ;
        xlim(subplot2,[-12 2]);
        ylim(subplot2,[-1 1]);
        subplot3 = subplot(3, 1, 3);
        rlocus(G);
        xlim(subplot3,[-15 15]);
        ylim(subplot3,[-2 2]);
    end
