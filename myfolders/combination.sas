DATA YR1998;
INPUT Day $ 1-5 Temp Weather $ 10-15;
DATALINES;
JAN 1 33 SUN
JAN 2 35 SUN
JAN 3 45 CLOUDS
JAN 5 28 SNOW
;
RUN;

PROC PRINT DATA=YR1998;
RUN;
 
DATA YR1999;
INPUT Day $ 1-5 Temp;
DATALINES;
JAN 1 25
JAN 2 20
JAN 3 35
JAN 6 40
JAN 8 39
;
RUN;

PROC PRINT DATA=YR1999;
RUN;

/*CONCATENATING*/
DATA concatenation;
	SET YR1998 YR1999;
RUN;

PROC PRINT data=concatenation;
RUN;

/*INTERLEAVING*/

PROC SORT data=YR1998;
BY Day; 
RUN;

PROC SORT data=YR1999;
BY Day; 
RUN;

DATA combined2;
SET YR1998 YR1999;
BY Day; RUN;
PROC PRINT data=combined2; RUN;

/* MERGING */
DATA combined3;
MERGE YR1998 YR1999;
RUN;
PROC PRINT data=combined3;
RUN;

/* MATCH MERGE */
DATA combined4;
MERGE YR1998 YR1999;
BY Day;
RUN;
PROC PRINT data=combined4;
RUN;