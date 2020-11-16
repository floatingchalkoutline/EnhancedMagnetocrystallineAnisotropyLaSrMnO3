%% This program averages angle-dependent changes in resistance of the film sample (in plot-friendly form)%%
%% Written by Daniel Vegerano
%% UNL SRP 2015
%% Tip: For faster plots, comment out sections that you don't need plotted.
%% Tip: Hit Ctrl+ C to stop if the program takes too long.

% %For the 10,000 Oe field FORWARDS
% A = unique(PH10000Forward);
% A5deg = A(1:7:length(A));
% for l = 1:1:length(A5deg)
%     
%     CurrentPosition1 = A5deg(l);
%     Index1 = find(PH10000Forward == CurrentPosition1);
%     
%     R1 = RH10000Forward(Index1, 1);
%     MeanResistance1 = mean(R1);
%       
%     ResistanceVector1(l,1) = MeanResistance1;
%     PositionVector1(l,1) = CurrentPosition1;
%     
% end    
% 
% [PositionVectorSorted1, Sortind1] = sort(PositionVector1);
% ResistanceVectorSorted1 = ResistanceVector1(Sortind1);
% 
% % For the 10,000 Oe field BACKWARDS
% B = unique(PH10000Backward);
% B5deg = B(1:7:length(B));
% for m = 1:1:length(B5deg)
%     
%     CurrentPosition2 = B5deg(m);
%     Index2 = find(PH10000Backward == CurrentPosition2);
%     
%     R2 = RH10000Backward(Index2, 1);
%     MeanResistance2 = mean(R2);
%       
%     ResistanceVector2(m,1) = MeanResistance2;
%     PositionVector2(m,1) = CurrentPosition2;
%     
% end    
% 
% [PositionVectorSorted2, Sortind2] = sort(PositionVector2);
% ResistanceVectorSorted2 = ResistanceVector2(Sortind2);
% 

%For the 6,000 Oe field FORWARDS
% C = unique(PH6000Forward);
% C5deg = C(1:7:length(C));
% for n = 1:1:length(C5deg)
%     
%     CurrentPosition3 = C5deg(n);
%     Index3 = find(PH6000Forward == CurrentPosition3);
%     
%     R3 = RH6000Forward(Index3, 1);
%     MeanResistance3 = mean(R3);
%       
%     ResistanceVector3(n,1) = MeanResistance3;
%     PositionVector3(n,1) = CurrentPosition3;
%     
% end    
% 
% [PositionVectorSorted3, Sortind3] = sort(PositionVector3);
% ResistanceVectorSorted3 = ResistanceVector3(Sortind3);

% For the 6000 Oe field BACKWARDS
% D = unique(PH6000Backward);
% D5deg = D(1:7:length(D));
% for o = 1:1:length(D5deg)
%     
%     CurrentPosition4 = D5deg(o);
%     Index4 = find(PH6000Backward == CurrentPosition4); 
%     
%     R4 = RH6000Backward(Index4, 1);
%     MeanResistance4 = mean(R4);
%       
%     ResistanceVector4(o,1) = MeanResistance4;
%     PositionVector4(o,1) = CurrentPosition4;
%     
% end    
% 
% [PositionVectorSorted4, Sortind4] = sort(PositionVector4);
% ResistanceVectorSorted4 = ResistanceVector4(Sortind4);

%  For the 600 Oe field FORWARDS
% E = unique(PH600Forward);
% E5deg = E(1:7:length(E));
% for p = 1:1:length(E5deg)
%     
%     CurrentPosition5 = E5deg(p);
%     Index5 = find(PH600Forward == CurrentPosition5);
%     
%     R5 = RH600Forward(Index5, 1);
%     MeanResistance5 = mean(R5);
%       
%     ResistanceVector5(p,1) = MeanResistance5;
%     PositionVector5(p,1) = CurrentPosition5;
%     
% end    
% 
% [PositionVectorSorted5, Sortind5] = sort(PositionVector5);
% ResistanceVectorSorted5 = ResistanceVector5(Sortind5);
% 
% % For the 600 Oe field BACKWARDS
% F = unique(PH600Backward);
% Fdeg5 = F(1:7:length(F));
% for q = 1:1:length(Fdeg5)
%     
%     CurrentPosition6 = Fdeg5(q);
%     Index6 = find(PH600Backward == CurrentPosition6); % this yields B; every index in which current set of duplicates occur in Position
%     
%     R6 = RH600Backward(Index6, 1);
%     MeanResistance6 = mean(R6);
%       
%     ResistanceVector6(q,1) = MeanResistance6;
%     PositionVector6(q,1) = CurrentPosition6;
%     
% end    
% 
% [PositionVectorSorted6, Sortind6] = sort(PositionVector6);
% ResistanceVectorSorted6 = ResistanceVector6(Sortind6);


% figure
% scatter(PositionVector1,ResistanceVector1,'b');
% hold on;
% plot(PositionVectorSorted1,ResistanceVectorSorted1,'r');
% hold off;
% figure
% scatter(PositionVector2,ResistanceVector2,'b');
% hold on;
% plot(PositionVector2,ResistanceVectorSorted2,'r');
% hold off;
% figure
% scatter(PositionVector3,ResistanceVector3,'b');
% hold on;
% plot(PositionVector3,ResistanceVector3,'r');
% hold off;
% figure
% scatter(PositionVector4,ResistanceVector4,'b');
% hold on;
% plot(PositionVector4,ResistanceVector4,'r');
% hold off;
% figure
% scatter(PositionVector5,ResistanceVector5,'r');
% hold on;
% plot(PositionVector5,ResistanceVector5,'b');
% hold on;
% scatter(PositionVector6,ResistanceVector6,'r');
% hold on;
% plot(PositionVector6,ResistanceVector6,'b');
% hold off;

