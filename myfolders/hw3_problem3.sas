FILENAME wineSet '/folders/myfolders/wine.data';
DATA wine;
	INFILE wineSet delimiter=',';
	INPUT iden alco mali ash alca magn tota flav nonf proa colo hue od28 prol;
	LABEL iden= 'Identifier' alco= 'Alcohol' mali= 'Malic acid' ash= 'Ash' 
		  alca='Alcalinity of ash' magn= 'Magnesium' tota= 'Total phenols' 
		  flav='Flavanoids' nonf= 'Nonflavanoid phenols' proa= 'Proanthocyanins' 
		  colo= 'Color intensity' hue= 'Hue' od28= 'OD280/OD315 of diluted wines'
		  prol='Proline';
TITLE Wine Summary Data;

/*
PROC PRINT DATA=wine LABEL NOOBS;
RUN;
*/

PROC MEANS DATA=wine;	/*Generate descriptive statistics*/
RUN;

PROC UNIVARIATE DATA=wine normal plot;  /*use both of the normal and plot options*/
VAR mali;
ID iden;
RUN;

PROC CHART DATA=wine;	/*Generate vertical histogram*/
VBAR mali/subgroup=iden;
TITLE1 'Histogram of Malic acid from wine dataset';
RUN;

PROC PLOT DATA=wine;	/*Generate scatter plot*/
BY iden;
plot mali*ash;
run;