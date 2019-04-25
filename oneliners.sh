##########################################################
# last occurrence of regular expression
##########################################################

Command   :   perl -n -e '$e = $1 if /(REGEX_HERE)/;  END{ print $e }'

##########################################################
# print something if regex matches
##########################################################

Command   :   perl -ne 'print /(REGEX_HERE)/ ? "match" : "no-match" '
Example   :   echo "ABC123" | perl -ne 'print /ABC123/ ? "match" : "no-match" '  
Output    :   match

##########################################################
# print content of specific column (separated by spaces)
##########################################################

Command   :   perl -lane 'print $F[0]'
Example   :   echo "A B C" | perl -lane 'print $F[0]'
Output    :   A

##########################################################
# print content of specific column (separated by any character)
##########################################################

Command   :   perl -F[CHARACTER_HERE] -a -ne 'print "$F[0]" '
Example   :   echo "A;B;C" | perl -F; -a -ne 'print "$F[1]" '
Output    :   B

##########################################################
# print something if columns match specific regex
##########################################################

Command   :   perl -lane 'print "TRUE" if $F[0]=~/\d/ and $F[1]=~/\D/'
Example   :   echo "3 z" | perl -lane 'print "TRUE" if $F[0]=~/\d/ and $F[1]=~/\D/'
Output    :   TRUE

##########################################################
# sobstitute match in file
##########################################################

# -pi.orig will create a backup of the file with ".orig" at the end
Command   :   perl -pi.orig -e 's/(REGEX_HERE)/(VALUE_HERE)/' (PATH_TO_FILE)

