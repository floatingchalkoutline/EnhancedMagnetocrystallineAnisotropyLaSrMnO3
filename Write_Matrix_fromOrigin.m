%% This program is intended to transfer continuous scan data from Origin into MATLAB and
%% create plots of normalized resistance.
%% Written by Daniel Vegerano
%% UNL SRP 2015


A(1,:) = VarName2;
A(2,:) = VarName3;
A(3,:) = VarName4;
A(4,:) = VarName5;
A(5,:) = VarName6;
A(6,:) = VarName7;
A(7,:) = VarName8;
A(8,:) = VarName9;
A(9,:) = VarName10;
A(10,:) = VarName11;
A(11,:) = VarName12;
A(12,:) = VarName13;
A(13,:) = VarName14;
A(14,:) = VarName15;
A(15,:) = VarName16;
A(16,:) = VarName17;
A(17,:) = VarName18;
A(18,:) = VarName19;
% A(19,:) = VarName20;
% A(20,:) = VarName21;
% A(21,:) = VarName22;
% A(22,:) = VarName23;
% A(23,:) = VarName24;
% A(24,:) = VarName25;
% A(25,:) = VarName26;

%%
k = 1;
while k < length(R(:,1)) + 1                                                %This loop is used to find values of phi
    B = (max(R(k,:)) - min(R(k,:)))/2;                                      %It normalizes the resistance data between -1 and 1
    B = min(R(k,:)) + B;                                                    
                                                                            
    Anew(k,:) = R(k,:) - B;
    Anew(k,:) = Anew(k,:)./(max(Anew(k,:)));
    k = k + 1;
end
clearvars k B;

p = 1;
j = 1;
while j < length(Anew(:,1)) + 1
    while p < length(Anew(1,:)) + 1
        if p == 74
            if Anew(j,p) - Anew(j,p - 1) < abs(0.1)
                Anew(j,p) = Anew(j,p)/abs(Anew(j,p));
            end
        end
        
        if p ~= 74
            if Anew(j,p) - Anew(j,p + 1) < abs(0.1)
                Anew(j,p) = Anew(j,p)/abs(Anew(j,p));
            end
        end
        
        if Anew(j,p) < -1
            Anew(j,p) = -1;
        elseif Anew(j,p) > 1
            Anew(j,p) = 1; 
        end

        p = p + 1;
    end
    
    j = j + 1;
    p = 1;
end
clearvars j p;

m = 1;
while m < length(Anew(:,1)) + 1
    phi(m,:) = (.5)*(asin(Anew(m,:)));
    m = m + 1;
end
clearvars m

phi = phi.*(180/pi);

%%
% R(1,:) = (A(1,:) - min(A(1,:)))/(max(A(1,:)) - min(A(1,:)));
% R(2,:) = (A(2,:) - min(A(2,:)))/(max(A(2,:)) - min(A(2,:)));
% R(3,:) = (A(3,:) - min(A(3,:)))/(max(A(3,:)) - min(A(3,:)));
% R(4,:) = (A(4,:) - min(A(4,:)))/(max(A(4,:)) - min(A(4,:)));
% R(5,:) = (A(5,:) - min(A(5,:)))/(max(A(5,:)) - min(A(5,:)));
% R(6,:) = (A(6,:) - min(A(6,:)))/(max(A(6,:)) - min(A(6,:)));
% R(7,:) = (A(7,:) - min(A(7,:)))/(max(A(7,:)) - min(A(7,:)));
% R(8,:) = (A(8,:) - min(A(8,:)))/(max(A(8,:)) - min(A(8,:)));
% R(9,:) = (A(9,:) - min(A(9,:)))/(max(A(9,:)) - min(A(9,:)));
% R(10,:) = (A(10,:) - min(A(10,:)))/(max(A(10,:)) - min(A(10,:)));
% R(11,:) = (A(11,:) - min(A(11,:)))/(max(A(11,:)) - min(A(11,:)));
% R(12,:) = (A(12,:) - min(A(12,:)))/(max(A(12,:)) - min(A(12,:)));
% R(13,:) = (A(13,:) - min(A(13,:)))/(max(A(13,:)) - min(A(13,:)));
% R(14,:) = (A(14,:) - min(A(14,:)))/(max(A(14,:)) - min(A(14,:)));

clearvars r s Rnorm;

% s = (max(phi) - min(phi))/2;    %
% s = (max(L(20,:)) - min(L(20,:)))/2;   
s = (VarName1(28,1) - VarName1(10,1))/2;

% r = (max(phi) + min(phi))/2;    
% r = (max(L(20,:)) + min(L(20,:)))/2;   
r = (VarName1(28,1) + VarName1(10,1))/2;
 
% R = phi;    
% R = L(20,:); 
R = VarName1;

Rnorm = (R - r)/s;
clear R;

l = 1;
while l < length(Rnorm)
    if Rnorm(l,1) > 1
        Rnorm(l,1) = 1;
    elseif Rnorm(l,1) < -1
        Rnorm(l,1) = -1;
    end
    l = l + 1;
end
clear l;

phi = (0.5)*(asin(Rnorm));
phi = phi*(180/pi);

%%
n = 1;
while n ~= length(VarName2)
    if VarName2(n,1) > 30
        VarName2(n,1) = 45;
    elseif VarName2(n,1) < -30
        VarName2(n,1) = -45;
    end
    
    if VarName4(n,1) > 30
        VarName4(n,1) = 45;
    elseif VarName4(n,1) < -30
        VarName4(n,1) = -45;
    end
    
    if VarName6(n,1) > 30
        VarName6(n,1) = 45;
    elseif VarName6(n,1) < -30
        VarName6(n,1) = -45;
    end
    
    if VarName8(n,1) > 30
        VarName8(n,1) = 45;
    elseif VarName8(n,1) < -30
        VarName8(n,1) = -45;
    end
    
    if VarName10(n,1) > 30
        VarName10(n,1) = 45;
    elseif VarName10(n,1) < -30
        VarName10(n,1) = -45;
    end
    
    if VarName12(n,1) > 30
        VarName12(n,1) = 45;
    elseif VarName12(n,1) < -30
        VarName12(n,1) = -45;
    end
    
    if VarName14(n,1) > 30
        VarName14(n,1) = 45;
    elseif VarName14(n,1) < -30
        VarName14(n,1) = -45;
    end
    
    if VarName16(n,1) > 30
        VarName16(n,1) = 45;
    elseif VarName16(n,1) < -30
        VarName16(n,1) = -45;
    end
    if VarName18(n,1) > 30
        VarName18(n,1) = 45;
    elseif VarName18(n,1) < -30
        VarName18(n,1) = -45;
    end
    n = n + 1;
end
figure
plot(VarName1(1:28),VarName2(1:28),'k');
hold on;
plot(VarName3(1:28),VarName4(1:28),'k');
hold on;
plot(VarName5(1:28),VarName6(1:28),'g');
hold on;
plot(VarName7(1:28),VarName8(1:28),'g');
hold on;
plot(VarName9(1:28),VarName10(1:28),'b');
hold on;
plot(VarName11(1:28),VarName12(1:28),'b');
hold on;
plot(VarName13(1:28),VarName14(1:28),'r');
hold on;
plot(VarName15(1:28),VarName16(1:28),'r');
hold on;
plot(VarName17(1:28),VarName18(1:28),'c');
hold on;
plot(VarName19(1:28),VarName20(1:28),'c');
hold off;

% Easy Matrix Sorting Tool
% [Y,I]=sort(VarName7(:,3));
% sortedmatrix = VarName7(I,:);