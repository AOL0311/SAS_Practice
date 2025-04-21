/*CHAPTER 11 PRACTICE*/
/*DATA*/
data kf;
	/*In Github Already*/
	infile 'F:\SAS_TUESDAY\achieve.dat';
	input iv1 1 grade 2 iv2 3 sex $ 4 id $ 6-8 vocab 25-26 
			reading 27-28 spelling 29-30 capital 31-32 punc 33-34 
			usage 35-36 total1 37-38 maps 39-40 graphs 41-42 
			refer 43-44 total2 45-46 concepts 47-48 problem 49-50
			total3 51-52 composite 53-54;
proc print data = kf;
run;

/*(1)*/
proc means data = kf maxdec = 4;
	var reading punc;
	class grade sex;
run;

/*(2)*/
proc sort data = kf out = kf_grade_sex;
	by grade sex;
proc means data = kf_grade_sex maxdec = 4;
	var reading punc;
	by grade sex;
run;

/*DATA FOR 3 AND 4*/
data K;
	input score;
datalines;
87
65
92
66
58
73
.
82
86
77
96
60
81
.
69
76
80
90
71
;
run;

/*(3)*/
proc means data = K
	MAX MIN MEAN STD NMISS maxdec = 4;
run;

/*(4)*/
proc ttest data = b h0 = 80;
run;
	/*	檢定值 = -1.10
		顯著性 = 0.2870
		95% 下限 = 71.2258
		95% 上限 = 82.7742
		無法推翻虛無假設 ( 包含 80 )*/