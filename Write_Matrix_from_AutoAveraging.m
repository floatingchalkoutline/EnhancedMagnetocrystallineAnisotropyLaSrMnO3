clearvars r s Rnorm;

A(1,:) = Z(:,2,1);
A(2,:) = Z(:,2,2);
A(3,:) = Z(:,2,3);
A(4,:) = Z(:,2,4);
A(5,:) = Z(:,2,5);
A(6,:) = Z(:,2,6);
A(7,:) = Z(:,2,7);
A(8,:) = Z(:,2,8);
A(9,:) = Z(:,2,9);
A(10,:) = Z(:,2,10);
A(11,:) = Z(:,2,11);
A(12,:) = Z(:,2,12);
A(13,:) = Z(:,2,13);
A(14,:) = Z(:,2,14);
A(15,:) = Z(:,2,15);
A(16,:) = Z(:,2,16);
A(17,:) = Z(:,2,17);
A(18,:) = Z(:,2,18);
A(19,:) = Z(:,2,19);

k = 1;
clear phi_all
while k < length(A(:,1)) + 1
    s = (A(k,28) - A(k,10))/2;
    r = (A(k,28) + A(k,10))/2;

    R = A(k,:);
    Rnorm = (R - r)/s;
    Rnorm_all(k,:) = Rnorm;

    l = 1;
    while l < length(Rnorm) + 1
        if Rnorm(1,l) > 1
            Rnorm(1,l) = 1;
        elseif Rnorm(1,l) < -1
            Rnorm(1,l) = -1;
        end
        l = l + 1;
    end
    clear l;

    phi = (0.5)*(asin(Rnorm));
    phi = phi*(180/pi);

    phi_all(k,:) = phi;
    
    clear phi
    k = k + 1;
end