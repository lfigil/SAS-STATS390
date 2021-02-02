DATA mydata2;
    INPUT @5 name $char18. from $ 20-30 to $ 32-42 pounds_million 43-48 ;
    DATALINES;
    Benjamin Mendy Monaco      Man City   52.0
    Alvaro Morata  Real Madrid Chelsea    58.0
    Romelu Lukaku  Everton     Man United 75.0
    Neymar         Barcelona   PSG        199.8
    ;
RUN;