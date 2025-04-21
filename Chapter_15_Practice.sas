/*CHAPTER 15 PRACTICE*/
/*(1)*/
data of;
	do group = 1 to 2;
		do i = 1 to 30;
			value = rannor( 77 );
			output;
		end;
	end;
proc ttest data = of;
	class group;
	var value;
run;

/*(2)*/
data wf;
	input shift $ score;
	datalines;
day 72
day 66
day 89
day 87
day 78
day 92
day 69
day 76
day 80
day 77
night 74
night 86
night 76
night 92
night 84
night 79
night 86
night 89
night 90
night 82
;
proc ttest data = wf;
	class shift;
	var score;
run;

/*(3 - 4)*/
data sf;
	input sex $ age swimming jogging ball_games;
	datalines;
M 27 1.2 0.2 3.3
M 42 0.7 1.5 2.1
M 37 0 1.2 2.0
M 26 1.2 0.6 3.4
M 53 2.4 0 0
M 24 1.8 0 3.6
M 33 0 0.3 2.7
M 48 2 0 2.5
F 44 1.2 0.8 0.4
F 28 1.6 1.1 2.1
F 36 2.0 0.6 1.9
F 46 2.2 0.3 0
F 24 1.4 0 1.7
F 32 1.5 0 2.1
F 25 0 1.0 2.6
F 30 0 0.5 1.8
;
proc ttest data = sf NOBYVAR;
	class sex;
	var swimming jogging ball_games;
proc ttest data = sf;
	paired swimming * jogging;
run;

/*(5)*/
data bf;
	input school $ score num;
	datalines;
JU 22.2 1
JU 12.6 2
JU 16.1 3
JU 8.2 4
JU 19 5
JU 9.5 6
JU 22.3 7
JU 11.5 8
JU 19.7 9
JU 14.3 10
CU 11.4 1
CU 13.2 2
CU 12 3
CU 16.6 4
CU 20.1 5
CU 14.3 6
CU 16.8 7
CU 15.4 8
CU 14.2 9
CU 16.1 10
;
proc ttest data = bf;
	class school;
	var score;
run;