# Usefull Perl Oneliners
Very usefull Perl one liners, designed to be used inside shell scripts.

## First occurrence of regular expression

```
Command   :   perl -ne 'print "$1" and exit if /(REGEX_HERE)/'
```

## Last occurrence of regular expression

```
Command   :   perl -ne '$e = $1 if /(REGEX_HERE)/;  END{ print $e }'
```

## Print something if regex matches

```
Command   :   perl -ne 'print /(REGEX_HERE)/ ? "match" : "no-match" '
Example   :   echo "ABC123" | perl -ne 'print /ABC123/ ? "match" : "no-match" '  
Output    :   match
```

## Print content of specific column (separated by spaces)

```
Command   :   perl -lane 'print $F[0]'
Example   :   echo "A B C" | perl -lane 'print $F[0]'
Output    :   A
```

## Print content of specific column (separated by any character)

```
Command   :   perl -F[CHARACTER_HERE] -a -ne 'print "$F[0]" '
Example   :   echo "A;B;C" | perl -F; -a -ne 'print "$F[1]" '
Output    :   B
```

## Print something if columns match specific regex

```
Command   :   perl -lane 'print "TRUE" if $F[0]=~/\d/ and $F[1]=~/\D/'
Example   :   echo "3 z" | perl -lane 'print "TRUE" if $F[0]=~/\d/ and $F[1]=~/\D/'
Output    :   TRUE
```

## Sobstitute match in file
-pi.orig will create a backup of the file with ".orig" at the end
```
Command   :   perl -pi.orig -e 's/(REGEX_HERE)/(VALUE_HERE)/' (PATH_TO_FILE)
```
