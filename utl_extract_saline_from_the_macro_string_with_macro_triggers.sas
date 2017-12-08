Extract SALINE from the macro string 5% SALINE+2%NAHCO399996.6%

  PROBLEM
  =======

     Extract SALINE from the macro string 5% SALINE+2%NAHCO399996.6%


  THREE SOLUTIONS
  ===============

    1  %symdel have want / nowarn;
       %let want=%sysfunc(scan('5% SALINE+2%NAHCO399996.6%',2,' +'));
       %put &=want;

    2  %symdel have want / nowarn;
       %let rc=%sysfunc(dosubl('
            data _null_;
               want="5% SALINE+2%NAHCO399996.6%";
               put want=;
               call symputx("want",scan(want,2," +"),"G");
            run;quit;
       '));

       %put &=want;


    3  Load messy input string into macro variable

       %symdel have want / nowarn;
       %let rc=%sysfunc(dosubl('
          data _null_;
             call symputx('have','5% SALINE+2%NAHCO399996.6%');
          run;quit;
       '));

       %put &=have;

       * extract substring;
       %let rc=%sysfunc(dosubl('
          data _null_;
             call symputx("want",scan(symget("have"),2," +"));
          run;quit;
       '));

       %put &=want;


https://goo.gl/AMUtMp
https://communities.sas.com/t5/General-SAS-Programming/Issue-with-the-quot-quot-Special-Character-in-a-qscan-macro/m-p/419571


