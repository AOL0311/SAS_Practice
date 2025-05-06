libname DF 'C:\Users\CSMU\Downloads';
run;

data df;
	set DF.Hedata;
	if BMI < 18.5 then BMIG = 0;
	else if 18.5 <= BMI <24 then BMIG = 1;
	else if 24 <= BMI then BMIG = 2;

	if HbA1C < 5.6 then HbA1CG = 0;
	else if 5.6 <= HbA1C then HbA1CG =1;
proc sort data = df;
	by BMIG;
run;

proc ttest data = df;
	class HbA1CG;
	var TC;
	by BMIG;
run;

proc univariate data = df;
	class HbA1CG;
	var TC;
	by BMIG;
proc npar1way data = df WILCOXON;
	class HbA1CG;
	var TC;
	by BMIG;
run;

data df_Hb_BM;
	set df;
proc sort data = df_Hb_BM;
	by HbA1CG BMIG;
proc ttest data = df_Hb_BM;
	paired IOPL * IOPR;
	by HbA1CG BMIG;
run;

data df_IOP;
	set df;
	IOPD = IOPL - IOPR;
proc univariate data = df_IOP;
	class HbA1CG;
	var IOPD;
	by BMIG;
run;
