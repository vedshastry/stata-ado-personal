/*
`editfile`
Last updated - Vedarshi Shastry, Nov 22

editfile replaces text in file f, from old string 'o' to new string 'n'
*/

program def editfile

	* accept file as input through option f()
	syntax , File(string) FROMstring(string) TOstring(string)

	* new file path
	local new ".new"
	local filenew `file'`new'

	* clone from/to strings to edit
	local from "`fromstring'"
	local to "`tostring'"

	* fix character codes
		local fromstring = subinstr("`fromstring'","\","\BS",.)
		local fromstring = subinstr("`fromstring'","`","\LQ",.)
		local fromstring = subinstr("`fromstring'","'","\RQ",.)
		local tostring = subinstr("`tostring'","\","\BS",.)
		local tostring = subinstr("`tostring'","`","\LQ",.)
		local tostring = subinstr("`tostring'","'","\RQ",.)

	/*
	code    :=  	\BS            backslash
								\r             carriage return
								\n             newline
								\t             tab
								\M             Classic Mac EOL, or \r
								\W             Windows EOL, or \r\n
								\U             Unix or Mac EOL, or \n
								\LQ            left single quote, `
								\RQ            right single quote, '
								\Q             double quote, "
								\$             dollar sign, $
	*/

	* open file, replace text, and save into new file
	* delete old file and rename new to original
	filefilter `file' `filenew', from(`"`fromstring'"') to(`"`tostring'"') replace
	shell rm `file'
	shell mv `filenew' `file'

	* display progress
	di "Edited `file' replacing occurrences of '`from'' to '`to''"

end
