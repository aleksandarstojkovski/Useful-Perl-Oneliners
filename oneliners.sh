// last occurrence of regular expression
perl -n -e '$e = $1 if /(REGEX_HERE)/;  END{ print $e }'
