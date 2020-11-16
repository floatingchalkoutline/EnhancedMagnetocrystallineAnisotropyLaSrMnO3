%% This simple program is designed to take phi vs theta data and turn the data from a saw-tooth
%% sin wave into a linear fit of the data.
%% Written by Daniel Vegerano
%% UNL SRP 2015

% A(1,1) = VarName1(1,1);
% m = 1;
% while m < length(VarName1)
%     absolute = abs(VarName1(m,1) - VarName1(m + 1,1));
%     A(m + 1,1) = A(m,1) + absolute;
%     m = m + 1;
% end
% plot(rho,A)
% clearvars -except A rho
% hold on

%%

l = 1;
A(l,1) = VarName1(1,1);
while l < length(VarName1)
    A(l + 1,1) = (VarName1(l,1) - VarName1(l + 1,1)) + A(l,1);
    l = l + 1;
end
%%

% l = 1;
% A(l,1) = VarName1(1,1);
% while l < length(VarName1)
%     A(l + 1,1) = (VarName1(l,1) - VarName1(l + 1,1)) + A(l,1);
%     l = l + 1;
% end