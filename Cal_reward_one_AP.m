clear all;close all;clc;

% TTT_LV = [0.0 0.04 0.064 0.08 0.1 0.128 0.16 0.256 0.32 0.48 0.512 0.64 1.024 1.28 2.56 5.12];
% TTT_VL = TTT_LV;
Tex = 0.8;

%% User and VLC APs location
% VLC APs location
VLC1_loc = [0 0 2.4];

UE_speed_count = 1;
% UE moving speed is 1 m/s
for UE_speed = [0.5 1 1.5 2]
% SINR report interval 10 ms
SINR_report_interval = 0.01;
% Candidate UE positions
UE_loc = [];
UE_loc(:,1) = -2.3:UE_speed*SINR_report_interval:2.3;
UE_loc(:,2) = repmat(0,length(UE_loc),1);
UE_loc(:,3) = repmat(1,length(UE_loc),1);

%% VLC AP parameters
% semi-angle at half power
theta = 60;
% Lambertian order of emission
ml = -log10(2)/log10(cosd(theta));
% transmitted optical power by a VLC AP
P_VLC_AP = 1;
% detector physical area of a PD
Adet = 1e-4;
% gain of an optical filter; ignore if no filter is used
Ts = 1;
% refractive index of  a lens at a PD; ignore if no lens is used
index = 1.5;
% FOV of a receiver
FOV = 90;
% gain of an optical concentrator; ignore if no lens is used
G_Con = (index^2)/(sind(FOV).^2);
% O/E conversion efficiency
OE_eff = 0.53;

%% LTE and VLC bandwidth & LTE SINR
% LTE and VLC bandwidth are both 20 MHz
W_L = 30e6;
W_V = 20e6;
% LTE SINR is 20 dB
LTE_SINR = 20;

%% Calculate the RSS
% Noise in unit A^2
Noise = 4.7e-14;

% Distance between VLC AP and UE
VLC1_D = sqrt((VLC1_loc(1)-UE_loc(:,1)).^2+(VLC1_loc(2)-UE_loc(:,2)).^2+(VLC1_loc(3)-UE_loc(:,3)).^2);

VLC1_cosphi = (VLC1_loc(3)-UE_loc(:,3))./VLC1_D;
% Channel gains of VLC APs
VLC1_H = (ml+1)*Adet.*VLC1_cosphi.^(ml)./(2*pi.*VLC1_D.^2).*VLC1_cosphi;
% RSS values
VLC1_RSS = P_VLC_AP.*VLC1_H;
% Signal-to-noise ratio values
VLC1_SNR = 10.*log10((VLC1_RSS.*OE_eff).^2./Noise);


k = 1;
for TTT_LV = [0.0 0.04 0.06 0.08 0.1 0.12 0.16 0.25 0.32 0.48 0.51 0.64 1.02 1.28 2.56 5.12]
    TTT_VL =0;
% conn = 0 for LTE and conn = 1 for VLC
conn = 0;
i = 1;
count_LV = TTT_LV/0.01;
count_VL = TTT_VL/0.01;
T = zeros(length(VLC1_SNR),1);
while i <= length(VLC1_SNR)
    if conn == 0 && VLC1_SNR(i) < 10
        T(i) = W_L*log2(1+10^(LTE_SINR/10));
        count_LV = TTT_LV/0.01;
        i = i + 1;
    elseif conn == 0 && VLC1_SNR(i) >= 10 && count_LV > 0
        T(i) = W_L*log2(1+10^(LTE_SINR/10));
        count_LV = count_LV - 1;
        i = i + 1;
    elseif conn == 0 && VLC1_SNR(i) >= 10 && count_LV == 0
        T(i:i+Tex/0.01) = 0;
        count_LV = TTT_LV/0.01;
        conn = 1;
        i = i + Tex/0.01;     
    elseif conn == 1 && VLC1_SNR(i) >= 10
        T(i) = W_V*log2(1+10^(VLC1_SNR(i)/10));
        count_VL = TTT_VL/0.01;
        i = i + 1;
    elseif conn == 1 && VLC1_SNR(i) < 10 && count_VL > 0
        T(i) = W_V*log2(1+10^(VLC1_SNR(i)/10)); 
        count_VL = count_VL - 1;
        i = i + 1;
    elseif conn == 1 && VLC1_SNR(i) < 10 && count_VL == 0
        T(i:i+Tex/0.01) = 0; 
        count_VL = TTT_VL/0.01;
        conn = 0;
        i = i + Tex/0.01;
    else disp('ERROR');
    end
end
Throughput(UE_speed_count,k)=mean(T);
k = k + 1;
end
UE_speed_count = UE_speed_count + 1;
end
figure
hold on
plot(1:16,Throughput(1,:)./1e6);
plot(1:16,Throughput(2,:)./1e6);
plot(1:16,Throughput(3,:)./1e6);
plot(1:16,Throughput(4,:)./1e6);
legend('$v$ = 0.5 m/s','$v$ = 1 m/s','$v$ = 1.5 m/s','$v$ = 2 m/s');
xlabel('$TTT_{L-V}$ index (0 sec to 5.12 sec)');
ylabel('Average Throughput (Mbps)');
axis([1 16 -inf inf]);
hold off
grid on
box on

%figure
%plot(1:length(VLC1_SNR),VLC1_SNR)

Throughput_track_VLC = W_V.*log2(1+10.^(VLC1_SNR./10));
Throughput_track_LTE = repmat(W_L.*log2(1+10.^(LTE_SINR./10)),length(VLC1_SNR),1);
% figure
% hold on
% plot(1:length(VLC1_SNR),Throughput_track_VLC);
% plot(1:length(VLC1_SNR),Throughput_track_LTE);
% hold off
