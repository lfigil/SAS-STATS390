FILENAME dataIn '/folders/myfolders/corn.txt';
DATA corn;
	INFILE dataIn;
	INPUT year yield rain;
	IF yield < 32 THEN catyield='poor';
	IF yield >= 32 THEN catyield='good';
	IF rain <= 9.7 THEN catrain='drought';
	IF 9.7 < rain <= 12 THEN catrain='normal';
	IF rain > 12 THEN catrain='wet';
	
RUN;

PROC PRINT DATA=corn;
RUN;

PROC freq DATA=corn;
TITLE 'Corn dataset frequency table';
run;

PROC freq DATA=corn;
TABLES catyield*catrain /chisq;
run;