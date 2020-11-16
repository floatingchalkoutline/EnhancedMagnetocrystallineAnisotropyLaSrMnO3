%% This program is intended to take any film sample data (Position, Resistance, and Applied Field)
%% in order to average the Resistances for all values of theta.
%% Written by Daniel Vegerano
%% UNL SRP 2015

VarName1(isnan(VarName1)) = 0;          
VarName2(isnan(VarName2)) = 0;
VarName3(isnan(VarName3)) = 0;                                              %Sets all NaN values to 0

P = round(VarName1*10)/10;                                                  %Sets angles that are roughly divisible by 5 to exactly divisible by 5

%%
n = 1;
A = VarName3;
while mode(A) ~= 0
    H(n,1) = mode(A);                                                       %Gathers all applied magnetic field strengths into a vector array and
    A = A(A ~= mode(A));                                                    %sorts the fields from smallest to largest.
    n = n + 1;
end

H = sort(H);
%%
h = 1;
i = 1;
while i < length(H) + 1
    clearvars -except H h i P VarName1 VarName2 VarName3 Resistance Z
    PIndex = find(VarName3 == H(i));                                        %Pinpoints the indices of the magnetic field values
    CurrentP(:,1) = PIndex;                                                 %Uses the same indices to gather corresponding theta values
    CurrentP(:,2) = P(PIndex(:));                                           %NOTE: THE FIRST WHILE LOOP ITERATES FOR ONE FIELD AT A TIME
   
    j = 1;
    while j < length(CurrentP)
        if CurrentP(j + 1,2) >= CurrentP(j,2)
            if CurrentP(j,2) < 365
                B(j,1) = CurrentP(j,1);
                B(j,2) = CurrentP(j,2);
            elseif CurrentP(j,2) == 365
                j = length(CurrentP);
                continue
            end
        end
        j = j + 1;
    end
    
    m = 1;
    l = 1;
    while l < length(CurrentP(:,2)) + 1
        if mod(CurrentP(l,2),5) == 0
            NewP1(m,1) = CurrentP(l,1);
            NewP1(m,2) = CurrentP(l,2);
            l = l + 1;
            m = m + 1;
        else
            l = l + 1;
        end
        
    end
    
    [P1,P2] = sort(NewP1(:,2));
    NewP1 = NewP1(P2,:);
    
    m = -5;                                                                  %CHANGE THIS VALUE OF m TO THE FIRST VALUE OF THETA IN THE DATA
    x = 1;
    l = 1;
    z = 1;
    while NewP1(l,2) == m
        R1(x,1) = VarName2(NewP1(l,1),1);                                   %Places all resistance values for specific position and applied field into the R vector
        if l + 1 > length(NewP1)
            break
        end
        
        if NewP1(l + 1,2) ~= m
            Resistance(z,1) = m;
            Resistance(z,2) = mean(R1(:,1));
            Resistance(z,3) = H(i);
            x = 1;
            z = z + 1;
            m = m + 5;
        end
        
        l = l + 1;
        x = x + 1;    
    end
    
    Z(:,:,i) = Resistance;
    figure
    scatter(Z(:,1,i),Z(:,2,i),'b');
    hold on;
    
    i = i + 1;
end
hold off;
clearvars x z R1 m l i h CurrentP P1 P2
%%
% t = 1;
% while t < 8
%     scatter3(Z(:,1,t),Z(:,3,t),Z(:,2,t));
%     hold on;
%     t = t + 1;
% end
% hold off;
% Data = permute(Z, [3,2,1]);
%dlmwrite('Data.txt',Data,'delimiter','\t');                                 %172 and 173 write the Z matrix to a .txt file that can be read by Origin 8.5

% clearvars -except H i P VarName1 VarName2 VarName3 Z h
    