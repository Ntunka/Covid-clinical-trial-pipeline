libname clinwork "/home/u64501949/clinical_project";

proc import datafile="/home/u64501949/clinical_project/ORIGINAL COVID clinical trials 2 .csv" 
		dbms=csv out=clinwork.covid_raw replace;
	getnames=yes;
run;

proc contents data= clinwork.covid_raw varnum;
run;

proc sort data= clinwork.covid_raw out= clinwork.covid_clean nodupkey;
	by "NCT Number"N;
run;

title "Global COVID-19 Clinical Trial Registry Pipeline";

proc print data= clinwork.covid_clean(obs=15);
	var "NCT Number"N Title Status Enrollment "Study type"N;
	
	where status = "Completed"
	and "Study type"N = "Interventional
run;
title;

