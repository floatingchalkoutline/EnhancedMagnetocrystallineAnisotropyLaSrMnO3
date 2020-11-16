%% Write Matrix
clear R 
R(1,:) = Z(:,2,1);
R(2,:) = Z(:,2,2);
R(3,:) = Z(:,2,3);
R(4,:) = Z(:,2,4);
R(5,:) = Z(:,2,5);
R(6,:) = Z(:,2,6);
R(7,:) = Z(:,2,7);
R(8,:) = Z(:,2,8);
R(9,:) = Z(:,2,9);
R(10,:) = Z(:,2,10);
R(11,:) = Z(:,2,11);
R(12,:) = Z(:,2,12);
R(13,:) = Z(:,2,13);
R(14,:) = Z(:,2,14);
R(15,:) = Z(:,2,15);
R(16,:) = Z(:,2,16);
R(17,:) = Z(:,2,17);
R(18,:) = Z(:,2,18);
R(19,:) = Z(:,2,19);
R(20,:) = Z(:,2,20);

Rnorm(1,:) = (R(1,:) - min(R(1,:)))/(max(R(1,:)) - min(R(1,:)));
Rnorm(2,:) = (R(2,:) - min(R(2,:)))/(max(R(2,:)) - min(R(2,:)));
Rnorm(3,:) = (R(3,:) - min(R(3,:)))/(max(R(3,:)) - min(R(3,:)));
Rnorm(4,:) = (R(4,:) - min(R(4,:)))/(max(R(4,:)) - min(R(4,:)));
Rnorm(5,:) = (R(5,:) - min(R(5,:)))/(max(R(5,:)) - min(R(5,:)));
Rnorm(6,:) = (R(6,:) - min(R(6,:)))/(max(R(6,:)) - min(R(6,:)));
Rnorm(7,:) = (R(7,:) - min(R(7,:)))/(max(R(7,:)) - min(R(7,:)));
Rnorm(8,:) = (R(8,:) - min(R(8,:)))/(max(R(8,:)) - min(R(8,:)));
Rnorm(9,:) = (R(9,:) - min(R(9,:)))/(max(R(9,:)) - min(R(9,:)));
Rnorm(10,:) = (R(10,:) - min(R(10,:)))/(max(R(10,:)) - min(R(10,:)));
Rnorm(11,:) = (R(11,:) - min(R(11,:)))/(max(R(11,:)) - min(R(11,:)));
Rnorm(12,:) = (R(12,:) - min(R(12,:)))/(max(R(12,:)) - min(R(12,:)));
Rnorm(13,:) = (R(13,:) - min(R(13,:)))/(max(R(13,:)) - min(R(13,:)));
Rnorm(14,:) = (R(14,:) - min(R(14,:)))/(max(R(14,:)) - min(R(14,:)));
Rnorm(15,:) = (R(15,:) - min(R(15,:)))/(max(R(15,:)) - min(R(15,:)));
Rnorm(16,:) = (R(16,:) - min(R(16,:)))/(max(R(16,:)) - min(R(16,:)));
Rnorm(17,:) = (R(17,:) - min(R(17,:)))/(max(R(17,:)) - min(R(17,:)));
Rnorm(18,:) = (R(18,:) - min(R(18,:)))/(max(R(18,:)) - min(R(18,:)));
Rnorm(19,:) = (R(19,:) - min(R(19,:)))/(max(R(19,:)) - min(R(19,:)));
Rnorm(20,:) = (R(20,:) - min(R(20,:)))/(max(R(20,:)) - min(R(20,:)));

figure
surf(Rnorm);
% % 
% % H_round  = round(H);
% % H_round(1,1) = 100;
% % i = 1;
% % while i < length(H) + 1
% % end

%% Writing the values in polar form and plotting for contouring
i = 1;
rho = -5:5:360;
rho = rho.*(pi/180);
while i < 21
    clearvars -except Zpolar H i rho Z Rnorm resistance theta
    [theta(i,:), resistance(i,:)] = pol2cart(rho,Rnorm(i,:));
    Zpolar(:,1,i) = theta(i,:);
    Zpolar(:,2,i) = resistance(i,:);
    Zpolar(:,3,i) = Z(:,3,i);
    
    plot3(theta(i,:),Zpolar(:,3,i),resistance(i,:));
    
    i = i + 1;
    hold on;
end

hold off;
clear i;

% mesh(resistance);
% hold on;
% mesh(theta);
% hold off;


% polar(rho, Rnorm(1,:),'y');
% hold on
% polar(rho, Rnorm(2,:),'m');
% hold on
% polar(rho, Rnorm(3,:),'c');
% hold on
% polar(rho, Rnorm(4,:),'r');
% hold on
% polar(rho, Rnorm(5,:),'g');
% hold on
% polar(rho, Rnorm(6,:),'b');
% hold on
% polar(rho, Rnorm(7,:),'k');
% hold on
% polar(rho, Rnorm(8,:),'y');
% hold on
% polar(rho, Rnorm(9,:),'m');
% hold on
% polar(rho, Rnorm(10,:),'c');
% hold on
% polar(rho, Rnorm(11,:),'r');
% hold on
% polar(rho, Rnorm(12,:),'g');
% hold on
% polar(rho, Rnorm(13,:),'b');
% hold on
% polar(rho, Rnorm(14,:),'k');
% hold on
% polar(rho, Rnorm(15,:),'y');
% hold on
% polar(rho, Rnorm(16,:),'m');
% hold on
% polar(rho, Rnorm(17,:),'c');
% hold on
% polar(rho, Rnorm(18,:),'r');
% hold on
% polar(rho, Rnorm(19,:),'g');
% hold on
% polar(rho, Rnorm(20,:),'b');
% hold on

