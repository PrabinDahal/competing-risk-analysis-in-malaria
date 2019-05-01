*-----------------------------------------------------------------------------------------------------------------------------------------------
* 	Title:	Competing risk analysis in standalone antimalarial studies
*--------------------------------------------------------------------------------------
* 	stime	: Time to primary event of interest (recrudescence) in days
*	stime2	: Time to competing risk event (new infection)in days
* 	event	: Primary event of interest (recrudescence) (1= recrudescence, 0=otherwise)
* 	event2	: Competing risk event (new infection)	(1= new infection, 0=otherwise)
*	mintime	: Minimum time to recrudescence/new infection. This is set to 14 days.
* 	maxtime	: Minimum time to recrudescence/new infection. This is length of study follow-up and set to 63 days.
*------------------------------------------------------------------------------------------------------------------------------------------------
*	Related Publication: This script was used to generate data for "Simulation study I" described in the following publication:
*	Evaluating antimalarial efficacy in single-armed and comparative drug trials using competing risk survival analysis: A simulation study
*-----------------------------------------------------------------------------------------------------------------------------------------------
*	Version: Stata 15.1
*-----------------------------------------------------------------------------------------------------------------------------------------------

*-----------------------------------------------------------
* Scenario 1a: 5% recrudescence &  <10% new infection
*-----------------------------------------------------------
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

survsim stime event, logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime2 event2, logcumhazard(-5.600422 :+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}

use data1, clear
forval i=2/1000{
append using data`i'
}
save "C:\sim1a_27.02.2018.dta"

*-------------------------------------------------------
* Scenario  1b: 5% recrudescence & 10-20% new infection
*-------------------------------------------------------
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

survsim stime event, logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime2 event2, logcumhazard(-3.990984 :+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}
use data1, clear
forval i=2/1000 {
append using data`i'
}
save "C:\sim1b_27.02.2018.dta"

*-------------------------------------------------------
* Scenario  1c: 5% recrudescence & 20-40% new infection
*-------------------------------------------------------
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

survsim stime event, logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime2 event2, logcumhazard(-3.297837 :+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}
use data1, clear
forval i=2/1000 {
append using data`i'
}
save "C:\sim1c_27.02.2018.dta"

*-------------------------------------------------------
* Scenario  1d: 5% recrudescence & >40% new infection
*-------------------------------------------------------
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

survsim stime event, logcumhazard( -3.709159 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime2 event2, logcumhazard(-2.892372 :+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}
use data1, clear
forval i=2/1000 {
append using data`i'
}
save "C:\sim1d_27.02.2018.dta"

*-----------------------------------------------------
* Scenario 2a: 10% recrudescence & <10% new infection
*-----------------------------------------------------
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

survsim stime event, logcumhazard( -3.016012 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime2 event2, logcumhazard(-5.600422  :+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}
use data1, clear
forval i=2/1000 {
append using data`i'
}
save "C:\sim2a_27.02.2018.dta"

*---------------------------------------------------------
* Scenario 2b:	10% recrudescence & 10-20% new infection
*---------------------------------------------------------
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

survsim stime event, logcumhazard(-3.016012 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime2 event2, logcumhazard(-3.990984  :+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}
use data1, clear
forval i=2/1000 {
append using data`i'
}
save "C:\sim2b_27.02.2018.dta"

*---------------------------------------------------------
* Scenario 2c: 10% recrudescence & 20-40% new infection
*---------------------------------------------------------
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

survsim stime event, logcumhazard( -3.016012 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime2 event2, logcumhazard(-3.297837 :+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}
use data1, clear
forval i=2/1000 {
append using data`i'
}
save "C:\sim2c_27.02.2018.dta"

*---------------------------------------------------------
* Scenario 2d: 10% recrudescence & >40% new infection
*---------------------------------------------------------
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

survsim stime event, logcumhazard( -3.016012 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime2 event2, logcumhazard( -2.892372  :+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}
use data1, clear
forval i=2/1000 {
append using data`i'
}
save "C:\sim2d_27.02.2018.dta"

*--------------------------------------------------------
* Scenario 3a: 15% recrudescence & <10% new infection
*--------------------------------------------------------
clear all
set more off
forval i=1/1000{

set obs 500
gen sim=`i'

survsim stime event, logcumhazard( -2.610546:-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime2 event2, logcumhazard(-5.600422  :+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}
use data1, clear
forval i=2/1000 {
append using data`i'
}
save "C:\sim3a_27.02.2018.dta"

*--------------------------------------------------------
* Scenario 3b: 15% recrudescence & 10-20% new infection
*--------------------------------------------------------
clear all
set more off
forval i=1/20000{

set obs 500
gen sim=`i'

survsim stime event, logcumhazard(-2.610546 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime2 event2, logcumhazard(-3.990984  :+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}
use data1, clear
forval i=2/20000 {
append using data`i'
}
save "C:\sim3b_27.02.2018.dta"

*--------------------------------------------------------
* Scenario 3c: 15% recrudescence & 20-40% new infection
*--------------------------------------------------------
clear all
set more off
forval i=1/20000{

set obs 500
gen sim=`i'

survsim stime event, logcumhazard( -2.610546 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime2 event2, logcumhazard(-3.297837 :+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}
use data1, clear
forval i=2/20000 {
append using data`i'
}
save "C:\sim3c_27.02.2018.dta"

*--------------------------------------------------------
* Scenario 3d: 15% recrudescence & >40% new infection
*--------------------------------------------------------
clear all
set more off
forval i=1/50000{

set obs 500
gen sim=`i'

survsim stime event, logcumhazard( -2.610546 :-  (63.62843 :* (log(#t):^(-1):-0.2849155948)) :-0.3799831 :*((log(#t):^(2) ) :- 12.318776))   mintime(14) maxtime(63)
survsim stime2 event2, logcumhazard( -2.892372  :+ (9501.215 :* (log(#t):^(-2):-.0858274119)) :- 31651.33 :*((log(#t):^(-2) :* log(log(#t))) :-0.1053710362):+ 29340.83:*((log(#t):^(-2) :* log(log(#t)):^(2)) :-0.1293649082):-12690.51:*((log(#t):^(-2) :* log(log(#t)):^(3)) :-0.1588223868))  mintime(14) maxtime(63)

save data`i', replace
clear all
}
use data1, clear
forval i=2/50000 {
append using data`i'
}
save "C:\sim3d_27.02.2018.dta"

