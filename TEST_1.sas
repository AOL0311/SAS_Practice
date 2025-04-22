libname data 'F:\SAS_TUESDAY';
run;

/*Setting DATA*/
data df;
	set data.hedata;
data df_age;
	set df;
	if age >= 40 then age_group = 1;
	else if age < 40 then age_group = 2;
proc sort data = df_age;
	by age_group;
run;

/*Mean & SD & DF & t value & Pr > |t|*/
proc ttest data = df_age;
	class sex;
	var TC;
	by age_group;
run;

/*Median & IQR (Q3 - Q1)*/
proc univariate data = df_age;
	class sex;
	var Bodyfat;
	by age_group;
/*Z value & Pr > |Z|*/
proc npar1way data = df_age wilcoxon;
	class sex;
	var Bodyfat;
	by age_group;
run;

/*Mean & SD & DF & t value & Pr > |t|*/
data df_sex_age;
	set df_age;
proc sort data = df_sex_age;
	by sex age_group;
proc ttest data = df_sex_age;
	paired iopl * iopr;
	by sex age_group;
run;

data df_iop;
	set df_age;
	IOPD = IOPL - IOPR;
run;
/*Median & IQR (Q3 - Q1)*/
/*S value & Pr > |S|*/
proc univariate data = df_iop;
	class sex;
	var IOPD;
	by age_group;
run;