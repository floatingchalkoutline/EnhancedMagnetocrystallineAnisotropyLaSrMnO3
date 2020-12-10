# EnhancedMagnetocrystallineAnisotropyLaSrMnO3
Enhanced Magnetocrystalline Anisotropy in Ultrathin LaSrMnO3 through Nanostructure Engineering
*Notes on AutoAveraging_Forward.m for MATLAB*
*by Daniel Vegerano*
*8/11/15*

Syntax:
==			equal to (for logical comparison statements)
~=			not equal to
>=			greater than or equal to
<=			less than or equal to
H(n,1)			nth row, 1st column of H
H(:,1)			all rows, 1st column of H
H(1,:)			1st row, all columns of H
;			line end
mod(dividend,divisor)	returns the remainder after dividing two values. mod() = 0 means completely divisible		
mode()			function returns most recurring value in set (picks the smallest value if recurrence is equal to another value)
sort()			sorts all values of an array from lowest to highest
clearvars		clears any variables specified following
clearvars -except	will clear all variables with the exception of those specified following
figure			generates a plot window
scatter()		generates a scatter plot of the data in parentheses in the figure
hold on			maintains the current figure and plot as to plot another set of data
hold off		the current figure and plot is the last figure and plot. another iteration of figure will generate a completely new plot
dlmwrite()		writes a .txt file of the data in parentheses. other parameters can be specified in the parentheses.

** This program imports, sorts, averages, and normalizes resistance values and phi values. Must be slowscan/pausescan data **

When data is imported into MATLAB, the import wizard automatically separates it into data columns with incrementing naming convention of the following template: VarName#
The # sign represents the order in which the data is imported. In a single import window, position/theta will be VarName1, resistance will be VarName2, and field will be
VarName3.

> VarName1(isnan(VarName1)) = 0

Sometimes the imported data may have one or more cells with "NaN" as their value. This line prevents the occurrence of NaN throughout the entire set of data by setting NaN to 0 instead.
This usually occurs in the field data/column but can occur in resistance and position data columns as well.

> P = round(VarName1*10)/10;

This line makes it so all position/theta values (sometimes seen as 4.87 or 24.78, for example) become divisible by 5 (set to 5 and 25 respectively) and places them in variable P.

> 	n = 1;
	A = VarName3;
	while mode(A) ~= 0
    		H(n,1) = mode(A);           
    		A = A(A ~= mode(A));
    		n = n + 1;
	end

	H = sort(H);

We set A equal to the entire field data column (VarName3) because we will be changing the length of A upon every iteration of this loop.(We don't want to change our raw imported data) Literally, while 
the most recurring value in this set is not of the value 0, the nth row 1st column value of H is the most recurring value in the set A. Afterwards, the new A is set to the old A with that same
recurring value removed from all the cells that contain it. We add 1 to n as to move to the n + 1 row 1st column of H and begin the loop again to set the next value.
Afterwards the list of most recurring fields is sorted from lowest to highest, using the "sort" function. The list will look like this depending on the fields used:

100
200
300
400
500
600
700
800, etc.

>	h = 1;
	i = 1;
	while i < length(H) + 1
    		clearvars -except H h i P VarName1 VarName2 VarName3 Resistance Z
    		PIndex = find(VarName3 == H(i));                                        
    		CurrentP(:,1) = PIndex;                                                
    		CurrentP(:,2) = P(PIndex(:));

This is the first section of the bulk code; this while loop is quite large. It also contains other while loops within it. h and i are variables simply used for counting. Literally, while i is less than 
one plus the length of our H (all fields) vector matrix, all variables that aren't in the "clearvars -except" line will be deleted (mostly to be used upon the next iteration). The next line sets PIndex (Position Index) to a vector matrix whose values are all 
of the indices of field (VarName3) where the ith value of H can be found. Obviously the first iteration looks for the indices where VarName3 = 100 (the first number in the H set). We then sets all rows of  1st column of 
CurrentP (Current Position) to the those indices. Then we use those same indices to extract the adjacent position values (in P). CurrentP variable is now a 2 column matrix (indices in 1st column, position in 2nd).

>	j = 1;
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
                   
2nd Section of the bulk code. j is a counting variable. Literally, while the value of j is less than the length of CurrentP, AND IF the j + 1 row 2nd column value of CurrentP is greater than or equal
to the jth row 2nd column value, AND IF the jth row 2nd column value is less than 365, THEN the jth row 1st column of variable B is the jth row 1st column of Current P. Likewise the jth row 2nd column of variable
B will be equal to the jth row 2nd column of CurrentP. The elseif condition is skipped in this case because the if condition was met. From there it the j is incremented and the loop starts over.
If the j + 1 row 2nd column value of CurrentP is greater than or equal to the jth row 2nd column value, EXCEPT THIS TIME the jth row 2nd column of CurrentP is equal to 365, then this whole while loop
will stop and the code will continue. THIS WHOLE SET OF LINES ACCOUNTS FOR FORWARD ROTATIONS THROUGH 365 DEGREES and ignores the backwards rotation data.

>	m = 1;
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

3rd Section of the bulk code. m and l are counting variables. Literally, while l is less than one plus the length of CurrentP, if the remainder is 0 after dividing the lth row 2nd column value by 5, then
that lth row 1st and 2nd column values get placed into the mth row 1st and 2nd column values in variable NewP1. Afterwards both m and l increment. If, the remainder is not 0 however, then nothing happens
and l will increment as to check the next value of CurrentP for a 0 remainder. THIS WHOLE SET OF LINES ACCOUNTS FOR GATHERING DATA FROM -5 TO 365 IN 5 STEP INCREMENTS.

>	[P1,P2] = sort(NewP1(:,2));
    	NewP1 = NewP1(P2,:);

4th Section of the bulk code. This section isn't actually required for THIS MATLAB script, only for other versions where both forward and backward rotations are considered and averaged together. P1 keeps
track of the values being sorted whereas P2 keeps track of the indices and what order they are being moved to. This, in turn, can be used to organize every position value in the exact order of -5 to 365 in steps
of 5 regardless of forward or backward rotation.
