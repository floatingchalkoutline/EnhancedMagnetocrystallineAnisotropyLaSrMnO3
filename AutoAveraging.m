%% This program is intended to take any film sample data (Position, Resistance, and Applied Field)
%% in order to average the Resistances for both values of theta
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
for i =1 %while i < length(H) + 1
    clearvars -except H i P VarName1 VarName2 VarName3 Z h
    PIndex = find(VarName3 == H(i));                                        %Pinpoints the indices of the magnetic field values
    CurrentP(:,1) = PIndex;                                                 %Uses the same indices to gather corresponding theta values
    CurrentP(:,2) = P(PIndex(:));                                           %NOTE: THE FIRST WHILE LOOP ITERATES FOR ONE FIELD AT A TIME
    
    k = 1;
    while CurrentP(k,2) < 365
        B(k,1) = CurrentP(k,1);                                             %B represents the forward rotations
        B(k,2) = CurrentP(k,2);
        if k + 1 > length(CurrentP)
            break
        else
            k = k + 1;
        end
        
    end
    
    if length(B) == length(CurrentP)                                        %Ensures that the rotations are complete
        i = i + 1;
        break
    end
    
    [P1,P2] = sort(B(:,2));
    B = B(P2,:);
    clear P1 P2
    
    o = length(B) + 1;                                                      %variable o is used to split the CurrentP into forward and backward rotations
    p = 1; 
    while o ~= length(CurrentP) + 1
        C(p,1) = CurrentP(o,1);                                             %C represents the backward roations
        C(p,2) = CurrentP(o,2);
        o = o + 1;
        p = p + 1;
    end
    
    [P1,P2] = sort(C(:,2));
    C = C(P2,:);
    clear P1 P2
   
    l = 1; 
    m = 1;
    while l < length(B(:,2)) + 1
        if mod(B(l,2),5) == 0
            NewP1(m,1) = B(l,1);                                            %NewP1 is the forward rotation with theta being multiples of 5
            NewP1(m,2) = B(l,2);
            l = l + 1;
            m = m + 1;
        else
            l = l + 1;
        end
        
    end
    
    l = 1;
    m = 1;
    while l < length(C(:,2)) + 1
        if mod(C(l,2),5) == 0
            NewP2(m,1) = C(l,1);                                            %NewP2 is the backward rotation with theta being multiples of 5
            NewP2(m,2) = C(l,2);
            l = l + 1;
            m = m + 1;
        else
            l = l + 1;
        end
          
    end                                                                     %All Positioning has been taken care of by this point

    % RUNS THE POSITIONS FROM -5 TO 365   
    l = 1;
    m = NewP1(1,2);
    x = 1;
    z = 1;
    while NewP1(l,2) == m
        R1(x,1) = VarName2(NewP1(l,1),1);                                    %Places all resistance values for specific position and applied field into the R1 vector
        if l + 1 > length(NewP1)
            break
        end
        if NewP1(l + 1,2) ~= m
            if NewP1(l + 2,2) == m
                NewP1(l + 1,2) = NewP1(l,2);
            else Resistance1(z,1) = m;
                 Resistance1(z,2) = mean(R1(:,1));
                 Resistance1(z,3) = H(i);
            end
            
        x = x + 1;
            
%             if NewP1(l + 1,2) == NewP1(l,2) + 5
%                 m = m + 5;
%             elseif NewP1(l + 1,2) == NewP1(1,2) - 5
%                 m = m - 5;
%             end
%             
%             l = l + 1;
%             z = z + 1;
%             x = 1;
%             clear R1
%         else
%             l = l + 1;
%         end
%         
%         x = x + 1;    
%     end
%     
%     if length(Resistance1) ~=  73
%         if length(Resistance1) > 4
%             if Resistance1(1,1) == 0
%                 Resistance1 = Resistance1(2:74,:);
%                 Z(:,:,h) = Resistance1;
%                 h = h + 1;
%             end
%         end          
%     else
%         Z(:,:,h) = Resistance1;
%         h = h + 1;
%     end
    
% RUNS THE POSITIONS FROM 365 TO -5 
%     l = 1;
%     m = NewP2(1,2);
%     x = 1;
%     z = 1;
%     while NewP2(l,2) == m
%         R2(x,1) = VarName2(NewP2(l,1),1);                                    %Places all resistance values for specific position and applied field into the R vector
%         if l + 1 > length(NewP2)
%             break
%         end
%         if NewP2(l + 1,2) ~= m
%             Resistance2(z,1) = m;
%             Resistance2(z,2) = mean(R2(:,1));
%             if NewP2(l + 1,2) == NewP2(l,2) + 5
%                 m = m + 5;
%             elseif NewP2(l + 1,2) == NewP2(1,2) - 5
%                 m = m - 5;
%             end
%             l = l + 1;
%             z = z + 1;
%             x = 1;
%             clear R2
%         else
%             l = l + 1;
%         end
%         
%         x = x + 1;    
%     end
    
    figure
    scatter(Z(:,1),Z(:,2),'b');
    hold on;
    
%     scatter(Resistance2(:,1),Resistance2(:,2),'g');
%     hold off;    
    i = i + 1;
end
%%
t = 1;
% while t < 8
%     scatter3(Z(:,1,t),Z(:,3,t),Z(:,2,t));
%     hold on;
%     t = t + 1;
% end
% hold off;
% Data = permute(Z, [3,2,1]);
%dlmwrite('Data.txt',Data,'delimiter','\t');                                 %172 and 173 write the Z matrix to a .txt file that can be read by Origin 8.5