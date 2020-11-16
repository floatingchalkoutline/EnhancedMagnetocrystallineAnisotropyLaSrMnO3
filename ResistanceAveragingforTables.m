%% This program is the actual averaged data of the film sample (in data-friendly form)
%% Written by Daniel Vegerano
%% UNL SRP Summer 2015

% A = unique(PH10000Forward);
% B = unique(PH10000Backward);
% C = unique(PH6000Forward);
% D = unique(PH6000Backward);
% E = unique(PH1000Forward);
% F = unique(PH1000Backward);
% G = unique(PH600Forward);
% H = unique(PH600Backward);
I = unique(PH100Forward);
J = unique(PH100Backward);
% 
% % for applied field of H = 10,000 FORWARDS
% for a = 1:1:length(A)
%     
%     CurrentPosition1 = A(a);
%     Index1 = find(PH10000Forward == CurrentPosition1); 
%     
%     R1 = RH10000Forward(Index1, 1);
%     MeanResistance1(a,:) = mean(R1);
% end
% A5deg = round(A*10)/10;
% b = 1;
% for c = -5:5:365
%     Index1 = find(A5deg == c);
%     Result1(b,1) = A5deg(Index1(1),1);
%     Result1(b,2) = MeanResistance1(Index1(1),1);
%     b=b+1;
% end
% 
% % for applied field of H = 10,000 BACKWARDS
% for d = 1:1:length(B)
%     
%     CurrentPosition2 = B(d);
%     Index2 = find(PH10000Backward == CurrentPosition2); 
%     
%     R2 = RH10000Backward(Index2, 1);
%     MeanResistance2(d,:) = mean(R2);
% end
% B5deg = round(B*10)/10;
% e = 1;
% for f = -5:5:365
%     Index2 = find(B5deg == f);
%     Result2(e,1) = B5deg(Index2(1),1);
%     Result2(e,2) = MeanResistance2(Index2(1),1);
%     e=e+1;
% end
% 
% % for applied field of H = 6,000 FORWARDS
% for g = 1:1:length(C)
%     
%     CurrentPosition3 = C(g);
%     Index3 = find(PH6000Forward == CurrentPosition3); 
%     
%     R3 = RH6000Forward(Index3, 1);
%     MeanResistance3(g,:) = mean(R3);
% end
% C5deg= round(C*10)/10;
% h = 1;
% for i = -5:5:365
%     Index3 = find(C5deg == i);
%     Result3(h,1) = C5deg(Index3(1),1);
%     Result3(h,2) = MeanResistance3(Index3(1),1);
%     h=h+1;
% end
% 
% % for applied field of H = 6,000 BACKWARDS
% for j = 1:1:length(D)
%     
%     CurrentPosition4 = D(j);
%     Index4 = find(PH6000Backward == CurrentPosition4); 
%     
%     R4 = RH6000Backward(Index4, 1);
%     MeanResistance4(j,:) = mean(R4);
% end
% D5deg= round(D*10)/10;
% k = 1;
% for l = -5:5:365
%     Index4 = find(D5deg == l);
%     Result4(k,1) = D5deg(Index4(1),1);
%     Result4(k,2) = MeanResistance4(Index4(1),1);
%     k=k+1;
% end
% 
% % for applied field of H = 1,000 FORWARDS
% for m = 1:1:length(E)
%     
%     CurrentPosition5 = E(m);
%     Index5 = find(PH1000Forward == CurrentPosition5); 
%     
%     R5 = RH1000Forward(Index5, 1);
%     MeanResistance5(m,:) = mean(R5);
% end
% E5deg= round(E*10)/10;
% n = 1;
% for o = -5:5:365
%     Index5 = find(E5deg == o);
%     Result5(n,1) = E5deg(Index5(1),1);
%     Result5(n,2) = MeanResistance5(Index5(1),1);
%     n=n+1;
% end
% 
% %for applied field of H = 1,000 BACKWARDS
% for p = 1:1:length(F)
%     
%     CurrentPosition6 = F(p);
%     Index6 = find(PH1000Backward == CurrentPosition6); 
%     
%     R6 = RH1000Backward(Index6, 1);
%     MeanResistance6(p,:) = mean(R6);
% end
% F5deg= round(F*10)/10;
% q = 1;
% for r = -5:5:365
%     Index6 = find(F5deg == r);
%     Result6(q,1) = F5deg(Index6(1),1);
%     Result6(q,2) = MeanResistance6(Index6(1),1);
%     q=q+1;
% end
% 
% %for applied field of H = 600 FORWARDS
% for s = 1:1:length(G)
%     
%     CurrentPosition7 = G(s);
%     Index7 = find(PH600Forward == CurrentPosition7); 
%     
%     R7 = RH600Forward(Index7, 1);
%     MeanResistance7(s,:) = mean(R7);
% end
% G5deg= round(G*10)/10;
% t = 1;
% for u = -5:5:365
%     Index7 = find(G5deg == u);
%     Result7(t,1) = G5deg(Index7(1),1);
%     Result7(t,2) = MeanResistance7(Index7(1),1);
%     t=t+1;
% end
% 
% % for applied field of H = 600 BACKWARDS
% for v = 1:1:length(H)
%     
%     CurrentPosition8 = H(v);
%     Index8 = find(PH600Backward == CurrentPosition8); 
%     
%     R8 = RH600Backward(Index8, 1);
%     MeanResistance8(v,:) = mean(R8);
% end
% H5deg= round(H*10)/10;
% w = 1;
% for x = -5:5:365
%     Index8 = find(H5deg == x);
%     Result8(w,1) = H5deg(Index8(1),1);
%     Result8(w,2) = MeanResistance8(Index8(1),1);
%     w=w+1;
% end
% 

%for applied field of H = 100 FORWARDS
for y = 1:1:length(I)
    
    CurrentPosition9 = I(y);
    Index9 = find(PH100Forward == CurrentPosition9); 
    
    R9 = RH100Forward(Index9, 1);
    MeanResistance9(y,:) = mean(R9);
end
I5deg= round(I*10)/10;
z = 1;
for aa = -5:5:365
    Index9 = find(I5deg == aa);
    Result9(z,1) = I5deg(Index9(1),1);
    Result9(z,2) = MeanResistance9(Index9(1),1);
    z=z+1;
end

% for applied field of H = 100 BACKWARDS
for bb = 1:1:length(J)
    
    CurrentPosition10 = J(bb);
    Index10 = find(PH100Backward == CurrentPosition10); 
    
    R10 = RH100Backward(Index10, 1);
    MeanResistance10(bb,:) = mean(R10);
end
J5deg= round(J*10)/10;
cc = 1;
for x = -5:5:365
    Index10 = find(J5deg == x);
    Result10(cc,1) = J5deg(Index10(1),1);
    Result10(cc,2) = MeanResistance10(Index10(1),1);
    cc=cc+1;
end

% figure
% scatter(Result1(:,1),Result1(:,2),'b');
% hold on;
% scatter(Result2(:,1),Result2(:,2),'r');
% hold off;
% 
% figure
% scatter(Result3(:,1),Result3(:,2),'b');
% hold on;
% scatter(Result4(:,1),Result4(:,2),'r');
% hold off;
% 
% figure
% scatter(Result5(:,1),Result5(:,2),'b');
% hold on;
% scatter(Result6(:,1),Result6(:,2),'r');
% hold off;
% 
% figure
% scatter(Result7(:,1),Result7(:,2),'b');
% hold on;
% scatter(Result8(:,1),Result8(:,2),'r');
% hold off;

figure
scatter(Result9(:,1),Result9(:,2),'b');
hold on;
scatter(Result10(:,1),Result10(:,2),'r');
hold off;


