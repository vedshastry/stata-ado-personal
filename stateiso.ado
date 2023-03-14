/*
`stateiso`
Last updated - Vedarshi Shastry, Nov 22

dependencies: `strkeep`

stateiso takes a state list as input and assigns 2 letter ISO codes

*/

prog stateiso
syntax varlist

qui	foreach state in `varlist' {

		* copy raw variable for debug
		clonevar `state'_raw = `state'

		* cleanup variable
		strkeep `state', alpha strlower replace

		* state names
		replace `state' = "jammukashmir" if inlist(`state', "jammukashmir", "jmjammukashmir", "jammu", "jk")
		replace `state' = "himachalpradesh" if inlist(`state', "himachalpradesh", "hphimachalpradesh", "himachal", "hp", "bilaspur")
		replace `state' = "punjab" if inlist(`state', "punjab", "pjpunjab", "panjab", "pb")
		replace `state' = "chandigarh" if inlist(`state', "chandigarh", "sahibzadaajitsinghnagar")
		replace `state' = "uttarakhand" if inlist(`state', "ut", "uttaranchal","uttrakhand", "uk", "uttranchal")
		replace `state' = "haryana" if inlist(`state', "haryana", "hrharyana", "hr")
		replace `state' = "delhi" if inlist(`state', "delhincr", "delhi", "dldelhi", "newdelhi", "nationalcapitalterritorydelhi", "nctdelhi", "nct", "dl", "nctofdelhi")
		replace `state' = "rajasthan" if inlist(`state', "rajasthan", "rjrajasthan", "rj")
		replace `state' = "uttarpradesh" if inlist(`state', "uttarpradesh", "uputtarpradesh", "uttarapradesh", "up")
		replace `state' = "bihar" if inlist(`state', "bihar", "bhbihar", "br", "bh")
		replace `state' = "sikkim" if inlist(`state', "sikkim", "sksikkim", "sk")
		replace `state' = "arunachalpradesh" if inlist(`state', "arunachalpradesh", "ararunachalpradesh", "arunanchalpradesh", "ar", "arunancal predesh", "arp")
		replace `state' = "nagaland" if inlist(`state', "nagaland", "nanagaland", "nl")
		replace `state' = "manipur" if inlist(`state', "manipur", "mamanipur", "mn", "mnp")
		replace `state' = "mizoram" if inlist(`state', "mizohills","mizoram", "mz")
		replace `state' = "tripura" if inlist(`state', "tripura", "trtripura", "tr", "tp")
		replace `state' = "meghalaya" if inlist(`state', "shillong", "meghalay", "meghalaya", "mgh")
		replace `state' = "assam" if inlist(`state', "assam", "asassam", "as")
		replace `state' = "westbengal" if inlist(`state', "westbengal", "wbwestbengal", "wb")
		replace `state' = "jharkhand" if inlist(`state', "jharkhand", "jh")
		replace `state' = "odisha" if inlist(`state', "orissa", "ororissa", "or", "odisha")
		replace `state' = "chhattisgarh" if inlist(`state', "chhattisgarh", "ct", "chhatisgarh","cg", "chattisgarh")
		replace `state' = "madhyapradesh" if inlist(`state', "madhyapradesh", "madhypradesh", "mpmadhyapradesh", "mp")
		replace `state' = "gujarat" if inlist(`state', "gujarat", "gjgujarat", "gujrat", "gj", "kutch", "saurashtra")
		replace `state' = "damandiu" if inlist(`state', "damandiu","daman", "diu")
		replace `state' = "dadranagarhaveli" if inlist(`state', "dadranagarhaveli", "dnhaveli")
		replace `state' = "maharashtra" if inlist(`state', "maharashtra", "mhmaharashtra", "mh", "ms")
		replace `state' = "andhrapradesh" if inlist(`state', "andhrapradesh", "apandhrapradesh", "ap")
		replace `state' = "telangana" if inlist(`state', "tg", "telangana")
		replace `state' = "karnataka" if inlist(`state', "karnataka", "kakarnataka", "ka", "mysore")
		replace `state' = "goa" if inlist(`state', "goa")
		replace `state' = "lakshadweep" if inlist(`state', "lakshadweep", "lakshadwep", "ld")
		replace `state' = "kerala" if inlist(`state', "kerala", "kekerala", "kerela", "kl", "travancorecochin", "ke")
		replace `state' = "tamilnadu" if inlist(`state', "tamilnadu", "tntamilnadu", "tn", "madras")
		replace `state' = "pondicherry" if inlist(`state', "puducherry", "pondicherry", "pondi", "py", "pondicherryfrench")
		replace `state' = "andamannicobarislands" if inlist(`state', "andamannicobarislands", "andamannicobarisland", "anislands", "anisland", "andamannicobar", "an", "andamansnicobars")

		* iso codes
		gen iso_`state' = "UNKNOWN"
		replace iso_`state' = "AN" if inlist(`state',"andamannicobarislands")
		replace iso_`state' = "AP" if inlist(`state',"andhrapradesh")
		replace iso_`state' = "TG" if inlist(`state',"telangana","hyderabad")
		replace iso_`state' = "AR" if inlist(`state',"arunachalpradesh","northeastfrontieragency")
		replace iso_`state' = "AS" if inlist(`state',"assam")
		replace iso_`state' = "BR" if inlist(`state',"bihar")
		replace iso_`state' = "CH" if inlist(`state',"chandigarh")
		replace iso_`state' = "CT" if inlist(`state',"chhattisgarh")
		replace iso_`state' = "JH" if inlist(`state',"jharkhand")
		replace iso_`state' = "DD" if inlist(`state',"damandiu")
		replace iso_`state' = "DH" if inlist(`state',"dadranagarhaveli")
		replace iso_`state' = "DL" if inlist(`state',"delhi")
		replace iso_`state' = "GA" if inlist(`state',"goadamandiu","goa")
		replace iso_`state' = "GJ" if inlist(`state',"gujarat", "saurashtra", "kutch")
		replace iso_`state' = "HP" if inlist(`state',"bilaspur","himachalpradesh")
		replace iso_`state' = "HR" if inlist(`state',"haryana")
		replace iso_`state' = "JK" if inlist(`state',"jammukashmir")
		replace iso_`state' = "KA" if inlist(`state',"karnataka","mysore","coorg")
		replace iso_`state' = "KL" if inlist(`state',"kerala", "travancorecochin")
		replace iso_`state' = "LA" if inlist(`state',"ladakh")
		replace iso_`state' = "LD" if inlist(`state',"laccadiveminicoyamindiviislands","lakshadweep")
		replace iso_`state' = "TN" if inlist(`state',"madras","tamilnadu")
		replace iso_`state' = "MH" if inlist(`state',"maharashtra","bombay")
		replace iso_`state' = "MN" if inlist(`state',"manipur")
		replace iso_`state' = "ML" if inlist(`state',"meghalaya")
		replace iso_`state' = "MP" if inlist(`state',"madhyapradesh","bhopal","madhyabharat","vindhyapradesh")
		replace iso_`state' = "MZ" if inlist(`state',"mizoram")
		replace iso_`state' = "NL" if inlist(`state',"nagahillstuensangarea","nagaland")
		replace iso_`state' = "OR" if inlist(`state',"orissa","odisha")
		replace iso_`state' = "PB" if inlist(`state',"punjab","patialaeastpunjabstatesunion")
		replace iso_`state' = "PY" if inlist(`state',"pondicherry")
		replace iso_`state' = "RJ" if inlist(`state',"rajasthan","ajmer")
		replace iso_`state' = "SK" if inlist(`state',"sikkim")
		replace iso_`state' = "TR" if inlist(`state',"tripura")
		replace iso_`state' = "UP" if inlist(`state',"uttarpradesh")
		replace iso_`state' = "UT" if inlist(`state',"uttaranchal","uttarakhand")
		replace iso_`state' = "WB" if inlist(`state',"westbengal","calcutta")
	}

di "Processed state names from variable(s): `varlist'."
end
