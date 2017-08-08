randomOBFname(sizemin, sizemax)
{
	global
	
	;the underline is not used in creation of obfuscated names
	;but is included here because this variable is used in the testing of 
	;whether a substring match has allowable variable characters before or after it
	;in which case the match would be evaluated as INVALID
	;TWEAKED DIGIDON ?[] are not authorized so are deleted
	oddvarnameallowedchars = #@$_ 
	; oddvarnameallowedchars = #@$?[]_   
	
	; full list of autohotkey allowable chars for varnames and func names
	; # _ @ $
	; "##########$$$$$$$$$$
	
	; full list of autohotkey allowable chars for varnames and func names
	; # _ @ $ ? [ ]
	; "##########$$$$$$$$$$[[[[[[[[[[]]]]]]]]]]
	
makeobfstarttime = % A_TickCount
	
	;replaceoddchars = % "fk@#"
	
	;DISABLED DIGIDON : 3 below statics SEEMS NOT TO BE USED
	; static obfSTARTchars := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	; static obfchars 	:= "######@@@@@@$$$$$$######@@@@@@$$$$$$ABCDEFGHIJKLMNOPQRSTUVWXYZ012345678901234567890123456789"
	static numrandstartchars, numrandobfchars
	
	;DIGIDON : TWEAKED CHAR STRINGS MODIFIED SO CHARACTERS SETS ARE INCREASED
	static charset1 := "fk", charset2 := "kf", charset3 := "ff", charset4 := "kk", charset5 := "f@" 
	static charset6 := "@f", charset7 := "k@", charset8 := "@k", charset9 := "f#", charset10 := "#f"
	static charset11 := "k#", charset12 := "#k" 
	; static charset13 := "f$", charset14 := "$f"
	; static charset1 := "fk", charset2 := "kf", charset3 := "ff", charset4 := "f@", charset5 := "k#" 
	; static charset6 := "kk", charset7 := "f$", charset8 := "cu", charset9 := "cc", charset10 := "aa"
	; static charset6 := "f?", charset7 := "f]", charset8 := "cu", charset9 := "cc", charset10 := "aa"
	
	;DIGIDON : TWEAKED NUMBER MODIFIED SO CHARACTERS SET ARE INCREASED
	; static numcharsets = 5
	static numcharsets = 12
	
	;DISABLED DIGIDON : 2 below statics SEEMS NOT TO BE USED
	; numrandstartchars 	= % strlen(obfSTARTchars)
	; numrandobfchars 	= % strlen(obfchars)
	
	;TWEAKED DIGIDON : MOVED BELOW SO THAT LENGTH CAN VARY
	; Random, makelength, % sizemin, % sizemax
	while true {
		OBFstr = 
		Random, makelength, % sizemin, % sizemax
		while strlen(OBFstr) < makelength {
			Random, randcharset, 1, % numcharsets
			OBFstr .= charset%randcharset%
		}
		if find_messedupname(OBFstr) {
			numalreadyused++
			continue		
		} 
		add_messedupname(OBFstr)
		messedupnames_recs++
		;messedupnames_%messedupnames_recs% = % OBFstr
		makeobftime += A_TickCount - makeobfstarttime
		return, % OBFstr		
	}
}