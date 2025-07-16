//Returns null if there is any bad text in the string
/proc/reject_bad_text(text, max_length = 512, ascii_only = TRUE)
	var/char_count = 0
	var/non_whitespace = FALSE
	var/lenbytes = length(text)
	var/char = ""
	for(var/i = 1, i <= lenbytes, i += length(char))
		char = text[i]
		char_count++
		if(char_count > max_length)
			return
		switch(text2ascii(char))
			if(62,60,92,47) // <, >, \, /
				return
			if(0 to 31)
				return
			if(32)
				continue		//whitespace
			if(127 to 1024)
				if(ascii_only)
					return
			if(1026 to 1039) // Ђ, Ѓ, Є, Љ ... and more
				return
			if(1106 to INFINITY)
				if(ascii_only)
					return
			else
				non_whitespace = TRUE
	if(non_whitespace)
		return text		//only accepts the text if it has some non-spaces
