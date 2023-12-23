%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Victor V. Matveev, Richard Bertram and Arthur Sherman (2009)
%    Ca2+ current vs. Ca2+ channel cooperativity of exocytosis
%        Journal of Neuroscience, 29(39): 12196-12209. 
%
% Plots Figures 7 & 8 using data produced by CalC script Fig7_8.par
%                 Victor Matveev, January 8, 2010
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global K;

figure(1);
fig2 = 4;

name = 'Fig7_8.par.Dist0.02.Imax0.05pA.80x80x50.dat';
tstr = 'Equidistant channels (20nm), No-flux b.c., mobile buffer';

lst = {'-', ':', '-.', '--', '-'};

Bmax = 10000;
bgr = 0.1;
fraction = 0.1;

A = process2D(name,11);
BT = squeeze( A(1,:,:) );

r00 = A(2);
r10 = squeeze( A(3,:,:) );
r01 = squeeze( A(4,:,:) );
r11 = squeeze( A(5,:,:) );

c10 = squeeze( A(6,:,:) );
c01 = squeeze( A(7,:,:) );
c11 = squeeze( A(8,:,:) );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
log1 = 0; log2 = 0;
labelFontSize=12;
axisFontSize=12;
titleFontSize=14;

rho = [0:0.01:0.99];
BTA = [0:20:1000];

xl = 'p_o (open channel fraction)';
iRange = 1:10:40;
ds = 0.8 / iRange(length(iRange));
lstr = [];
j = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = iRange
    j = j + 1;
    grsh = ds*i; cl = [grsh grsh grsh]; lw = 3*grsh + 1;
    
    r  = r11(i) / r10(i);
    fr = 1 + r01(i) / r10(i);
    fc = 1 + (c01(i)-bgr) / (c10(i)-bgr);
    eps = r00 / r10(i);
    
    lstr = [lstr; {sprintf('B_{total}=%d\\muM, r=%.3g',round(BT(i)), r)} ];
    
    R0 = eps * rho.^2;
    RR = r*(1 - rho).^2 + fr*rho.*(1-rho);
    I = find(R0 > fraction*RR);
    if length(I) > 0
        ii = I(1);
    else
        ii = length(rho);
    end;
   
    MICa = ( 2*r*(1-rho) - fr*(1-2*rho) - 2*eps*rho ) ./ (r*(1 - rho) + fr*rho + eps*rho.^2./(1-rho));
    Mch   = ( fr*rho + r*fc*(1-rho) ) ./ (r*(1 - rho) + fr*rho + eps*rho.^2./(1-rho));

    subplot(1,2,1); hold on;
    yl = 'm_{ICa}';
    plot(1-rho(1:ii), MICa(1:ii), lst{j}, 'color', cl, 'linewidth', lw); 
    title('Current cooperativity, m_{ICa}', 'fontSize', titleFontSize);
    if i == 1 
        text(-0.05,2.05,'A', 'FontSize', titleFontSize+2);
    end;
    axis([0 1 1 2]);
    xlabel(xl,'FontSize',labelFontSize); 
    ylabel(yl,'FontSize',labelFontSize);
    set(gca,'FontSize',axisFontSize);
    set(gca,'box','off');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    subplot(1,2,2); hold on;
    yl = 'm_{CH}';
    plot(1-rho(1:ii), Mch(1:ii), lst{j}, 'color', cl, 'linewidth', lw);
    title('Channel cooperativity, m_{CH}', 'fontSize', titleFontSize);
    if i == 1 
        text(-0.05,2.05,'B', 'FontSize', titleFontSize+2);
    end;
    axis([0 1 1 2]);
    xlabel(xl,'FontSize',labelFontSize); 
    ylabel(yl,'FontSize',labelFontSize);
    set(gca,'FontSize',axisFontSize);
    legend(lstr);
    set(gca,'box','off');
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    drawnow;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(fig2);
log1 = 0; log2 = 0;
labelFontSize=16;
axisFontSize=16;

rhoA = [0.2 0.4 0.6 0.8];

lstr = [];
xl = 'B_{total}';

I = find(BT > Bmax); 
if length(I)==0, I=[length(BT)]; end;
r  = r11(1:I(1)) ./ r10(1:I(1));
fr = 1 + r01(1:I(1)) ./ r10(1:I(1));
fc = 1 + (c01(1:I(1)) - bgr) ./ (c10(1:I(1)) - bgr);
eps = r00 ./ r10(1:I(1));
i = 0;    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for rho = rhoA
    i = i + 1;
    lstr = [lstr; { sprintf('p_o=%g', 1-rho) } ];
    
    grsh = (rho - min(rhoA))/(max(rhoA) - min(rhoA)); 
    cl = 0.8 .* [grsh grsh grsh]; lw = 2*grsh + 0.5;    
     
    MICa = ( 2*r*(1-rho) - fr*(1-2*rho) - 2*eps*rho ) ./ (r*(1 - rho) + fr*rho + eps*rho^2/(1-rho));
    Mch   = ( fr*rho + r.*fc*(1-rho) ) ./ (r*(1 - rho) + fr*rho + eps*rho^2/(1-rho));

    R0 = eps * rho^2 / (1-rho);
    RR = r*(1 - rho) + fr.*rho;
    I = find(R0 > fraction * RR);
    if length(I) > 0
        ii = I(1);
    else
        ii = length(r);
    end;
    
    subplot(1,3,2); hold on; 
    title('{\bfB.}  Channel cooperativity, m_{CH}', 'fontSize', titleFontSize);
    yl = 'm_{CH}';
    plot(BT(1:ii), Mch(1:ii), lst{i}, 'color', cl, 'linewidth', lw);
    axis([0 Bmax 1 2]);
    xlabel(xl,'FontSize',labelFontSize); 
    ylabel(yl,'FontSize',labelFontSize);
    set(gca,'FontSize',axisFontSize);
    legend(lstr);
    set(gca,'Xscale','log');
    set(gca,'box','off');
    set(gca,'xtick',[1 10 100 1000 10000]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    subplot(1,3,3); hold on; 
    title('{\bfC.}  Current cooperativity, m_{ICa}', 'fontSize', titleFontSize);
    yl = 'm_{ICa}';
    plot(BT(1:ii), MICa(1:ii), lst{i}, 'color', cl, 'linewidth', lw); 
    axis([0 Bmax 1 2]);
    xlabel(xl,'FontSize',labelFontSize); 
    ylabel(yl,'FontSize',labelFontSize);
    set(gca,'FontSize',axisFontSize);
    set(gca,'Xscale','log');
    set(gca,'box','off');
    set(gca,'xtick',[1 10 100 1000 10000]);
    drawnow;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,3,1); hold on;
    yl = 'r';
    plot(BT(1:ii), r(1:ii), 'k-', 'linewidth', 2);
    title('{\bfA.}  Release ratio, r=P(R|2)/P(R|1)', 'fontSize', titleFontSize);
    axis([0 10000 0 max(r)]);
    set(gca,'Xscale','log');
    xlabel(xl,'FontSize',labelFontSize); 
    ylabel(yl,'FontSize',labelFontSize);
    set(gca,'FontSize',axisFontSize);
    %legend(lstr);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    set(gca,'Xscale','log');
    set(gca,'box','off');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
