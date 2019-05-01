*-----------------------------------------------------------------------------------------------------------------------------------------------
* 	Title	: Competing risk analysis in standalone antimalarial studies
*-------------------------------------------------------------------------------------------------------------
*	stime_drugA_rc	: Time to primary event of interest (recrudescence) in days for drug A
*	stime_drugA_ri	: Time to competing risk event (new infection) in days for drug A
* 	event_A			: Primary event of interest (recrudescence) (1= recrudescence, 0=otherwise) for drug A
* 	event2_A		: Competing risk event (new infection)	(1= new infection, 0=otherwise) for drug A
*-------------------------------------------------------------------------------------------------------------
*	stime_drugB_rc	: Time to primary event of interest (recrudescence) in days for drug B
*	stime_drugB_ri	: Time to competing risk event (new infection) in days for drug B
* 	event_B			: Primary event of interest (recrudescence) (1= recrudescence, 0=otherwise) for drug B
* 	event2_B		: Competing risk event (new infection)	(1= new infection, 0=otherwise) for drug B
*-------------------------------------------------------------------------------------------------------------
*	mintime			: Minimum time to recrudescence/new infection. This is set to 14 days.
* 	maxtime			: Minimum time to recrudescence/new infection. This is length of study follow-up and set to 63 days.
*------------------------------------------------------------------------------------------------------------------------------------------------
*	Related Publication: This script was used to generate data for "Simulation study II" described in the following publication:
*	Evaluating antimalarial efficacy in single-armed and comparative drug trials using competing risk survival analysis: A simulation study
*-----------------------------------------------------------------------------------------------------------------------------------------------
*	Version: Stata 15.1
*-----------------------------------------------------------------------------------------------------------------------------------------------

*-----------------------------------------------------------------------------------
* Scenario 1a: Drug B has same effect on recrudescence and new infection as Drug A
*-----------------------------------------------------------------------------------
set seed 9413859
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

// reference drug (drug A)
survsim stime_drugA_rc event2_A , logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugA_ri event2_A, logcumhazard( -2.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

// new drug (drug B)
survsim stime_drugB_rc event2_B , logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugB_ri event2_B, logcumhazard( -2.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}

use data1, clear
forval i=2/1000{
append using data`i'
}
save "C:\sim1a_27.02.2018.dta"

*---------------------------------------------------------------------------------------------------------------
* Scenario 1b: Drug B has the same effect on recrudescence as drug A but is associated with higher new infection 
*---------------------------------------------------------------------------------------------------------------
set seed 9413859
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

// reference drug (drug A)
survsim stime_drugA_rc event2_A, logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugA_ri event2_A, logcumhazard( -2.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

// new drug (drug B)
survsim stime_drugB_rc event2_B, logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugB_ri event2_B, logcumhazard( -1.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)
save data`i', replace
clear all
}

use data1, clear
forval i=2/1000{
append using data`i'
}
save "C:\sim1b_27.02.2018.dta"

*---------------------------------------------------------------------------------------------------------------
* Scenario 1c: Drug B has the same effect on recrudescence as drug A but is associated with lower new infection 
*---------------------------------------------------------------------------------------------------------------
set seed 9413859
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

// reference drug (drug A)
survsim stime_drugA_rc event2_A , logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugA_ri event2_A, logcumhazard( -2.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

// new drug (drug B)
survsim stime_drugB_rc event2_B , logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugB_ri event2_B, logcumhazard( -3.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}

use data1, clear
forval i=2/1000{
append using data`i'
}
save "C:\sim1c_27.02.2018.dta"


*--------------------------------------------------------------------------------------------------------------------
* Scenario 2a:Drug B has the same effect on new infection as drug A, but is associated with increased recrudescence
*--------------------------------------------------------------------------------------------------------------------
set seed 9413859
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

// reference drug (drug A)
survsim stime_drugA_rc event2_A , logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugA_ri event2_A, logcumhazard( -2.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

// new drug (drug B)
survsim stime_drugB_rc event2_B , logcumhazard( -2.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugB_ri event2_B, logcumhazard( -2.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}

use data1, clear
forval i=2/1000{
append using data`i'
}
save "C:\sim2a_27.02.2018.dta"

*--------------------------------------------------------------------------------------------------------------------
* Scenario 2b:Drug B has the same effect on new infection as drug A, but is associated with decreased recrudescence
*--------------------------------------------------------------------------------------------------------------------
set seed 9413859
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

// reference drug (drug A)
survsim stime_drugA_rc event2_A , logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugA_ri event2_A, logcumhazard( -2.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

// new drug (drug B)
survsim stime_drugB_rc event2_B , logcumhazard( -4.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugB_ri event2_B, logcumhazard( -2.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}

use data1, clear
forval i=2/1000{
append using data`i'
}
save "C:\sim2b_27.02.2018.dta"

*--------------------------------------------------------------------------------------------------------------------
* Scenario 3a:Drug B is associated with increased recrudescence and increased new infection compared to drug A
*--------------------------------------------------------------------------------------------------------------------
set seed 9413859
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

// reference drug (drug A)
survsim stime_drugA_rc event2_A, logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugA_ri event2_A, logcumhazard( -2.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

// new drug (drug B)
survsim stime_drugB_rc event2_B, logcumhazard( -2.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugB_ri event2_B, logcumhazard( -1.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}

use data1, clear
forval i=2/1000{
append using data`i'
}
save "C:\sim3a_02.2018.dta"

*--------------------------------------------------------------------------------------------------------------------
* Scenario 3b:Drug B is associated with increased recrudescence and decreased new infection compared to drug A
*--------------------------------------------------------------------------------------------------------------------
set seed 9413859

clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

// reference drug (drug A)
survsim stime_drugA_rc event2_A, logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugA_ri event2_A, logcumhazard( -2.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

// new drug (drug B)
survsim stime_drugB_rc event2_B, logcumhazard( -2.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugB_ri event2_B, logcumhazard( -3.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}

use data1, clear
forval i=2/1000{
append using data`i'
}
save "C:\sim3b_27.02.2018.dta"

*--------------------------------------------------------------------------------------------------------------------
* Scenario 3c:Drug B is associated with decreased recrudescence and increased new infection compared to drug A
*--------------------------------------------------------------------------------------------------------------------
set seed 9413859
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

// reference drug (drug A)
survsim stime_drugA_rc event2_A, logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugA_ri event2_A, logcumhazard( -2.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

// new drug (drug B)
survsim stime_drugB_rc event2_B, logcumhazard( -4.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugB_ri event2_B, logcumhazard( -1.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}

use data1, clear
forval i=2/1000{
append using data`i'
}
save "C:\sim3c_27.02.2018.dta"

*--------------------------------------------------------------------------------------------------------------------
* Scenario 3d:Drug B is associated with decreased recrudescence and decreased new infection compared to drug A
*--------------------------------------------------------------------------------------------------------------------
set seed 9413859

clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

// reference drug (drug A)
survsim stime_drugA_rc event2_A, logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugA_ri event2_A, logcumhazard( -2.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

// new drug (drug B)
survsim stime_drugB_rc event2_B, logcumhazard( -4.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime_drugB_ri event2_B, logcumhazard( -3.892372:+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}

use data1, clear
forval i=2/1000{
append using data`i'
}
save "C:\sim3d_27.02.2018.dta"
