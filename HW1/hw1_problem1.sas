OPTIONS linesize=74;
DATA mydata;
    INPUT name $ Score1 Score2 Score3 Score4 Score5 final @@;
    DATALINES;
    Gamma1 11.25 9.75 10 10 10 90 Delta1 9.5 7.5 8 10 10 95 
    Epsilon1 11.5 10 9.75 3.5 10 100 Theta1 12.5 10 9.5 9 10 100
    ;
RUN;
PROC print data=mydata;
    var name Score3 final;
RUN;