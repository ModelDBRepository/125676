%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Victor V. Matveev, Richard Bertram and Arthur Sherman (2009)
%    Ca2+ current vs. Ca2+ channel cooperativity of exocytosis
%        Journal of Neuroscience, 29(39): 12196-12209. 
%
%    Plots Figure 1 using data produced by CalC script Fig1.par
%                 Victor Matveev, January 8, 2010
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global K;

nameList = {'Fig1.par_Btot100_Dist30nm_50x50x40.dat', ...
            'Fif1.par_Btot200_Dist30nm_50x50x40.dat', ...
            'Fig1.par_Btot400_Dist30nm_50x50x40.dat', ...
            'Fig1.par_Btot800_Dist30nm_50x50x40.dat', ...
            'Fig1.par_Btot1600_Dist30nm_50x50x40.dat'};
       
legendStr = {'B_{total}=100 \mu M', 'B_{total}=200 \mu M', 'B_{total}=400 \mu M', ...
             'B_{total}=800 \mu M', 'B_{total}=1600 \mu M'};  
        
lst = {'-', ':', '-.', '--', '-'};

Npool = 1;

for IT = 1:length(nameList)

lw = 3.5 - 0.5 * IT;
grsh  = 1 - 0.15 * IT;
cl = [grsh grsh grsh];

name = nameList{IT};
A = process2D(name,5);
ICA = squeeze( A(1,:,:) );

Rmax = squeeze( A(2,:,:) );
Cmax = squeeze( A(3,:,:) );
Tmax = squeeze( A(5,:,:) );

L = length(ICA);
ICA = ICA(3:L);
Rmax = Rmax(3:L);
Cmax = Cmax(3:L);
Tmax = Tmax(3:L);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
labelFontSize = 12;
axisFontSize = 10;
titleFontSize = 15;

xl = 'Peak [Ca^{2+}]_{int} (\mu M)';
yl = 'Release (ms^{-1})';

subplot(2,2,1);
plot(Cmax, Rmax*Npool, lst{IT}, 'color', cl, 'linewidth', lw); hold on;
set(gca,'Xscale','log');
set(gca,'Yscale','log');
if IT == 1
xlabel(xl,'FontSize',labelFontSize); 
ylabel(yl,'FontSize',labelFontSize);
set(gca,'FontSize',axisFontSize);
text(0.01,150,'A', 'FontSize', titleFontSize+2);
end;
set(gca,'box','off');
axis([0.1 1000 10^-8 10]);
set(gca,'ytick',[10^-9 10^-7 10^-5 10^-3 10^-1 10])
set(gca,'xtick',[0.1 1 10 100 1000])

subplot(2,2,2);
NBC = diff(log(Rmax)) ./ diff(log(Cmax));
plot(Cmax(2:L-2), NBC, lst{IT}, 'color', cl, 'linewidth', lw);hold on;
set(gca,'Xscale','log');
if IT == 1
xlabel(xl,'FontSize',labelFontSize); 
ylabel('dlog R/dlog [Ca^{2+}]','FontSize',labelFontSize);
title('n_{int}, apparent [Ca^{2+}]_{int} cooperativity', 'FontSize',titleFontSize);
set(gca,'FontSize',axisFontSize);
text(0.01,5,'B', 'FontSize', titleFontSize+2);
end;
set(gca,'box','off');
axis([0.1 1000 0 5]);
set(gca,'xtick',[0.1 1 10 100 1000])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xl = 'i_{Ca} (pA)';

subplot(2,2,3);
plot(ICA, Npool*Rmax, lst{IT}, 'color', cl, 'linewidth', lw); hold on;
set(gca,'Xscale','log');
set(gca,'Yscale','log');

if IT == 1
xlabel(xl,'FontSize',labelFontSize); 
ylabel(yl,'FontSize',labelFontSize);
set(gca,'FontSize',axisFontSize);
text(0.01,150,'C', 'FontSize', titleFontSize+2);
end
set(gca,'box','off');
axis([0.001 1 10^-8 10]);
set(gca,'ytick',[10^-9 10^-7 10^-5 10^-3 10^-1 10])
set(gca,'xtick',[0.001 0.01 0.1 1])

subplot(2,2,4);
NBC = diff(log(Rmax)) ./ diff(log(ICA));
plot(ICA(2:L-2), NBC, lst{IT}, 'color', cl, 'linewidth', lw);hold on;
set(gca,'Xscale','log');
if IT==1
xlabel(xl,'FontSize',labelFontSize); 
ylabel('dlog R/dlog I_{Ca}','FontSize',labelFontSize);
title('n_{ext}, apparent [Ca^{2+}]_{ext} cooperativity','FontSize',titleFontSize);
set(gca,'FontSize',axisFontSize);
text(0.01,7,'D', 'FontSize', titleFontSize+2);
end;
set(gca,'box','off');
axis([0.001 1 0 5]);
set(gca,'xtick',[0.001 0.01 0.1 1])

end;

subplot(2,2,3); legend(legendStr);
subplot(2,2,4); legend(legendStr);


