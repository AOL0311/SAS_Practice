/*CHAPTER 14 PRACTICE*/
/*(1)*/
data cf;
	infile 'F:\SAS_TUESDAY\prefer_car.dat';
	input number 1-2 age 3-4 red 6 black 7 white 8 mini 10
			small 11 medium 12 two 14 four 15 five 16;
	length color $5;
	length size $10;
	length door $6;
	if red = 1 then color = 'Red';
	else if white = 1 then color = 'White';
	else if black = 1 then color = 'Black';
	if mini = 1 then size = 'Subcompact';
	else if small = 1 then size = 'Compact';
	else if medium = 1 then size = 'Mid-size';
	if two = 1 then door = '2-door';
	else if four = 1 then door = '4-door';
	else if five = 1 then door = '5-door';
proc freq data = cf;
	tables color size door;
data cf_age;
	set cf;
	length age_group $8;
	if age < 30 then age_group = 'Under 30';
	else if 30 <= age <= 40 then age_group = '30 to 40';
	else if 40 < age then age_group = 'Over 40';
proc freq data = cf_age;
	tables age_group * color / chisq;
proc freq data = cf_age;
	tables age_group * size / chisq;
proc freq data = cf_age;
	tables age_group * door / chisq;
run;

/*(2)*/
data gf;
	infile 'F:\SAS_TUESDAY\eval.dat';
	input student 1-2 q1 4 q2 5 q3 6 q4 7 q5 8 q6 9 q7 10
			q8 11 q9 12 q10 13;
	array qvars q1 - q10;
	do i = 1 to dim(qvars);
		if not (qvars[i] in (1, 2, 3, 4, 5)) then qvars[i] = .;
	end;
proc freq data = gf;
	tables q1 - q10;
proc means data = gf MAX MIN MEAN VAR STD maxdec = 4;
	var q1 - q10;
run;

/*(3)*/
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
data df_level;
	set df;
	level = floor ( room / 100 );
proc sort data = df_level;
	by level sex;
proc freq data = df_level;
	tables sex * level / chisq;
run;