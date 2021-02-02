/*1)Read this data file in SAS by using INFILE statement.
	Call this dataset tennis. Print it out. */
FILENAME tennis '/folders/myfolders/tennis.dat';
DATA tennis;
	INFILE tennis firstobs=3;
	INPUT name $char21. matches wins losses bagels_served bagels_eaten male;
RUN;

PROC PRINT DATA=tennis;
RUN;

/*2)Create a new dataset called tennis1 by keeping the following variables: 
    name, matches, wins, losses and male. Print it out.*/
DATA tennis1;
	SET tennis;
	drop bagels_served bagels_eaten;
RUN;

PROC PRINT DATA=tennis1;
RUN;

/*3)Create a new dataset called tennis2 by adding two variables to tennis1: 
  pct and tour, such that pct=wins/matches, tour = ATP if male=1,tour =WTA 
  if male=0. Print it out.*/
 
DATA tennis2;
	SET tennis1;
	pct = wins/matches;
	if male = 1 then tour = 'ATP';
	if male = 0 then tour = 'WTA';
RUN;

PROC PRINT DATA=tennis2;
RUN;

/*4)Create a new dataset called tennis3 by sorting dataset tennis2 by 
  variable pct descending order. Print it out.*/

DATA tennis3;
	SET tennis2;
RUN;

PROC SORT DATA=tennis3 OUT=pctsort;
BY DESCENDING pct;

RUN;

PROC PRINT DATA=pctsort;
RUN;

/*5)Split dataset tennis3 into two new datasets called atpdata with male =1 
  and wtadata with male=0. Print it out.*/

DATA aptdata wtadata;
	SET tennis3;
	IF male = 1 THEN OUTPUT aptdata;
	ELSE OUTPUT wtadata;
RUN;

PROC PRINT DATA= aptdata;
RUN;

PROC PRINT DATA= wtadata;
RUN;
 
/*6)Write name and pct of atpdata to an external file called ‘atp_rankings.txt’. 
	Print this file out. */

FILENAME dataout '/folders/myfolders/atp_rankings.txt';
DATA apt_ranking;
	SET aptdata;
	KEEP name pct;
	FILE dataout;
	PUT name pct;
RUN;


