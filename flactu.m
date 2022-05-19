clc; clear all; close all

%% SINR fluctuation vs. inclination angle
angle_incl = 0:1:180; % Inclination angle

count = 0;

for i = 1:length(angle_incl)
    
    count = count + 1
    
    % Nr = 3
    [sinr_SBC_fluc2_3Rx(i),sinr_EGC_fluc2_3Rx(i),sinr_MRC_fluc2_3Rx(i),...
        sinr_SBC_fluc4_3Rx(i),sinr_EGC_fluc4_3Rx(i),sinr_MRC_fluc4_3Rx(i)] = ...
        get_sinr_flux_3Rx(angle_incl(i));
    
    % Nr = 4
    [sinr_SBC_fluc2_4Rx(i),sinr_EGC_fluc2_4Rx(i),sinr_MRC_fluc2_4Rx(i),...
        sinr_SBC_fluc4_4Rx(i),sinr_EGC_fluc4_4Rx(i),sinr_MRC_fluc4_4Rx(i)] = ...
        get_sinr_flux_4Rx(angle_incl(i));
    
    % Nr = 5
    [sinr_SBC_fluc2_5Rx(i),sinr_EGC_fluc2_5Rx(i),sinr_MRC_fluc2_5Rx(i),...
        sinr_SBC_fluc4_5Rx(i),sinr_EGC_fluc4_5Rx(i),sinr_MRC_fluc4_5Rx(i)] = ...
        get_sinr_flux_5Rx(angle_incl(i));
    
    % Nr = 6
    [sinr_SBC_fluc2_6Rx(i),sinr_EGC_fluc2_6Rx(i),sinr_MRC_fluc2_6Rx(i),...
        sinr_SBC_fluc4_6Rx(i),sinr_EGC_fluc4_6Rx(i),sinr_MRC_fluc4_6Rx(i)] = ...
        get_sinr_flux_6Rx(angle_incl(i));
end

figure(1)
subplot(2,3,1)
h1 = plot(angle_incl,sinr_EGC_fluc2_3Rx,':k',angle_incl,sinr_EGC_fluc2_4Rx,'--g',...
    angle_incl,sinr_EGC_fluc2_5Rx,'-.b',angle_incl,sinr_EGC_fluc2_6Rx,'-r');  
axis([0 90 18 30]);
title('(a) \itN_t\rm\bf = 2 with EGC');
xlabel('Inclination angle (\circ)','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
ylabel('SINR fluctuation (dB)','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
% set(gca,'XTick', [0 90 180 270 360]);
legend('\itN_r\rm\bf = 3','\itN_r\rm\bf = 4','\itN_r\rm\bf = 5','\itN_r\rm\bf = 6','location','best')
set(gca,'FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gca,'linewidth',1.5); 
set(gca,'ticklength',[0.02;0.025]);
set(gcf,'Color',[1,1,1]);
set(h1,'MarkerSize',8,'linewidth',2)

subplot(2,3,2)
h2 = plot(angle_incl,sinr_SBC_fluc2_3Rx,':k',angle_incl,sinr_SBC_fluc2_4Rx,'--g',...
    angle_incl,sinr_SBC_fluc2_5Rx,'-.b',angle_incl,sinr_SBC_fluc2_6Rx,'-r');  
axis([0 90 10 30]);
title('(b) \itN_t\rm\bf = 2 with SBC');
xlabel('Inclination angle (\circ)','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
ylabel('SINR fluctuation (dB)','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
% set(gca,'XTick', [0 90 180 270 360]);
legend('\itN_r\rm\bf = 3','\itN_r\rm\bf = 4','\itN_r\rm\bf = 5','\itN_r\rm\bf = 6','location','best')
set(gca,'FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gca,'linewidth',1.5); 
set(gca,'ticklength',[0.02;0.025]);
set(gcf,'Color',[1,1,1]);
set(h2,'MarkerSize',8,'linewidth',2)

subplot(2,3,3)
h3 = plot(angle_incl,sinr_MRC_fluc2_3Rx,':k',angle_incl,sinr_MRC_fluc2_4Rx,'--g',...
    angle_incl,sinr_MRC_fluc2_5Rx,'-.b',angle_incl,sinr_MRC_fluc2_6Rx,'-r');  
axis([0 90 10 30]);
title('(c) \itN_t\rm\bf = 2 with MRC');
xlabel('Inclination angle (\circ)','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
ylabel('SINR fluctuation (dB)','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
% set(gca,'XTick', [0 90 180 270 360]);
legend('\itN_r\rm\bf = 3','\itN_r\rm\bf = 4','\itN_r\rm\bf = 5','\itN_r\rm\bf = 6','location','best')
set(gca,'FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gca,'linewidth',1.5); 
set(gca,'ticklength',[0.02;0.025]);
set(gcf,'Color',[1,1,1]);
set(h3,'MarkerSize',8,'linewidth',2)

subplot(2,3,4)
h4 = plot(angle_incl,sinr_EGC_fluc4_3Rx,':k',angle_incl,sinr_EGC_fluc4_4Rx,'--g',...
    angle_incl,sinr_EGC_fluc4_5Rx,'-.b',angle_incl,sinr_EGC_fluc4_6Rx,'-r');  
axis([0 90 20 45]);
title('(d) \itN_t\rm\bf = 4 with EGC');
xlabel('Inclination angle (\circ)','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
ylabel('SINR fluctuation (dB)','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
% set(gca,'XTick', [0 90 180 270 360]);
legend('\itN_r\rm\bf = 3','\itN_r\rm\bf = 4','\itN_r\rm\bf = 5','\itN_r\rm\bf = 6','location','best')
set(gca,'FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gca,'linewidth',1.5); 
set(gca,'ticklength',[0.02;0.025]);
set(gcf,'Color',[1,1,1]);
set(h4,'MarkerSize',8,'linewidth',2)

subplot(2,3,5)
h5 = plot(angle_incl,sinr_SBC_fluc4_3Rx,':k',angle_incl,sinr_SBC_fluc4_4Rx,'--g',...
    angle_incl,sinr_SBC_fluc4_5Rx,'-.b',angle_incl,sinr_SBC_fluc4_6Rx,'-r');  
axis([0 90 5 40]);
title('(e) \itN_t\rm\bf = 4 with SBC');
xlabel('Inclination angle (\circ)','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
ylabel('SINR fluctuation (dB)','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
% set(gca,'XTick', [0 90 180 270 360]);
legend('\itN_r\rm\bf = 3','\itN_r\rm\bf = 4','\itN_r\rm\bf = 5','\itN_r\rm\bf = 6','location','best')
set(gca,'FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gca,'linewidth',1.5); 
set(gca,'ticklength',[0.02;0.025]);
set(gcf,'Color',[1,1,1]);
set(h5,'MarkerSize',8,'linewidth',2)

subplot(2,3,6)
h6 = plot(angle_incl,sinr_MRC_fluc4_3Rx,':k',angle_incl,sinr_MRC_fluc4_4Rx,'--g',...
    angle_incl,sinr_MRC_fluc4_5Rx,'-.b',angle_incl,sinr_MRC_fluc4_6Rx,'-r');  
axis([0 90 5 40]);
title('(f) \itN_t\rm\bf = 4 with MRC');
xlabel('Inclination angle (\circ)','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
ylabel('SINR fluctuation (dB)','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
% set(gca,'XTick', [0 90 180 270 360]);
legend('\itN_r\rm\bf = 3','\itN_r\rm\bf = 4','\itN_r\rm\bf = 5','\itN_r\rm\bf = 6','location','best')
set(gca,'FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gca,'linewidth',1.5); 
set(gca,'ticklength',[0.02;0.025]);
set(gcf,'Color',[1,1,1]);
set(h6,'MarkerSize',8,'linewidth',2)

%% Minimum SINR fluctuation vs. Nr
Nr = [3 4 5 6];

% Nt = 2
sinr_SBC_min2_3Rx = min(sinr_SBC_fluc2_3Rx);
sinr_SBC_min2_4Rx = min(sinr_SBC_fluc2_4Rx);
sinr_SBC_min2_5Rx = min(sinr_SBC_fluc2_5Rx);
sinr_SBC_min2_6Rx = min(sinr_SBC_fluc2_6Rx);

sinr_SBC_min2 = [sinr_SBC_min2_3Rx sinr_SBC_min2_4Rx sinr_SBC_min2_5Rx sinr_SBC_min2_6Rx];

sinr_EGC_min2_3Rx = min(sinr_EGC_fluc2_3Rx);
sinr_EGC_min2_4Rx = min(sinr_EGC_fluc2_4Rx);
sinr_EGC_min2_5Rx = min(sinr_EGC_fluc2_5Rx);
sinr_EGC_min2_6Rx = min(sinr_EGC_fluc2_6Rx);

sinr_EGC_min2 = [sinr_EGC_min2_3Rx sinr_EGC_min2_4Rx sinr_EGC_min2_5Rx sinr_EGC_min2_6Rx];

sinr_MRC_min2_3Rx = min(sinr_MRC_fluc2_3Rx);
sinr_MRC_min2_4Rx = min(sinr_MRC_fluc2_4Rx);
sinr_MRC_min2_5Rx = min(sinr_MRC_fluc2_5Rx);
sinr_MRC_min2_6Rx = min(sinr_MRC_fluc2_6Rx);

sinr_MRC_min2 = [sinr_MRC_min2_3Rx sinr_MRC_min2_4Rx sinr_MRC_min2_5Rx sinr_MRC_min2_6Rx];

% Nt = 4
sinr_SBC_min4_3Rx = min(sinr_SBC_fluc4_3Rx);
sinr_SBC_min4_4Rx = min(sinr_SBC_fluc4_4Rx);
sinr_SBC_min4_5Rx = min(sinr_SBC_fluc4_5Rx);
sinr_SBC_min4_6Rx = min(sinr_SBC_fluc4_6Rx);

sinr_SBC_min4 = [sinr_SBC_min4_3Rx sinr_SBC_min4_4Rx sinr_SBC_min4_5Rx sinr_SBC_min4_6Rx];

sinr_EGC_min4_3Rx = min(sinr_EGC_fluc4_3Rx);
sinr_EGC_min4_4Rx = min(sinr_EGC_fluc4_4Rx);
sinr_EGC_min4_5Rx = min(sinr_EGC_fluc4_5Rx);
sinr_EGC_min4_6Rx = min(sinr_EGC_fluc4_6Rx);

sinr_EGC_min4 = [sinr_EGC_min4_3Rx sinr_EGC_min4_4Rx sinr_EGC_min4_5Rx sinr_EGC_min4_6Rx];

sinr_MRC_min4_3Rx = min(sinr_MRC_fluc4_3Rx);
sinr_MRC_min4_4Rx = min(sinr_MRC_fluc4_4Rx);
sinr_MRC_min4_5Rx = min(sinr_MRC_fluc4_5Rx);
sinr_MRC_min4_6Rx = min(sinr_MRC_fluc4_6Rx);

sinr_MRC_min4 = [sinr_MRC_min4_3Rx sinr_MRC_min4_4Rx sinr_MRC_min4_5Rx sinr_MRC_min4_6Rx];

figure(2)
subplot(1,2,1)
h7 = plot(Nr,sinr_EGC_min2,':gv',Nr,sinr_SBC_min2,'--bs',Nr,sinr_MRC_min2,'-ro');  
axis([3 6 10 25]);
title('(a) \itN_t\rm\bf = 2');
xlabel('Number of detectors, \itN_r','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
ylabel('Minimum SINR fluctuation (dB)','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
% set(gca,'XTick', [0 90 180 270 360]);
legend('EGC','SBC','MRC','location','best')
set(gca,'FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gca,'linewidth',1.5); 
set(gca,'ticklength',[0.02;0.025]);
set(gcf,'Color',[1,1,1]);
set(h7,'MarkerSize',8,'linewidth',2)

subplot(1,2,2)
h8 = plot(Nr,sinr_EGC_min4,':gv',Nr,sinr_SBC_min4,'--bs',Nr,sinr_MRC_min4,'-ro');  
axis([3 6 5 30]);
title('(b) \itN_t\rm\bf = 4');
xlabel('Number of detectors, \itN_r','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
ylabel('Minimum SINR fluctuation (dB)','FontName','Times New Roman','FontSize',24,'FontWeight','bold');
% set(gca,'XTick', [0 90 180 270 360]);
legend('EGC','SBC','MRC','location','best')
set(gca,'FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gca,'linewidth',1.5); 
set(gca,'ticklength',[0.02;0.025]);
set(gcf,'Color',[1,1,1]);
set(h8,'MarkerSize',8,'linewidth',2)

%% SINR distribution
% Room dimension
Room_length = 5; % room length (m)
Room_width = 5; % Room width (m)
Room_height = 3; % Room height (m)
desktop = 0.85; % desktop height (m)

% LED characteristics
BW = 10*10^6; % mod BW, Hz
MI = 0.3; % mod index
Pt = 10; % TOP, W
gap = 5*10^(-3); % gap between top detector and adjacent side detectors, m
a_dete = 3.6*10^(-3); % side length of the square detector, m
FOV_LED = 60; % Half-angle FOV, deg

% PD characteristics
RP = 0.53; % Responsivity of photo-detector, A/W

angle_rota4 = 0:1:120; % Random rotation angle
angle_rota6 = 0:1:72; % Random rotation angle

% Distribution grid
delta = 0.1;
xr = 0:delta:5; % x direction (m)
yr = 0:delta:5; % y direction (m)
zr = desktop;


%% Nt = 4
xt1_4 = 1.25; yt1_4 = 1.25; zt1_4 = Room_height; % LED 1
xt2_4 = 1.25; yt2_4 = 3.75; zt2_4 = Room_height; % LED 2
xt3_4 = 3.75; yt3_4 = 3.75; zt3_4 = Room_height; % LED 3
xt4_4 = 3.75; yt4_4 = 1.25; zt4_4 = Room_height; % LED 4

Xt_4 = [xt1_4 xt2_4 xt3_4 xt4_4];
Yt_4 = [yt1_4 yt2_4 yt3_4 yt4_4];
Zt_4 = [zt1_4 zt2_4 zt3_4 zt4_4];

FOV_dete_4 = 45; % Half-angle FOV, deg

% SER
for i = 1:length(xr)
    for j = 1:length(yr)
        
        sinr_4Tx_1Rx(i,j) = get_sinr_1Rx(Xt_4,Yt_4,Zt_4,xr(i),yr(j),zr,FOV_dete_4);
    end 
end

SINR_4Tx_1Rx = 10*log10(sinr_4Tx_1Rx);
SINR_fluc_4Tx_1Rx = max(max(SINR_4Tx_1Rx)) - min(min(SINR_4Tx_1Rx));

% % Nr = 4 
% for i = 1:length(xr)
%     for j = 1:length(yr)
%         for k = 1:length(angle_rota4)
%             [sinr_SBC_4Tx_4Rx(i,j,k),xsinr_EGC_4Tx_4Rx(i,j,k),xsinr_MRC_4Tx_4Rx(i,j,k)] = ...
%                 get_sinr_4Rx(Xt_4,Yt_4,Zt_4,xr(i),yr(j),zr,FOV_dete_4,51,angle_rota4(k));   
%         end
%     end
% end
% 
% sinr_SBC_4Tx_4Rx_av = mean(sinr_SBC_4Tx_4Rx,3);
% SINR_SBC_4Tx_4Rx_av = 10*log10(sinr_SBC_4Tx_4Rx_av);

% Nr = 6 
for i = 1:length(xr)
    for j = 1:length(yr)
        for k = 1:length(angle_rota6)
            [sinr_SBC_4Tx_6Rx(i,j,k),xsinr_EGC_4Tx_6Rx(i,j,k),xsinr_MRC_4Tx_6Rx(i,j,k)] = ...
                get_sinr_6Rx(Xt_4,Yt_4,Zt_4,xr(i),yr(j),zr,FOV_dete_4,45,angle_rota6(k));   
        end
    end
end

sinr_SBC_4Tx_6Rx_av = mean(sinr_SBC_4Tx_6Rx,3);
SINR_SBC_4Tx_6Rx_av = 10*log10(sinr_SBC_4Tx_6Rx_av);

% Nr = 6 
for i = 1:length(xr)
    for j = 1:length(yr)
        for k = 1:length(angle_rota6)
            [sinr_SBC_4Tx_6Rx_opt(i,j,k),xsinr_EGC_4Tx_6Rx(i,j,k),xsinr_MRC_4Tx_6Rx(i,j,k)] = ...
                get_sinr_6Rx(Xt_4,Yt_4,Zt_4,xr(i),yr(j),zr,FOV_dete_4,51,angle_rota6(k));   
        end
    end
end

sinr_SBC_4Tx_6Rx_opt_av = mean(sinr_SBC_4Tx_6Rx_opt,3);
SINR_SBC_4Tx_6Rx_opt_av = 10*log10(sinr_SBC_4Tx_6Rx_opt_av);

figure(3)
subplot(2,3,1)
[x1,y1] = meshgrid(0:delta:Room_length,0:delta:Room_width);
surf(x1,y1,SINR_2Tx_1Rx);
axis([0 5 0 5 -5 35]);
title('(a) \itN_t\rm\bf = 2, SER');
xlabel('X (m)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
ylabel('Y (m)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
zlabel('SINR (dB)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gca,'XTick', [0 1 2 3 4 5]);
set(gca,'YTick', [0 1 2 3 4 5]);
set(gca,'FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gcf,'Color',[1,1,1]);
set(gca,'linewidth',1.0); 
set(gca,'FontSize',16);
hclrbar1 = colorbar;
set(hclrbar1,'FontName','Times New Roman','FontSize',16,'FontWeight','bold','linewidth',1.0);

subplot(2,3,2)
[x2,y2] = meshgrid(0:delta:Room_length,0:delta:Room_width);
surf(x2,y2,SINR_SBC_2Tx_6Rx_av);
axis([0 5 0 5 -5 35]);
title('(b) \itN_t\rm\bf = 2, ADR with \itN_r\rm\bf = 4 and SBC');
xlabel('X (m)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
ylabel('Y (m)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
zlabel('Average SINR (dB)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gca,'XTick', [0 1 2 3 4 5]);
set(gca,'YTick', [0 1 2 3 4 5]);
set(gca,'FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gcf,'Color',[1,1,1]);
set(gca,'linewidth',1.0); 
set(gca,'FontSize',16);
hclrbar2 = colorbar;
set(hclrbar2,'FontName','Times New Roman','FontSize',16,'FontWeight','bold','linewidth',1.0);

subplot(2,3,3)
[x3,y3] = meshgrid(0:delta:Room_length,0:delta:Room_width);
surf(x3,y3,SINR_SBC_2Tx_6Rx_opt_av);
axis([0 5 0 5 -5 35]);
title('(c) \itN_t\rm\bf = 2, ADR with \itN_r\rm\bf = 6 and SBC');
xlabel('X (m)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
ylabel('Y (m)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
zlabel('Average SINR (dB)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gca,'XTick', [0 1 2 3 4 5]);
set(gca,'YTick', [0 1 2 3 4 5]);
set(gca,'FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gcf,'Color',[1,1,1]);
set(gca,'linewidth',1.0); 
set(gca,'FontSize',16);
hclrbar2 = colorbar;
set(hclrbar2,'FontName','Times New Roman','FontSize',16,'FontWeight','bold','linewidth',1.0);

subplot(2,3,4)
[x4,y4] = meshgrid(0:delta:Room_length,0:delta:Room_width);
surf(x4,y4,SINR_4Tx_1Rx);
axis([0 5 0 5 -5 40]);
title('(d) \itN_t\rm\bf = 4, SER');
xlabel('X (m)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
ylabel('Y (m)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
zlabel('SINR (dB)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gca,'XTick', [0 1 2 3 4 5]);
set(gca,'YTick', [0 1 2 3 4 5]);
set(gca,'FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gcf,'Color',[1,1,1]);
set(gca,'linewidth',1.0); 
set(gca,'FontSize',16);
hclrbar1 = colorbar;
set(hclrbar1,'FontName','Times New Roman','FontSize',16,'FontWeight','bold','linewidth',1.0);

subplot(2,3,5)
[x5,y5] = meshgrid(0:delta:Room_length,0:delta:Room_width);
surf(x5,y5,SINR_SBC_4Tx_6Rx_av);
axis([0 5 0 5 -5 40]);
title('(e) \itN_t\rm\bf = 4, ADR with \itN_r\rm\bf = 4 and SBC');
xlabel('X (m)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
ylabel('Y (m)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
zlabel('SINR (dB)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gca,'XTick', [0 1 2 3 4 5]);
set(gca,'YTick', [0 1 2 3 4 5]);
set(gca,'FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gcf,'Color',[1,1,1]);
set(gca,'linewidth',1.0); 
set(gca,'FontSize',16);
hclrbar1 = colorbar;
set(hclrbar1,'FontName','Times New Roman','FontSize',16,'FontWeight','bold','linewidth',1.0);

subplot(2,3,6)
[x6,y6] = meshgrid(0:delta:Room_length,0:delta:Room_width);
surf(x6,y6,SINR_SBC_4Tx_6Rx_opt_av);
axis([0 5 0 5 -5 40]);
title('(f) \itN_t\rm\bf = 4, ADR with \itN_r\rm\bf = 6 and SBC');
xlabel('X (m)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
ylabel('Y (m)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
zlabel('SINR (dB)','FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gca,'XTick', [0 1 2 3 4 5]);
set(gca,'YTick', [0 1 2 3 4 5]);
set(gca,'FontName','Times New Roman','FontSize',16,'FontWeight','bold');
set(gcf,'Color',[1,1,1]);
set(gca,'linewidth',1.0); 
set(gca,'FontSize',16);
hclrbar1 = colorbar;
set(hclrbar1,'FontName','Times New Roman','FontSize',16,'FontWeight','bold','linewidth',1.0);
