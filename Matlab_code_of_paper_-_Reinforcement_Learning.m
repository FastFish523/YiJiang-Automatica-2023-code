function []=VICTHinftyOORMAS()

clear all;
clc; 
close all;
global A B1 B2 B3 B4 D1 D2 D3 D4 K1 K2 K3 K4 q F E C R Q eflag ...
    X_trial1 X_trial2 X_trial3 X_trial4 X_trial5 mu1 mu2...
    Llearn1 Llearn2 Llearn3 Llearn4 gamma1 gamma2 gamma3 gamma4 ...
    T1 T2 T3 T4 S

A = [0 1;-1 -3];
B1 = [0;1];
B2 = [0;2];
B3 = [0;3];
B4 = [0;4];
D1 = [-1;1];
D2 = [-2;2];
D3 = [-3;3];
D4 = [-4;4];
T1 = eye(2);
T2 = 2*eye(2);
T3 = 3*eye(2);
T4 = 4*eye(2);
F = [-1,0];
E = [0 1;-1 0];
C = [1,0];
S = 1;
Q = eye(2);
R = 1;
K0 = [1,0];
K1 = [0,0];  
K2 = [0,0];  
K3 = [0,0];  
K4 = [0,0];

gamma1 = 5;
gamma2 = 5;
gamma3 = 5;
gamma4 = 5;

Llearn1 = [0,0];
Llearn2 = [0,0];
Llearn3 = [0,0];
Llearn4 = [0,0];

XUnull = null(kron(eye(2),[C,S]));

vecXU_trial2 = XUnull(:,1);
vecXU_trial3 = XUnull(:,2);
vecXU_trial4 = XUnull(:,3);
vecXU_trial5 = XUnull(:,4);

X_trial1 = [1,0;0,0];
X_trial2 = [vecXU_trial2(1),vecXU_trial2(4);vecXU_trial2(2),vecXU_trial2(5)];
X_trial3 = [vecXU_trial3(1),vecXU_trial3(4);vecXU_trial3(2),vecXU_trial3(5)];
X_trial4 = [vecXU_trial4(1),vecXU_trial4(4);vecXU_trial4(2),vecXU_trial4(5)];
X_trial5 = [vecXU_trial5(1),vecXU_trial5(4);vecXU_trial5(2),vecXU_trial5(5)];

U_trial1 = [0,0];
U_trial2 = [vecXU_trial2(3),vecXU_trial2(6)];
U_trial3 = [vecXU_trial3(3),vecXU_trial3(6)];
U_trial4 = [vecXU_trial4(3),vecXU_trial4(6)];
U_trial5 = [vecXU_trial5(3),vecXU_trial5(6)];

XU_trial1 = [X_trial1;U_trial1];
XU_trial2 = [X_trial2;U_trial2];
XU_trial3 = [X_trial3;U_trial3];
XU_trial4 = [X_trial4;U_trial4];
XU_trial5 = [X_trial5;U_trial5];

mu1 = 10;
mu2 = 10;

[Pstar1,l,g,t]=care(A,[B1 D1],Q,[R 0;0 -gamma1^2]);
Kstar1 = g(1,1:2);
Wstar1 = -g(2,1:2);
[Pstar2,l,g,t]=care(A,[B2 D2],Q,[R 0;0 -gamma2^2]);
Kstar2 = g(1,1:2);
Wstar2 = -g(2,1:2);
[Pstar3,l,g,t]=care(A,[B3 D3],Q,[R 0;0 -gamma3^2]);
Kstar3 = g(1,1:2);
Wstar3 = -g(2,1:2);
[Pstar4,l,g,t]=care(A,[B4 D4],Q,[R 0;0 -gamma4^2]);
Kstar4 = g(1,1:2);
Wstar4 = -g(2,1:2);

QQ1 = kron([eye(2),[0;0];[0,0,0]],E') - kron([A,B1;C,S],eye(2));
bb1 = [T1(:);F(:)];
vecXU1 = QQ1\bb1;
Xstar1 = [vecXU1(1) vecXU1(2); vecXU1(3) vecXU1(4)];
Ustar1 = [vecXU1(5) vecXU1(6)];
Lstar1 = Ustar1 + Kstar1*Xstar1;

% C*Xstar1 +S*Ustar1+ F
% Xstar1*E-A*Xstar1-B1*Ustar1 - T1

QQ2 = kron([eye(2),[0;0];[0,0,0]],E') - kron([A,B2;C,S],eye(2));
bb2 = [T2(:);F(:)];
vecXU2 = QQ2\bb2;
Xstar2 = [vecXU2(1) vecXU2(2); vecXU2(3) vecXU2(4)];
Ustar2 = [vecXU2(5) vecXU2(6)];
Lstar2 = Ustar2 + Kstar2*Xstar2;

% C*Xstar2 +S*Ustar2+ F
% Xstar2*E-A*Xstar2-B2*Ustar2 - T2

QQ3 = kron([eye(2),[0;0];[0,0,0]],E') - kron([A,B3;C,S],eye(2));
bb3 = [T3(:);F(:)];
vecXU3 = QQ3\bb3;
Xstar3 = [vecXU3(1) vecXU3(2); vecXU3(3) vecXU3(4)];
Ustar3 = [vecXU3(5) vecXU3(6)];
Lstar3 = Ustar3 + Kstar3*Xstar3;

% C*Xstar2 +S*Ustar2+ F
% Xstar2*E-A*Xstar2-B2*Ustar2 - T2

QQ4 = kron([eye(2),[0;0];[0,0,0]],E') - kron([A,B4;C,S],eye(2));
bb4 = [T4(:);F(:)];
vecXU4 = QQ4\bb4;
Xstar4 = [vecXU4(1) vecXU4(2); vecXU4(3) vecXU4(4)];
Ustar4 = [vecXU4(5) vecXU4(6)];
Lstar4 = Ustar4 + Kstar4*Xstar4;

% C*Xstar2 +S*Ustar2+ F
% Xstar2*E-A*Xstar2-B2*Ustar2 - T2

Time = [];

v = [];
v0 = [1;1];
x1 = [];
x2 = [];
x3 = [];
x4 = [];
u1 = [];
u2 = [];
u3 = [];
u4 = [];
x10 = [1;1];
x20 = [1;1];
x30 = [1;1];
x40 = [1;1];
eta1 = [];
eta2 = []; 
eta3 = []; 
eta4 = [];
eta10 = [0;0];
eta20 = [0;0]; 
eta30 = [0;0]; 
eta40 = [0;0];
obE1 = [];
obE2 = []; 
obE3 = []; 
obE4 = [];
obE10 = [0;0;0;0];
obE20 = [0;0;0;0]; 
obE30 = [0;0;0;0]; 
obE40 = [0;0;0;0];

eflag = 1;
p1covergenveflag = 0;
p2covergenveflag = 0;
p3covergenveflag = 0;
p4covergenveflag = 0;

% C*Xstar1 + F
% Xstar1*E-A*Xstar1-B1*Ustar1

Dxx1=[];XX1=[];XU1=[];WX1=[];VX1=[]; 
Dxx2=[];XX2=[];XU2=[];WX2=[];VX2=[]; 
Dxx3=[];XX3=[];XU3=[];WX3=[];VX3=[];  
Dxx4=[];XX4=[];XU4=[];WX4=[];VX4=[]; 

Dxx11=[];XX11=[];XU11=[];WX11=[];VX11=[];
Dxx12=[];XX12=[];XU12=[];WX12=[];VX12=[];
Dxx13=[];XX13=[];XU13=[];WX13=[];VX13=[];
Dxx14=[];XX14=[];XU14=[];WX14=[];VX14=[];
Dxx15=[];XX15=[];XU15=[];WX15=[];VX15=[];

Dxx21=[];XX21=[];XU21=[];WX21=[];VX21=[];
Dxx22=[];XX22=[];XU22=[];WX22=[];VX22=[];
Dxx23=[];XX23=[];XU23=[];WX23=[];VX23=[];
Dxx24=[];XX24=[];XU24=[];WX24=[];VX24=[];
Dxx25=[];XX25=[];XU25=[];WX25=[];VX25=[];

Dxx31=[];XX31=[];XU31=[];WX31=[];VX31=[];
Dxx32=[];XX32=[];XU32=[];WX32=[];VX32=[];
Dxx33=[];XX33=[];XU33=[];WX33=[];VX33=[];
Dxx34=[];XX34=[];XU34=[];WX34=[];VX34=[];
Dxx35=[];XX35=[];XU35=[];WX35=[];VX35=[];

Dxx41=[];XX41=[];XU41=[];WX41=[];VX41=[];
Dxx42=[];XX42=[];XU42=[];WX42=[];VX42=[];
Dxx43=[];XX43=[];XU43=[];WX43=[];VX43=[];
Dxx44=[];XX44=[];XU44=[];WX44=[];VX44=[];
Dxx45=[];XX45=[];XU45=[];WX45=[];VX45=[];


N=120; % total time
T=0.5;  % length of each learning time interval
Step=1000; %number of iteration
P0 = zeros(2);
q = 1;
Pk1 = P0;
Pk2 = P0;
Pk3 = P0;
Pk4 = P0;
deltaNormP1 = [];
deltaNormP2 = [];
deltaNormP3 = [];
deltaNormP4 = [];
NormP1 = [];
NormP2 = [];
NormP3 = [];
NormP4 = [];
bar_epsilon = 1e-2;

for i=1:N
   
    [t,X]=ode45(@myMAS,[(i-1)*T,i*T],...
        [v0;obE10;obE20;obE30;obE40;eta10;eta20;eta30;eta40;...
        x10;zeros(8+12*3,1);x20;zeros(8+12*3,1);...
        x30;zeros(8+12*3,1);x40;zeros(8+12*3,1);zeros(16+12*8,1)]);   
    
    x10 = X(end,27:28)'; 
    x20 = X(end,28+44+1:28+44+2)'; 
    x30 = X(end,28+2*44+1+2:28+2*44+2+2)'; 
    x40 = X(end,28+3*44+1+4:28+3*44+2+4)'; 
    v0 = X(end,1:2)'; 
    obE10 = X(end,3:6)'; 
    obE20 = X(end,7:10)'; 
    obE30 = X(end,11:14)'; 
    obE40 = X(end,15:18)';
    eta10 = X(end,19:20)'; 
    eta20 = X(end,21:22)'; 
    eta30 = X(end,23:24)'; 
    eta40 = X(end,25:26)';
    v = [v;X(:,1:2)];
    x1 = [x1;X(:,27:28)];
    x2 = [x2;X(:,73:74)];
    x3 = [x3;X(:,119:120)];
    x4 = [x4;X(:,165:166)];
    obE1 = [obE1;X(:,3:6)]; 
    obE2 = [obE2;X(:,7:10)]; 
    obE3 = [obE3;X(:,11:14)]; 
    obE4 = [obE4;X(:,15:18)];
    eta1 = [eta1;X(:,19:20)]; 
    eta2 = [eta2;X(:,21:22)]; 
    eta3 = [eta3;X(:,23:24)]; 
    eta4 = [eta4;X(:,25:26)];
    
    Time=[Time;t];
    
    if i>10&&i<30
        
        %1
        Dxx1=[Dxx1;kron(X(end,27:28),X(end,27:28))-...
            kron(X(1,27:28),X(1,27:28))];
        XX1=[XX1;X(end,29:32)-X(1,29:32)];
        XU1=[XU1;X(end,33:34)-X(1,33:34)];
        WX1=[WX1;X(end,35:36)-X(1,35:36)];
        VX1=[VX1;X(end,211:214)-X(1,211:214)];
        
        E_cur=(X(end,27:28)-X(end,19:20)*X_trial1');
        E_pre=(X(1,27:28)-X(1,19:20)*X_trial1');
        Dxx11=[Dxx11;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX11=[XX11;X(end,37:40)-X(1,37:40)];
        XU11=[XU11;X(end,41:42)-X(1,41:42)];
        WX11=[WX11;X(end,43:44)-X(1,43:44)];
        VX11=[VX11;X(end,45:48)-X(1,45:48)];
        
        E_cur=(X(end,27:28)-X(end,19:20)*X_trial2');
        E_pre=(X(1,27:28)-X(1,19:20)*X_trial2');
        Dxx12=[Dxx12;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX12=[XX12;X(end,49:52)-X(1,49:52)];
        XU12=[XU12;X(end,53:54)-X(1,53:54)];
        WX12=[WX12;X(end,55:56)-X(1,55:56)];
        VX12=[VX12;X(end,57:60)-X(1,57:60)];
        
        E_cur=(X(end,27:28)-X(end,19:20)*X_trial3');
        E_pre=(X(1,27:28)-X(1,19:20)*X_trial3');
        Dxx13=[Dxx13;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX13=[XX13;X(end,61:64)-X(1,61:64)];
        XU13=[XU13;X(end,65:66)-X(1,65:66)];
        WX13=[WX13;X(end,67:68)-X(1,67:68)];
        VX13=[VX13;X(end,69:72)-X(1,69:72)];
        
        E_cur=(X(end,27:28)-X(end,19:20)*X_trial4');
        E_pre=(X(1,27:28)-X(1,19:20)*X_trial4');
        Dxx14=[Dxx14;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX14=[XX14;X(end,227:230)-X(1,227:230)];
        XU14=[XU14;X(end,231:232)-X(1,231:232)];
        WX14=[WX14;X(end,233:234)-X(1,233:234)];
        VX14=[VX14;X(end,235:238)-X(1,235:238)];
        
        E_cur=(X(end,27:28)-X(end,19:20)*X_trial5');
        E_pre=(X(1,27:28)-X(1,19:20)*X_trial5');
        Dxx15=[Dxx15;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX15=[XX15;X(end,239:242)-X(1,239:242)];
        XU15=[XU15;X(end,243:244)-X(1,243:244)];
        WX15=[WX15;X(end,245:246)-X(1,245:246)];
        VX15=[VX15;X(end,247:250)-X(1,247:250)];
        
        %2
        Dxx2=[Dxx2;kron(X(end,73:74),X(end,73:74))-...
            kron(X(1,73:74),X(1,73:74))];
        XX2=[XX2;X(end,75:78)-X(1,75:78)];
        XU2=[XU2;X(end,79:80)-X(1,79:80)];
        WX2=[WX2;X(end,81:82)-X(1,81:82)];
        VX2=[VX2;X(end,215:218)-X(1,215:218)];
        
        E_cur=(X(end,73:74)-X(end,21:22)*X_trial1');
        E_pre=(X(1,73:74)-X(1,21:22)*X_trial1');
        Dxx21=[Dxx21;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX21=[XX21;X(end,83:86)-X(1,83:86)];
        XU21=[XU21;X(end,87:88)-X(1,87:88)];
        WX21=[WX21;X(end,89:90)-X(1,89:90)];
        VX21=[VX21;X(end,91:94)-X(1,91:94)];
        
        E_cur=(X(end,73:74)-X(end,21:22)*X_trial2');
        E_pre=(X(1,73:74)-X(1,21:22)*X_trial2');
        Dxx22=[Dxx22;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX22=[XX22;X(end,95:98)-X(1,95:98)];
        XU22=[XU22;X(end,99:100)-X(1,99:100)];
        WX22=[WX22;X(end,101:102)-X(1,101:102)];
        VX22=[VX22;X(end,103:106)-X(1,103:106)];
        
        E_cur=(X(end,73:74)-X(end,21:22)*X_trial3');
        E_pre=(X(1,73:74)-X(1,21:22)*X_trial3');
        Dxx23=[Dxx23;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX23=[XX23;X(end,107:110)-X(1,107:110)];
        XU23=[XU23;X(end,111:112)-X(1,111:112)];
        WX23=[WX23;X(end,113:114)-X(1,113:114)];
        VX23=[VX23;X(end,115:118)-X(1,115:118)];
        
        E_cur=(X(end,73:74)-X(end,21:22)*X_trial4');
        E_pre=(X(1,73:74)-X(1,21:22)*X_trial4');
        Dxx24=[Dxx24;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX24=[XX24;X(end,251:254)-X(1,251:254)];
        XU24=[XU24;X(end,255:256)-X(1,255:256)];
        WX24=[WX24;X(end,257:258)-X(1,257:258)];
        VX24=[VX24;X(end,259:262)-X(1,259:262)];
        
        E_cur=(X(end,73:74)-X(end,21:22)*X_trial5');
        E_pre=(X(1,73:74)-X(1,21:22)*X_trial5');
        Dxx25=[Dxx25;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX25=[XX25;X(end,263:266)-X(1,263:266)];
        XU25=[XU25;X(end,267:268)-X(1,267:268)];
        WX25=[WX25;X(end,269:270)-X(1,269:270)];
        VX25=[VX25;X(end,271:274)-X(1,271:274)];
        
        %3
        Dxx3=[Dxx3;kron(X(end,119:120),X(end,119:120))-...
            kron(X(1,119:120),X(1,119:120))];
        XX3=[XX3;X(end,121:124)-X(1,121:124)];
        XU3=[XU3;X(end,125:126)-X(1,125:126)];
        WX3=[WX3;X(end,127:128)-X(1,127:128)];
        VX3=[VX3;X(end,219:222)-X(1,219:222)];
        
        E_cur=(X(end,119:120)-X(end,23:24)*X_trial1');
        E_pre=(X(1,119:120)-X(1,23:24)*X_trial1');
        Dxx31=[Dxx31;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX31=[XX31;X(end,129:132)-X(1,129:132)];
        XU31=[XU31;X(end,133:134)-X(1,133:134)];
        WX31=[WX31;X(end,135:136)-X(1,135:136)];
        VX31=[VX31;X(end,137:140)-X(1,137:140)];
        
        E_cur=(X(end,119:120)-X(end,23:24)*X_trial2');
        E_pre=(X(1,119:120)-X(1,23:24)*X_trial2');
        Dxx32=[Dxx32;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX32=[XX32;X(end,141:144)-X(1,141:144)];
        XU32=[XU32;X(end,145:146)-X(1,145:146)];
        WX32=[WX32;X(end,147:148)-X(1,147:148)];
        VX32=[VX32;X(end,149:152)-X(1,149:152)];
        
        E_cur=(X(end,119:120)-X(end,23:24)*X_trial3');
        E_pre=(X(1,119:120)-X(1,23:24)*X_trial3');
        Dxx33=[Dxx33;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX33=[XX33;X(end,153:156)-X(1,153:156)];
        XU33=[XU33;X(end,157:158)-X(1,157:158)];
        WX33=[WX33;X(end,159:160)-X(1,159:160)];
        VX33=[VX33;X(end,161:164)-X(1,161:164)];
        
        E_cur=(X(end,119:120)-X(end,23:24)*X_trial4');
        E_pre=(X(1,119:120)-X(1,23:24)*X_trial4');
        Dxx34=[Dxx34;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX34=[XX34;X(end,275:278)-X(1,275:278)];
        XU34=[XU34;X(end,279:280)-X(1,279:280)];
        WX34=[WX34;X(end,281:282)-X(1,281:282)];
        VX34=[VX34;X(end,283:286)-X(1,283:286)];
        
        E_cur=(X(end,119:120)-X(end,23:24)*X_trial5');
        E_pre=(X(1,119:120)-X(1,23:24)*X_trial5');
        Dxx35=[Dxx35;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX35=[XX35;X(end,287:290)-X(1,287:290)];
        XU35=[XU35;X(end,291:292)-X(1,291:292)];
        WX35=[WX35;X(end,293:294)-X(1,293:294)];
        VX35=[VX35;X(end,295:298)-X(1,295:298)];
        
        %4
        Dxx4=[Dxx4;kron(X(end,165:166),X(end,165:166))-...
            kron(X(1,165:166),X(1,165:166))];
        XX4=[XX4;X(end,167:170)-X(1,167:170)];
        XU4=[XU4;X(end,171:172)-X(1,171:172)];
        WX4=[WX4;X(end,173:174)-X(1,173:174)];
        VX4=[VX4;X(end,223:226)-X(1,223:226)];
        
        E_cur=(X(end,165:166)-X(end,25:26)*X_trial1');
        E_pre=(X(1,165:166)-X(1,25:26)*X_trial1');
        Dxx41=[Dxx41;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX41=[XX41;X(end,175:178)-X(1,175:178)];
        XU41=[XU41;X(end,179:180)-X(1,179:180)];
        WX41=[WX41;X(end,181:182)-X(1,181:182)];
        VX41=[VX41;X(end,183:186)-X(1,183:186)];
        
        E_cur=(X(end,165:166)-X(end,25:26)*X_trial2');
        E_pre=(X(1,165:166)-X(1,25:26)*X_trial2');
        Dxx42=[Dxx42;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX42=[XX42;X(end,187:190)-X(1,187:190)];
        XU42=[XU42;X(end,191:192)-X(1,191:192)];
        WX42=[WX42;X(end,193:194)-X(1,193:194)];
        VX42=[VX42;X(end,195:198)-X(1,195:198)];
        
        E_cur=(X(end,165:166)-X(end,25:26)*X_trial3');
        E_pre=(X(1,165:166)-X(1,25:26)*X_trial3');
        Dxx43=[Dxx43;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX43=[XX43;X(end,199:202)-X(1,199:202)];
        XU43=[XU43;X(end,203:204)-X(1,203:204)];
        WX43=[WX43;X(end,205:206)-X(1,205:206)];
        VX43=[VX43;X(end,207:210)-X(1,207:210)];
        
        E_cur=(X(end,165:166)-X(end,25:26)*X_trial4');
        E_pre=(X(1,165:166)-X(1,25:26)*X_trial4');
        Dxx44=[Dxx44;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX44=[XX44;X(end,299:302)-X(1,299:302)];
        XU44=[XU44;X(end,303:304)-X(1,303:304)];
        WX44=[WX44;X(end,305:306)-X(1,305:306)];
        VX44=[VX44;X(end,307:310)-X(1,307:310)];
        
        E_cur=(X(end,165:166)-X(end,25:26)*X_trial5');
        E_pre=(X(1,165:166)-X(1,25:26)*X_trial5');
        Dxx45=[Dxx45;kron(E_cur,E_cur)-kron(E_pre,E_pre)];
        XX45=[XX45;X(end,311:314)-X(1,311:314)];
        XU45=[XU45;X(end,315:316)-X(1,315:316)];
        WX45=[WX45;X(end,317:318)-X(1,317:318)];
        VX45=[VX45;X(end,319:322)-X(1,319:322)];
        
    end
    
    if i == 30
        
        Dxx1=Dxx1(:,[1,2,4]);
        XX1 = XX1(:,[1,2,4]);
        Dxx2=Dxx2(:,[1,2,4]);
        XX2 = XX2(:,[1,2,4]);
        Dxx3=Dxx3(:,[1,2,4]);
        XX3 = XX3(:,[1,2,4]);
        Dxx4=Dxx4(:,[1,2,4]);
        XX4 = XX4(:,[1,2,4]);
        
        XX=[XX1,2*XU1,2*gamma1*gamma1*WX1,2*VX1];
        pXX = pinv(XX'*XX)*XX';
        for j=1:Step
            Y=Dxx1*[Pk1(1,1) 2*Pk1(1,2) Pk1(2,2)]';
            pp1=pXX*Y;
            K1 = pp1(4:5)';
            W1 = pp1(6:7)';
            H = [pp1(1) pp1(2)/2; pp1(2)/2 pp1(3)];
            DS1 = [pp1(8) pp1(10); pp1(9) pp1(11)];
            epsilonk = 2/(j);    
            Pk_1 = Pk1 + epsilonk * (H+Q-K1'*R*K1+gamma1*gamma1*W1'*W1);
            NormP1 = [NormP1; norm(Pk_1)];
            deltaNormP1 = [deltaNormP1; norm(Pk_1 - Pstar1)];
            if (norm(Pk_1)>= 30*(q+1))||(min(eig(Pk_1))<0)
                Pk_1 = P0;
                q = q+1;
            end
            if ((norm(Pk_1-Pk1)/epsilonk)<bar_epsilon)&&p1covergenveflag == 0 
                Pk1;
                p1covergenveflag = 1;
            end
            Pk1 = Pk_1;
        end
        
        q = 1;
        XX=[XX2,2*XU2,2*gamma2*gamma2*WX2,2*VX2];
        pXX = pinv(XX'*XX)*XX';
        for j=1:Step
            Y=Dxx2*[Pk2(1,1) 2*Pk2(1,2) Pk2(2,2)]';
            pp2=pXX*Y;
            K2 = pp2(4:5)';
            W2 = pp2(6:7)';
            H = [pp2(1) pp2(2)/2; pp2(2)/2 pp2(3)];
            DS2 = [pp2(8) pp2(10); pp2(9) pp2(11)];
            epsilonk = 2/(j);    
            Pk_2 = Pk2 + epsilonk * (H+Q-K2'*R*K2+gamma2*gamma2*W2'*W2);
            NormP2 = [NormP2; norm(Pk_2)];
            deltaNormP2 = [deltaNormP2; norm(Pk_2 - Pstar2)];
            if (norm(Pk_2)>= 30*(q+1))||(min(eig(Pk_2))<0)
                Pk_2 = P0;
                q = q+1;
            end
            if ((norm(Pk_2-Pk2)/epsilonk)<bar_epsilon)&&p2covergenveflag == 0
                Pk2;
                p2covergenveflag = 1;
            end
            Pk2 = Pk_2;
        end
        
        q = 1;
        XX=[XX3,2*XU3,2*gamma3*gamma3*WX3,2*VX3];
        pXX = pinv(XX'*XX)*XX';
        for j=1:Step
            Y=Dxx3*[Pk3(1,1) 2*Pk3(1,2) Pk3(2,2)]';
            pp3=pXX*Y;
            K3 = pp3(4:5)';
            W3 = pp3(6:7)';
            H = [pp3(1) pp3(2)/2; pp3(2)/2 pp3(3)];
            DS3 = [pp3(8) pp3(10); pp3(9) pp3(11)];
            epsilonk = 2/(j);    
            Pk_3 = Pk3 + epsilonk * (H+Q-K3'*R*K3+gamma3*gamma3*W3'*W3);
            NormP3 = [NormP3; norm(Pk_3)];
            deltaNormP3 = [deltaNormP3; norm(Pk_3 - Pstar3)];
            if (norm(Pk_3)>= 30*(q+1))||(min(eig(Pk_3))<0)
                Pk_3 = P0;
                q = q+1;
            end
            if ((norm(Pk_3-Pk3)/epsilonk)<bar_epsilon)&&p3covergenveflag == 0 
                Pk3;
                p3covergenveflag = 1;
            end
            Pk3 = Pk_3;
        end
        
        q = 1;
        XX=[XX4,2*XU4,2*gamma4*gamma4*WX4,2*VX4];
        pXX = pinv(XX'*XX)*XX';
        for j=1:Step
            Y=Dxx4*[Pk4(1,1) 2*Pk4(1,2) Pk4(2,2)]';
            pp4=pXX*Y;
            K4 = pp4(4:5)';
            W4 = pp4(6:7)';
            H = [pp4(1) pp4(2)/2; pp4(2)/2 pp4(3)];
            DS4 = [pp4(8) pp4(10); pp4(9) pp4(11)];
            epsilonk = 2/(j);    
            Pk_4 = Pk4 + epsilonk * (H+Q-K4'*R*K4+gamma4*gamma4*W4'*W4);
            NormP4 = [NormP4; norm(Pk_4)];
            deltaNormP4 = [deltaNormP4; norm(Pk_4 - Pstar4)];
            if (norm(Pk_4)>= 30*(q+1))||(min(eig(Pk_4))<0)
                Pk_4 = P0;
                q = q+1;
            end
            if ((norm(Pk_4-Pk4)/epsilonk)<bar_epsilon)&&p4covergenveflag == 0
                Pk4;
                p4covergenveflag = 1;
            end
            Pk4 = Pk_4;
        end
        
        newB1 = inv(Pk_1)*K1'*R;
        newB2 = inv(Pk_2)*K2'*R;
        newB3 = inv(Pk_3)*K3'*R;
        newB4 = inv(Pk_4)*K4'*R;
        
        newT1 = inv(Pk_1)*DS1;
        newT2 = inv(Pk_2)*DS2;
        newT3 = inv(Pk_3)*DS3;
        newT4 = inv(Pk_4)*DS4;
        
        Dxx11=Dxx11(:,[1,2,4]);
        XX11 = XX11(:,[1,2,4]);
        Dxx21=Dxx21(:,[1,2,4]);
        XX21 = XX21(:,[1,2,4]);
        Dxx31=Dxx31(:,[1,2,4]);
        XX31 = XX31(:,[1,2,4]);
        Dxx41=Dxx41(:,[1,2,4]);
        XX41 = XX41(:,[1,2,4]);
        
        Dxx12=Dxx12(:,[1,2,4]);
        XX12 = XX12(:,[1,2,4]);
        Dxx22=Dxx22(:,[1,2,4]);
        XX22 = XX22(:,[1,2,4]);
        Dxx32=Dxx32(:,[1,2,4]);
        XX32 = XX32(:,[1,2,4]);
        Dxx42=Dxx42(:,[1,2,4]);
        XX42 = XX42(:,[1,2,4]);
        
        Dxx13=Dxx13(:,[1,2,4]);
        XX13 = XX13(:,[1,2,4]);
        Dxx23=Dxx23(:,[1,2,4]);
        XX23 = XX23(:,[1,2,4]);
        Dxx33=Dxx33(:,[1,2,4]);
        XX33 = XX33(:,[1,2,4]);
        Dxx43=Dxx43(:,[1,2,4]);
        XX43 = XX43(:,[1,2,4]);
        
        Dxx14=Dxx14(:,[1,2,4]);
        XX14 = XX14(:,[1,2,4]);
        Dxx24=Dxx24(:,[1,2,4]);
        XX24 = XX24(:,[1,2,4]);
        Dxx34=Dxx34(:,[1,2,4]);
        XX34 = XX34(:,[1,2,4]);
        Dxx44=Dxx44(:,[1,2,4]);
        XX44 = XX44(:,[1,2,4]);
        
        Dxx15=Dxx15(:,[1,2,4]);
        XX15 = XX15(:,[1,2,4]);
        Dxx25=Dxx25(:,[1,2,4]);
        XX25 = XX25(:,[1,2,4]);
        Dxx35=Dxx35(:,[1,2,4]);
        XX35 = XX35(:,[1,2,4]);
        Dxx45=Dxx45(:,[1,2,4]);
        XX45 = XX45(:,[1,2,4]);

        %1
        Y1=Dxx11*[Pk1(1,1) 2*Pk1(1,2) Pk1(2,2)]'; 
        X1=[XX11,2*XU11,2*gamma1*gamma1*WX11,2*VX11];
        pp1=pinv(X1'*X1)*X1'*Y1;
        DS1 = [pp1(8) pp1(10); pp1(9) pp1(11)];
        newOmega1 = newT1 - inv(Pk1)*DS1;

        Y2=Dxx12*[Pk1(1,1) 2*Pk1(1,2) Pk1(2,2)]';
        X2=[XX12,2*XU12,2*gamma1*gamma1*WX12,2*VX12];
        pp2=pinv(X2'*X2)*X2'*Y2;
        DS2 = [pp2(8) pp2(10); pp2(9) pp2(11)];
        newOmega2 = newT1 - inv(Pk1)*DS2;

        Y3=Dxx13*[Pk1(1,1) 2*Pk1(1,2) Pk1(2,2)]';
        X3=[XX13,2*XU13,2*gamma1*gamma1*WX13,2*VX13];
        pp3=pinv(X3'*X3)*X3'*Y3;
        DS3 = [pp3(8) pp3(10); pp3(9) pp3(11)];
        newOmega3 = newT1 - inv(Pk1)*DS3;
        
        Y4=Dxx14*[Pk1(1,1) 2*Pk1(1,2) Pk1(2,2)]';
        X4=[XX14,2*XU14,2*gamma1*gamma1*WX14,2*VX14];
        pp4=pinv(X4'*X4)*X4'*Y4;
        DS4 = [pp4(8) pp4(10); pp4(9) pp4(11)];
        newOmega4 = newT1 - inv(Pk1)*DS4;
        
        Y5=Dxx15*[Pk1(1,1) 2*Pk1(1,2) Pk1(2,2)]';
        X5=[XX15,2*XU15,2*gamma1*gamma1*WX15,2*VX15];
        pp5=pinv(X5'*X5)*X5'*Y5;
        DS5 = [pp5(8) pp5(10); pp5(9) pp5(11)];
        newOmega5 = newT1 - inv(Pk1)*DS5;
        
        Lambda1 = newOmega2-newB1*U_trial2;
        Lambda2 = newOmega3-newB1*U_trial3;
        Lambda3 = newOmega4-newB1*U_trial4;
        Lambda4 = newOmega5-newB1*U_trial5;
        xi1 = inv(Pk1)*DS1+newB1*U_trial1;

        Lambda = [Lambda1(:),Lambda2(:),Lambda3(:),Lambda4(:),zeros(4,6);
            XU_trial2(:),XU_trial3(:),XU_trial4(:),XU_trial5(:),-eye(6)];
        xi = [xi1(:);-XU_trial1(:)];
        
        Lambda = [Lambda(5:10,:);Lambda(1:4,:)];
        xi = [xi(5:10);xi(1:4)];

        Pi = -Lambda(1:6,1:4)*inv(Lambda(7:10,1:4))*Lambda(7:10,5:10)+Lambda(1:6,5:10);
        Psi = -Lambda(1:6,1:4)*inv(Lambda(7:10,1:4))*xi(7:10)+xi(1:6);

        Qbar = eye(2);
        Rbar = 1;
        M = [kron(eye(2),Qbar),zeros(4,2);zeros(2,4),kron(eye(2),Rbar)];
        MMM = [2*M,kron(eye(1),Pi)';kron(eye(1),Pi),zeros(6,6)];
        XUsolution = inv(MMM)*[zeros(6,1);Psi];
        Xlearn1 = [XUsolution(1) XUsolution(4);XUsolution(2) XUsolution(5)];
        Ulearn1 = [XUsolution(3) XUsolution(6)];
        Llearn1 = Ulearn1 + K1*Xlearn1;
        
        %2
        Y1=Dxx21*[Pk2(1,1) 2*Pk2(1,2) Pk2(2,2)]'; 
        X1=[XX21,2*XU21,2*gamma2*gamma2*WX21,2*VX21];
        pp1=pinv(X1'*X1)*X1'*Y1;
        DS1 = [pp1(8) pp1(10); pp1(9) pp1(11)];
        newOmega1 = newT2 - inv(Pk2)*DS1;

        Y2=Dxx22*[Pk2(1,1) 2*Pk2(1,2) Pk2(2,2)]';
        X2=[XX22,2*XU22,2*gamma2*gamma2*WX22,2*VX22];
        pp2=pinv(X2'*X2)*X2'*Y2;
        DS2 = [pp2(8) pp2(10); pp2(9) pp2(11)];
        newOmega2 = newT2 - inv(Pk2)*DS2;

        Y3=Dxx23*[Pk2(1,1) 2*Pk2(1,2) Pk2(2,2)]';
        X3=[XX23,2*XU23,2*gamma2*gamma2*WX23,2*VX23];
        pp3=pinv(X3'*X3)*X3'*Y3;
        DS3 = [pp3(8) pp3(10); pp3(9) pp3(11)];
        newOmega3 = newT2 - inv(Pk2)*DS3;
        
        Y4=Dxx24*[Pk2(1,1) 2*Pk2(1,2) Pk2(2,2)]';
        X4=[XX24,2*XU24,2*gamma2*gamma2*WX24,2*VX24];
        pp4=pinv(X4'*X4)*X4'*Y4;
        DS4 = [pp4(8) pp4(10); pp4(9) pp4(11)];
        newOmega4 = newT2 - inv(Pk2)*DS4;
        
        Y5=Dxx25*[Pk2(1,1) 2*Pk2(1,2) Pk2(2,2)]';
        X5=[XX25,2*XU25,2*gamma2*gamma2*WX25,2*VX25];
        pp5=pinv(X5'*X5)*X5'*Y5;
        DS5 = [pp5(8) pp5(10); pp5(9) pp5(11)];
        newOmega5 = newT2 - inv(Pk2)*DS5;
        
        Lambda1 = newOmega2-newB2*U_trial2;
        Lambda2 = newOmega3-newB2*U_trial3;
        Lambda3 = newOmega4-newB2*U_trial4;
        Lambda4 = newOmega5-newB2*U_trial5;
        xi1 = inv(Pk2)*DS1+newB2*U_trial1;

        Lambda = [Lambda1(:),Lambda2(:),Lambda3(:),Lambda4(:),zeros(4,6);
            XU_trial2(:),XU_trial3(:),XU_trial4(:),XU_trial5(:),-eye(6)];
        xi = [xi1(:);-XU_trial1(:)];

        Lambda = [Lambda(5:10,:);Lambda(1:4,:)];
        xi = [xi(5:10);xi(1:4)];

        Pi = -Lambda(1:6,1:4)*inv(Lambda(7:10,1:4))*Lambda(7:10,5:10)+Lambda(1:6,5:10);
        Psi = -Lambda(1:6,1:4)*inv(Lambda(7:10,1:4))*xi(7:10)+xi(1:6);

        Qbar = eye(2);
        Rbar = 1;
        M = [kron(eye(2),Qbar),zeros(4,2);zeros(2,4),kron(eye(2),Rbar)];
        MMM = [2*M,kron(eye(1),Pi)';kron(eye(1),Pi),zeros(6,6)];
        XUsolution = inv(MMM)*[zeros(6,1);Psi];
        Xlearn2 = [XUsolution(1) XUsolution(4);XUsolution(2) XUsolution(5)];
        Ulearn2 = [XUsolution(3) XUsolution(6)];
        Llearn2 = Ulearn2 + K2*Xlearn2;
        
        %3
        Y1=Dxx31*[Pk3(1,1) 2*Pk3(1,2) Pk3(2,2)]'; 
        X1=[XX31,2*XU31,2*gamma3*gamma3*WX31,2*VX31];
        pp1=pinv(X1'*X1)*X1'*Y1;
        DS1 = [pp1(8) pp1(10); pp1(9) pp1(11)];
        newOmega1 = newT3 - inv(Pk3)*DS1;

        Y2=Dxx32*[Pk3(1,1) 2*Pk3(1,2) Pk3(2,2)]';
        X2=[XX32,2*XU32,2*gamma3*gamma3*WX32,2*VX32];
        pp2=pinv(X2'*X2)*X2'*Y2;
        DS2 = [pp2(8) pp2(10); pp2(9) pp2(11)];
        newOmega2 = newT3 - inv(Pk3)*DS2;

        Y3=Dxx33*[Pk3(1,1) 2*Pk3(1,2) Pk3(2,2)]';
        X3=[XX33,2*XU33,2*gamma3*gamma3*WX33,2*VX33];
        pp3=pinv(X3'*X3)*X3'*Y3;
        DS3 = [pp3(8) pp3(10); pp3(9) pp3(11)];
        newOmega3 = newT3 - inv(Pk3)*DS3;

        Y4=Dxx34*[Pk3(1,1) 2*Pk3(1,2) Pk3(2,2)]';
        X4=[XX34,2*XU34,2*gamma3*gamma3*WX34,2*VX34];
        pp4=pinv(X4'*X4)*X4'*Y4;
        DS4 = [pp4(8) pp4(10); pp4(9) pp4(11)];
        newOmega4 = newT3 - inv(Pk3)*DS4;
        
        Y5=Dxx35*[Pk3(1,1) 2*Pk3(1,2) Pk3(2,2)]';
        X5=[XX35,2*XU35,2*gamma3*gamma3*WX35,2*VX35];
        pp5=pinv(X5'*X5)*X5'*Y5;
        DS5 = [pp5(8) pp5(10); pp5(9) pp5(11)];
        newOmega5 = newT3 - inv(Pk3)*DS5;
        
        Lambda1 = newOmega2-newB3*U_trial2;
        Lambda2 = newOmega3-newB3*U_trial3;
        Lambda3 = newOmega4-newB3*U_trial4;
        Lambda4 = newOmega5-newB3*U_trial5;
        xi1 = inv(Pk3)*DS1+newB3*U_trial1;

        Lambda = [Lambda1(:),Lambda2(:),Lambda3(:),Lambda4(:),zeros(4,6);
            XU_trial2(:),XU_trial3(:),XU_trial4(:),XU_trial5(:),-eye(6)];
        xi = [xi1(:);-XU_trial1(:)];

        Lambda = [Lambda(5:10,:);Lambda(1:4,:)];
        xi = [xi(5:10);xi(1:4)];

        Pi = -Lambda(1:6,1:4)*inv(Lambda(7:10,1:4))*Lambda(7:10,5:10)+Lambda(1:6,5:10);
        Psi = -Lambda(1:6,1:4)*inv(Lambda(7:10,1:4))*xi(7:10)+xi(1:6);

        Qbar = eye(2);
        Rbar = 1;
        M = [kron(eye(2),Qbar),zeros(4,2);zeros(2,4),kron(eye(2),Rbar)];
        MMM = [2*M,kron(eye(1),Pi)';kron(eye(1),Pi),zeros(6,6)];
        XUsolution = inv(MMM)*[zeros(6,1);Psi];
        Xlearn3 = [XUsolution(1) XUsolution(4);XUsolution(2) XUsolution(5)];
        Ulearn3 = [XUsolution(3) XUsolution(6)];
        Llearn3 = Ulearn3 + K3*Xlearn3;
        
        %4
        Y1=Dxx41*[Pk4(1,1) 2*Pk4(1,2) Pk4(2,2)]'; 
        X1=[XX41,2*XU41,2*gamma4*gamma4*WX41,2*VX41];
        pp1=pinv(X1'*X1)*X1'*Y1;
        DS1 = [pp1(8) pp1(10); pp1(9) pp1(11)];
        newOmega1 = newT4 - inv(Pk4)*DS1;

        Y2=Dxx42*[Pk4(1,1) 2*Pk4(1,2) Pk4(2,2)]';
        X2=[XX42,2*XU42,2*gamma4*gamma4*WX42,2*VX42];
        pp2=pinv(X2'*X2)*X2'*Y2;
        DS2 = [pp2(8) pp2(10); pp2(9) pp2(11)];
        newOmega2 = newT4 - inv(Pk4)*DS2;

        Y3=Dxx43*[Pk4(1,1) 2*Pk4(1,2) Pk4(2,2)]';
        X3=[XX43,2*XU43,2*gamma4*gamma4*WX43,2*VX43];
        pp3=pinv(X3'*X3)*X3'*Y3;
        DS3 = [pp3(8) pp3(10); pp3(9) pp3(11)];
        newOmega3 = newT4 - inv(Pk4)*DS3;
        
        Y4=Dxx44*[Pk4(1,1) 2*Pk4(1,2) Pk4(2,2)]';
        X4=[XX44,2*XU44,2*gamma4*gamma4*WX44,2*VX44];
        pp4=pinv(X4'*X4)*X4'*Y4;
        DS4 = [pp4(8) pp4(10); pp4(9) pp4(11)];
        newOmega4 = newT4 - inv(Pk4)*DS4;
        
        Y5=Dxx45*[Pk4(1,1) 2*Pk4(1,2) Pk4(2,2)]';
        X5=[XX45,2*XU45,2*gamma4*gamma4*WX45,2*VX45];
        pp5=pinv(X5'*X5)*X5'*Y5;
        DS5 = [pp5(8) pp5(10); pp5(9) pp5(11)];
        newOmega5 = newT4 - inv(Pk4)*DS5;
        
        Lambda1 = newOmega2-newB4*U_trial2;
        Lambda2 = newOmega3-newB4*U_trial3;
        Lambda3 = newOmega4-newB4*U_trial4;
        Lambda4 = newOmega5-newB4*U_trial5;
        xi1 = inv(Pk4)*DS1+newB4*U_trial1;

        Lambda = [Lambda1(:),Lambda2(:),Lambda3(:),Lambda4(:),zeros(4,6);
            XU_trial2(:),XU_trial3(:),XU_trial4(:),XU_trial5(:),-eye(6)];
        xi = [xi1(:);-XU_trial1(:)];

        Lambda = [Lambda(5:10,:);Lambda(1:4,:)];
        xi = [xi(5:10);xi(1:4)];

        Pi = -Lambda(1:6,1:4)*inv(Lambda(7:10,1:4))*Lambda(7:10,5:10)+Lambda(1:6,5:10);
        Psi = -Lambda(1:6,1:4)*inv(Lambda(7:10,1:4))*xi(7:10)+xi(1:6);

        Qbar = eye(2);
        Rbar = 1;
        M = [kron(eye(2),Qbar),zeros(4,2);zeros(2,4),kron(eye(2),Rbar)];
        MMM = [2*M,kron(eye(1),Pi)';kron(eye(1),Pi),zeros(6,6)];
        XUsolution = inv(MMM)*[zeros(6,1);Psi];
        Xlearn4 = [XUsolution(1) XUsolution(4);XUsolution(2) XUsolution(5)];
        Ulearn4 = [XUsolution(3) XUsolution(6)];
        Llearn4 = Ulearn4 + K4*Xlearn4;
        
        eflag = 0;
        
        eflagend = size(Time,1);
        
    end
    
end

% figure;plot(Time1,obE1,'--',Time1,obE2,'--',Time1,obE3,'--',Time1,obE4,'--');
% set(findall(gcf,'type','line'),'linewidth',2);
% hold on; xlabel('Time(s)');
% set(findall(gcf,'type','line'),'linewidth',2);
% set(get(gca,'XLabel'),'FontSize',16);set(get(gca,'YLabel'),'FontSize',16);
% set(gca,'fontsize',16);set(legend,'Interpreter','latex');size

sizesimulation = size(Time,1);
for i = 1: sizesimulation
    if i<eflagend
        u1=[u1;-K0*x1(i,:)'+0.2*sin(15*Time(i))+sin(5*Time(i))*sin(8*Time(i))];
        u2=[u2;-K0*x2(i,:)'+0.2*sin(15*Time(i))+sin(5*Time(i))*sin(8*Time(i))];
        u3=[u3;-K0*x3(i,:)'+0.2*sin(15*Time(i))+sin(5*Time(i))*sin(8*Time(i))];
        u4=[u4;-K0*x4(i,:)'+0.2*sin(15*Time(i))+sin(5*Time(i))*sin(8*Time(i))];
    else
        u1=[u1;-K1*x1(i,:)'+Llearn1*eta1(i,:)'];
        u2=[u2;-K2*x2(i,:)'+Llearn2*eta2(i,:)'];
        u3=[u3;-K3*x3(i,:)'+Llearn3*eta3(i,:)'];
        u4=[u4;-K4*x4(i,:)'+Llearn4*eta4(i,:)'];
    end
end

figure;plot(Time,v,Time,eta1,'--',Time,eta2,'--',Time,eta3,'--',Time,eta4,'--');
hold on; xlabel('Time(s)');legend('$v_1(t)$','$v_2(t)$','$\eta_{11}(t)$','$\eta_{12}(t)$',...
    '$\eta_{21}(t)$','$\eta_{22}(t)$','$\eta_{31}(t)$','$\eta_{32}(t)$',...
    '$\eta_{41}(t)$','$\eta_{42}(t)$');
set(findall(gcf,'type','line'),'linewidth',2);
set(get(gca,'XLabel'),'FontSize',16);set(get(gca,'YLabel'),'FontSize',16);
set(gca,'fontsize',16);set(legend,'Interpreter','latex');

figure;plot(Time,v(:,1),Time,x1(:,1)+u1,Time,x2(:,1)+u2,Time,x3(:,1)+u3,Time,x4(:,1)+u4);
hold on; xlabel('Time(s)');legend('$y_d(t)$','$y_1(t)$',...
    '$y_2(t)$','$y_3(t)$','$y_4(t)$');
set(findall(gcf,'type','line'),'linewidth',2);
set(get(gca,'XLabel'),'FontSize',16);set(get(gca,'YLabel'),'FontSize',16);
set(gca,'fontsize',16);set(legend,'Interpreter','latex');

figure;subplot(2,2,1),plot(1:length(deltaNormP1),deltaNormP1);
set(findall(gcf,'type','line'),'linewidth',2);xlabel('Iteration');
legend('$\|P_{1j}-P_1^*\|$');
set(get(gca,'XLabel'),'FontSize',16);set(get(gca,'YLabel'),'FontSize',16);
set(gca,'fontsize',16);set(legend,'Interpreter','latex');xlabel('Iteration');

subplot(2,2,2),plot(1:length(deltaNormP2),deltaNormP2);
set(findall(gcf,'type','line'),'linewidth',2);xlabel('Iteration');
legend('$\|P_{2j}-P_2^*\|$');
set(get(gca,'XLabel'),'FontSize',16);set(get(gca,'YLabel'),'FontSize',16);
set(gca,'fontsize',16);set(legend,'Interpreter','latex');xlabel('Iteration');

subplot(2,2,3),plot(1:length(deltaNormP3),deltaNormP3);
set(findall(gcf,'type','line'),'linewidth',2);xlabel('Iteration');
legend('$\|P_{3j}-P_3^*\|$');
set(get(gca,'XLabel'),'FontSize',16);set(get(gca,'YLabel'),'FontSize',16);
set(gca,'fontsize',16);set(legend,'Interpreter','latex');xlabel('Iteration');

subplot(2,2,4),plot(1:length(deltaNormP4),deltaNormP4);
set(findall(gcf,'type','line'),'linewidth',2);xlabel('Iteration');
legend('$\|P_{4j}-P_4^*\|$');
set(get(gca,'XLabel'),'FontSize',16);set(get(gca,'YLabel'),'FontSize',16);
set(gca,'fontsize',16);set(legend,'Interpreter','latex');xlabel('Iteration');

disp('The solusions of output regulation equations are:')
Xstar1
Ustar1
Xstar2
Ustar2
Xstar3
Ustar3
Xstar4
Ustar4

disp('The learned solusions of output regulation equations are:')
Xlearn1
Ulearn1
Xlearn2
Ulearn2
Xlearn3
Ulearn3
Xlearn4
Ulearn4

disp('The idea values of Pi, Ki, Wi and L are:')
Pstar1
Kstar1
Wstar1
Lstar1
Pstar2
Kstar2
Wstar2
Lstar2
Pstar3
Kstar3
Wstar3
Lstar3
Pstar4
Kstar4
Wstar4
Lstar4

disp('The learned P, K and L are:')
Pk1
K1
W1
Llearn1
Pk2
K2
W2
Llearn2
Pk3
K3
W3
Llearn3
Pk4
K4
W4
Llearn4

end

function dX=myMAS(t,X)
global E mu1 mu2 K1 K2 K3 K4 A B1 B2 B3 B4 D1 D2 D3 D4 ...
    X_trial1 X_trial2 X_trial3 X_trial4 X_trial5 R Llearn1 Llearn2 Llearn3 ...
    Llearn4 eflag T1 T2 T3 T4

v=X(1:2); 
oE1 = X(3:6); 
oE2 = X(7:10); 
oE3 = X(11:14); 
oE4 = X(15:18);
eta1 = X(19:20); 
eta2 = X(21:22); 
eta3 = X(23:24); 
eta4 = X(25:26);

x1 = X(27:28); 
x2 = X(28+44+1:28+44+2); 
x3 = X(28+2*44+2+1:28+2*44+2+2); 
x4 = X(28+3*44+4+1:28+3*44+4+2); 

e11 = x1 - X_trial1*eta1;
e12 = x1 - X_trial2*eta1;
e13 = x1 - X_trial3*eta1;
e14 = x1 - X_trial4*eta1;
e15 = x1 - X_trial5*eta1;
e21 = x2 - X_trial1*eta2;
e22 = x2 - X_trial2*eta2;
e23 = x2 - X_trial3*eta2;
e24 = x2 - X_trial4*eta2;
e25 = x2 - X_trial5*eta2;
e31 = x3 - X_trial1*eta3;
e32 = x3 - X_trial2*eta3;
e33 = x3 - X_trial3*eta3;
e34 = x3 - X_trial4*eta3;
e35 = x3 - X_trial5*eta3;
e41 = x4 - X_trial1*eta4;
e42 = x4 - X_trial2*eta4;
e43 = x4 - X_trial3*eta4;
e44 = x4 - X_trial4*eta4;
e45 = x4 - X_trial5*eta4;

u1=-K1*x1+eflag*0.2*sin(15*t/1)+eflag*sin(5*t)*sin(8*t)+Llearn1*eta1;
u2=-K2*x2+eflag*0.2*sin(15*t/2)+eflag*sin(5*t)*sin(8*t)+Llearn2*eta2;
u3=-K3*x3+eflag*0.2*sin(15*t/3)+eflag*sin(5*t)*sin(8*t)+Llearn3*eta3;
u4=-K4*x4+eflag*0.2*sin(15*t/4)+eflag*sin(5*t)*sin(8*t)+Llearn4*eta4;
w1=exp(-0.1*t)*(0.2*cos(12*1*t)+cos(6*1*t)*sin(7*1*t));
w2=exp(-0.1*t)*(0.2*2*cos(12*2*t)+cos(6*2*t)*sin(7*2*t));
w3=exp(-0.1*t)*(0.2*3*cos(12*3*t)+cos(6*3*t)*sin(7*3*t));
w4=exp(-0.1*t)*(0.2*4*cos(12*4*t)+cos(6*4*t)*sin(7*4*t));
dx1=A*x1+B1*u1+D1*w1+T1*v;
dx2=A*x2+B2*u2+D2*w2+T2*v;
dx3=A*x3+B3*u3+D3*w3+T3*v;
dx4=A*x4+B4*u4+D4*w4+T4*v;

%1
dxx10=kron(x1',x1')';
dux10=kron(x1',u1'*R)';
dwx10=kron(w1',x1')';
dvx10=kron(eta1',x1')';
dxx11=kron(e11',e11')';
dux11=kron(e11',u1'*R)';
dwx11=kron(w1',e11')';
dvx11=kron(eta1',e11')';
dxx12=kron(e12',e12')';
dux12=kron(e12',u1'*R)';
dwx12=kron(w1',e12')';
dvx12=kron(eta1',e12')';
dxx13=kron(e13',e13')';
dux13=kron(e13',u1'*R)';
dwx13=kron(w1',e13')';
dvx13=kron(eta1',e13')';
dxx14=kron(e14',e14')';
dux14=kron(e14',u1'*R)';
dwx14=kron(w1',e14')';
dvx14=kron(eta1',e14')';
dxx15=kron(e15',e15')';
dux15=kron(e15',u1'*R)';
dwx15=kron(w1',e15')';
dvx15=kron(eta1',e15')';

%2
dxx20=kron(x2',x2')';
dux20=kron(x2',u2'*R)';
dwx20=kron(w2',x2')';
dvx20=kron(eta2',x2')';
dxx21=kron(e21',e21')';
dux21=kron(e21',u2'*R)';
dwx21=kron(w2',e21')';
dvx21=kron(eta2',e21')';
dxx22=kron(e22',e22')';
dux22=kron(e22',u2'*R)';
dwx22=kron(w2',e22')';
dvx22=kron(eta2',e22')';
dxx23=kron(e23',e23')';
dux23=kron(e23',u2'*R)';
dwx23=kron(w2',e23')';
dvx23=kron(eta2',e23')';
dxx24=kron(e24',e24')';
dux24=kron(e24',u2'*R)';
dwx24=kron(w2',e24')';
dvx24=kron(eta2',e24')';
dxx25=kron(e25',e25')';
dux25=kron(e25',u2'*R)';
dwx25=kron(w2',e25')';
dvx25=kron(eta2',e25')';

%3
dxx30=kron(x3',x3')';
dux30=kron(x3',u3'*R)';
dwx30=kron(w3',x3')';
dvx30=kron(eta3',x3')';
dxx31=kron(e31',e31')';
dux31=kron(e31',u3'*R)';
dwx31=kron(w3',e31')';
dvx31=kron(eta3',e31')';
dxx32=kron(e32',e32')';
dux32=kron(e32',u3'*R)';
dwx32=kron(w3',e32')';
dvx32=kron(eta3',e32')';
dxx33=kron(e33',e33')';
dux33=kron(e33',u3'*R)';
dwx33=kron(w3',e33')';
dvx33=kron(eta3',e33')';
dxx34=kron(e34',e34')';
dux34=kron(e34',u3'*R)';
dwx34=kron(w3',e34')';
dvx34=kron(eta3',e34')';
dxx35=kron(e35',e35')';
dux35=kron(e35',u3'*R)';
dwx35=kron(w3',e35')';
dvx35=kron(eta3',e35')';

%4
dxx40=kron(x4',x4')';
dux40=kron(x4',u4'*R)';
dwx40=kron(w4',x4')';
dvx40=kron(eta4',x4')';
dxx41=kron(e41',e41')';
dux41=kron(e41',u4'*R)';
dwx41=kron(w4',e41')';
dvx41=kron(eta4',e41')';
dxx42=kron(e42',e42')';
dux42=kron(e42',u4'*R)';
dwx42=kron(w4',e42')';
dvx42=kron(eta4',e42')';
dxx43=kron(e43',e43')';
dux43=kron(e43',u4'*R)';
dwx43=kron(w4',e43')';
dvx43=kron(eta4',e43')';
dxx44=kron(e44',e44')';
dux44=kron(e44',u4'*R)';
dwx44=kron(w4',e44')';
dvx44=kron(eta4',e44')';
dxx45=kron(e45',e45')';
dux45=kron(e45',u4'*R)';
dwx45=kron(w4',e45')';
dvx45=kron(eta4',e45')';

dv=E*v;
doE1=mu1*(E(:)+oE3-2*oE1);   
doE2=mu1*(oE1-oE2); 
doE3=mu1*(oE2+oE2-2*oE3); 
doE4=mu1*(oE3-oE4); 
deta1=[oE1(1),oE1(3);oE1(2),oE1(4)]*eta1 + mu2*(v+eta3-2*eta1);
deta2=[oE2(1),oE2(3);oE2(2),oE2(4)]*eta2 + mu2*(eta1-eta2);
deta3=[oE3(1),oE3(3);oE3(2),oE3(4)]*eta3 + mu2*(eta2+eta2-2*eta3);
deta4=[oE4(1),oE4(3);oE4(2),oE4(4)]*eta4 + mu2*(eta3-eta4);

dX=[dv;doE1;doE2;doE3;doE4;deta1;deta2;deta3;deta4;...
    dx1;dxx10;dux10;dwx10;dxx11;dux11;dwx11;dvx11;dxx12;dux12;dwx12;dvx12;...
    dxx13;dux13;dwx13;dvx13;...
    dx2;dxx20;dux20;dwx20;dxx21;dux21;dwx21;dvx21;dxx22;dux22;dwx22;dvx22;...
    dxx23;dux23;dwx23;dvx23;...
    dx3;dxx30;dux30;dwx30;dxx31;dux31;dwx31;dvx31;dxx32;dux32;dwx32;dvx32;...
    dxx33;dux33;dwx33;dvx33;...
    dx4;dxx40;dux40;dwx40;dxx41;dux41;dwx41;dvx41;dxx42;dux42;dwx42;dvx42;...
    dxx43;dux43;dwx43;dvx43;...
    dvx10;dvx20;dvx30;dvx40;...
    dxx14;dux14;dwx14;dvx14;dxx15;dux15;dwx15;dvx15;...
    dxx24;dux24;dwx24;dvx24;dxx25;dux25;dwx25;dvx25;...
    dxx34;dux34;dwx34;dvx34;dxx35;dux35;dwx35;dvx35;...
    dxx44;dux44;dwx44;dvx44;dxx45;dux45;dwx45;dvx45;];

end