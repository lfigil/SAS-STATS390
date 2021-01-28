/* Create first dataset */

DATA One;
INPUT ID age name $;
DATALINES;
1001 21 Jone
1002 20 Peter
1003 22 Mary
1004 19 Joe
1005 21 Mark
1006 23 Sue
1007 19 Harry
1008 18 Tom
1009 22 Andy
1020 21 Larry
;
RUN;

PROC PRINT DATA=One;
RUN;

/* Create second dataset*/

DATA Two;
INPUT ID gender $ department $;
DATALINES;
1006 F Econ
1007 M Econ
1008 M Math
1009 M Stat
1010 M Stat
1001 M Econ
1002 M Stat
1003 F Econ
1004 F Econ
1005 M Fina
;
RUN;

PROC PRINT DATA=Two;
RUN;

/* Use concatenation combination*/

DATA concatenation;
	SET One Two;
RUN;

PROC PRINT DATA=concatenation;
RUN;

/* Use match merge combination */
/* First, we need to sort our data using one common feature
   between both datasets. In this case, ID is the common one.
   Then, we can use match merge.
*/

PROC SORT DATA=One;
BY ID;
RUN;

PROC SORT DATA=Two;
BY ID;
RUN;

DATA merging;
	MERGE One Two;
	BY ID;
RUN;

PROC PRINT DATA=merging;
RUN;


