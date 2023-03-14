/*
`repencode`
Last updated - Vedarshi Shastry, Nov 22

repencode takes a string list as input and encodes it to a categorical variable
*/

program repencode

syntax varlist(string)

	rename `varlist' _`varlist'
  encode _`varlist', gen(`varlist')
  drop _`varlist'

end
