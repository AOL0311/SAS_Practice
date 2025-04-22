/*CHAPTER 6 PRACTICE*/
/*DATA*/
data df;
	input name $ sex $ age room ses $ income;
datalines;
ANDY M 28 122 H 9.6
ANNE F 58 404 H 10.2
CHARLIE M 54 222 M 4.7
DAVID M 47 117 M 5.2
DICKENS M 37 135 M 6.3
LANDERS M 40 216 M 5.8
LINDA F 20 425 M 5.5
LOUIS M 34 213 L 2.3
MICHAEL M 25 118 M 6.0
PETER M 65 108 L 3.3
PUTH F 39 430 L 1.3
REBECCA F 43 423 M 7.1
RICHARD M 28 240 H 9.2
SAM M 36 231 M 6.4
SHEILA F 24 336 M 5.7
SOPHIA F 42 412 M 7.4
TED M 68 101 H 8.8
TIM M 27 115 H 8.2
TINA F 31 302 M 4.3
WOLF M 51 104 H 8.4
;

/*(A)*/
proc sort data = df out = df_name;
	by name;
proc print data = df_name;
run;

/*(B)*/
data df_level;
	set df;
	level = floor ( room / 100 );
proc sort data = df_level;
	by level;
proc print data = df_level;
run;

/*(C)*/
data df_age;
	set df;
	if 20 <= age <= 29 then age_group = 1;
	else if 30 <= age <= 39 then age_group = 2;
	else if 40 <= age <= 49 then age_group = 3;
	else if 50 <= age <= 59 then age_group = 4;
	else if 60 <= age <= 69 then age_group = 5;
	else age_group = 9;
proc sort data = df_age;
	by age_group;
proc means data = df_age sum;
	by age_group;
	var income;
run;

/*(D)*/
/*/*WAY 1*/*/
proc sort data = df out = df_ses;
	by ses;
proc means data = df_ses sum;
	by ses;
	var income;
run;

/*/*WAY 2*/*/
proc sort data = df out = df_ses;
    by ses;
proc print data = df_ses;
    by ses;
    sum income;
    sumby ses;
run;