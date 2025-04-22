/*CHAPTER 12 PRACTICE*/
/*DATA*/
data df;
	/*In Github Already*/
	infile 'F:\SAS_TUESDAY\achieve.dat';
	input iv1 1 grade 2 iv2 3 sex $ 4 id $ 6-8 vocab 25-26 
			reading 27-28 spelling 29-30 capital 31-32 punc 33-34 
			usage 35-36 total1 37-38 maps 39-40 graphs 41-42 
			refer 43-44 total2 45-46 concepts 47-48 problem 49-50
			total3 51-52 composite 53-54;
proc print data = df;
run;

/*(1)*/
ODS select Plots;
proc univariate data = df normal plot;
	var punc;
run;
	/*	均數 = 49.4
		標準差 = 13.9527
		負偏態 = Skewness = -0.1375
		較常態峰平緩 = Kurtosis = -0.4765
		P值 = 0.1516
		無法推翻虛無假設*/

/*(2)*/
data random;
	do i = 1 to 30;
		x = rannor ( 77 );
		output;
	end;
proc univariate data = random normal plot;
	var x;
run;