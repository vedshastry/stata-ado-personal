* define colwidth program
program def colwidth
	// * allow for changing size (input a number)
	// syntax varlist(numeric)

	* set col width in data editor to required size, for all variables
	unab varlist : _all
	foreach var in `varlist'{
	char `var'[_de_col_width_] 16
	}

end
