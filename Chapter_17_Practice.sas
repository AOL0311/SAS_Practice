/*CHAPTER 17 PRACTICE*/
/*(1)*/
data cf;
	input customer score;
	length wear $4;
	if customer <= 5 then wear = 'Good';
	else wear = 'Bad';
	datalines;
1 2
2 1
3 1
4 2
5 4
6 5
7 3
8 4
9 7
10 6
;
proc npar1way data = cf wilcoxon;
	class wear;
	var score;
run;

/*(2)*/
data sf;
	input sex $ score;
	length grade $2;
	if 90 <= score then grade = 'A+';
	else if 85 <= score <= 89 then grade = 'A';
	else if 80 <= score <= 84 then grade = 'B+';
	else if 75 <= score <= 79 then grade = 'B';
	else if 70 <= score <= 74 then grade = 'B-';
	else if 65 <= score <= 69 then grade = 'C+';
	else if 60 <= score <= 64 then grade = 'C';
	else grade = 'F';
	datalines;
Boy 87
Boy 64
Boy 89
Boy 83
Boy 96
Boy 78
Boy 68
Boy 78
Boy 69
Boy 74
Girl 78
Girl 75
Girl 86
Girl 72
Girl 82
Girl 85
Girl 81
Girl 77
Girl 71
Girl 80
;
proc npar1way data = sf wilcoxon;
	class sex;
	var score;
run;

(17 - 20) 不會

data df;
	input group score;
	datalines;
1 19
1 21
1 28
1 30
2 17
2 18
2 13
2 12
3 17
3 16
3 11
3 15
4 20
4 25
4 30
4 33
5 14
5 10
5 9
5 11
;
/*(4 - A)*/
proc npar1way data = df anova;
	class group;
	var score;
/*(4 - B)*/
proc npar1way data = df wilcoxon;
	class group;
	var score;
	EXACT;
run;