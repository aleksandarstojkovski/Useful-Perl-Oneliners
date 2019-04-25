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
# $F[] is the array of the columns,
# $F[0] is the first column, $F[n] is the "n" column
##########################################################
Command   :   perl -lane 'print $F[0]'
Example   :   echo "A B C" | perl -lane 'print $F[0]'
Output    :   A

##########################################################
# print content of specific column (separated by any character)
##########################################################
# $F[] is the array of the columns,
# $F[0] is the first column, $F[n] is the "n" column
##########################################################
Command   :   perl -F[CHARACTER_HERE] -a -ne 'print "$F[0]" '
Example   :   echo "A;B;C" | perl -F; -a -ne 'print "$F[1]" '
Output    :   B
