OPTIONS LINESIZE=65 NODATE;
FILENAME oilcost '/folders/myfolders/oil_costs_p1.txt';
DATA oilcost;
	INFILE oilcost firstobs=5;
	INPUT Date Domestic Imported Composite;
	newDomestic = Domestic - 20;
	newImported = Imported - 15;
	avgDifference = Domestic - Imported;
RUN;
/*  */
/* PROC PRINT DATA=oilcost; */
/* RUN; */

/*
Use PROC PLOT to plot:
a)domestic vs date, without any other options
*/

PROC PLOT DATA = oilcost;
PLOT Domestic*Date;
RUN;

/*
b)imported vs date, with the character '%' as the indicator
*/

PROC PLOT DATA = oilcost;
PLOT Imported*Date = '%';
RUN;

/*
c)domestic vs date,and import vs date separately but on the same page.
*/
PROC PLOT DATA = oilcost;
PLOT Domestic*Date='D' Imported*Date='I' /overlay;
RUN;


/*
a)Is the (true) average Domestic Crude Oil Refiner Acquisition 
costs smaller than $20 per Barrel?
For part a. one sample one-sided t-test; 
*/

PROC MEANS DATA = oilcost N MEAN STD T PRT;
	TITLE1 'One Sample one-sided t-test';
	VAR newDomestic;
RUN;

/*
b)Is the (true) average Imported Crude Oil Refiner Acquisition 
costs different from $15 per Barrel?
For part b. one sample two-sided t-test; 
*/

PROC MEANS DATA = oilcost N MEAN STD T PRT;
	TITLE1 'One Sample two-sided t-test';
	VAR newImported;
RUN;

/*
c)Are the average Domestic and average Imported Crude OilRefiner 
Acquisition costs different? 
For part c. probably a paired t-test is more reasonable;
*/
PROC MEANS DATA = oilcost N MEAN STDERR T PRT;
	TITLE1 'Paired Sample t-test';
	TITLE2 'Avg Domestic and Imported Cruce costs';
	VAR avgDifference;
RUN;

/*
d)Assume the collected data are not related to the dates, then are 
the average Domestic and average Imported Crude Oil Refiner Acquisition 
costs different?
(Hint: use this dataset to do the two sample t-test.)
For part d. two sample t-test; equal variances or unequal? 

EQUAL VARIANCES
*/

FILENAME oilcost2 '/folders/myfolders/oil_costs_p2.txt';
DATA oilcost2;
	INFILE oilcost2;
	INPUT oilCost id;
	IF id = 1 THEN id2 = 'Domestic';
	ELSE id2 = 'Imported';
RUN;

TITLE1 'Two Sample t-Test';
PROC TTEST DATA = oilcost2;
CLASS id2;
VAR oilCost;
RUN;

/*
e)Use PROC ANOVA to do d) again. Compare the t statistic used in d) and 
the F statistic in e). Do they have any relationship? Also, compare the p-values.
*/

PROC ANOVA DATA = oilcost2;
CLASS id2;
MODEL oilCost = id2;
MEANS id2 / TUKEY;
TITLE1 'ANOVA TEST';
RUN;