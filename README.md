# Useful Perl Oneliners
Very usefull Perl one liners, designed to be used inside shell scripts.


### First occurrence of regular expression

```
Command   :   perl -ne 'print "$1" and exit if /(REGEX_HERE)/'
```

### Last occurrence of regular expression

```
Command   :   perl -ne '$e = $1 if /(REGEX_HERE)/;  END{ print $e }'
```

### Print something if regex matches

```
Command   :   perl -ne 'print /(REGEX_HERE)/ ? "match" : "no-match" '
Example   :   echo "ABC123" | perl -ne 'print /ABC123/ ? "match" : "no-match" '  
Output    :   match
```

### Print content of specific column (separated by spaces)

```
Command   :   perl -lane 'print $F[0]'
Example   :   echo "A B C" | perl -lane 'print $F[0]'
Output    :   A
```

### Print content of specific column (separated by any character)

```
Command   :   perl -F[CHARACTER_HERE] -a -ne 'print "$F[0]" '
Example   :   echo "A;B;C" | perl -F; -a -ne 'print "$F[1]" '
Output    :   B
```

### Print something if columns match specific regex

```
Command   :   perl -lane 'print "TRUE" if $F[0]=~/\d/ and $F[1]=~/\D/'
Example   :   echo "3 z" | perl -lane 'print "TRUE" if $F[0]=~/\d/ and $F[1]=~/\D/'
Output    :   TRUE
```

### Sobstitute match in file
-pi.orig will create a backup of the file with ".orig" at the end
```
Command   :   perl -pi.orig -e 's/(REGEX_HERE)/(VALUE_HERE)/' (PATH_TO_FILE)
```

### Check syntax of file (parse)
eg. in this case file format must be KEY;VALUE
```
Command   :   perl -ne '$exit_code='0' ; $exit_code='1' if $_ !~ /.*?\s;\s.*/ ; print "1" and exit if $exit_code' (PATH_TO_FILE)
```

### Substitute multiple placeholders with one single one liner
File: example_config_file.txt (with placeholders)
```
<VirtualHost *:##VHOST_PORT##>
    DocumentRoot ##DOCUMENT_ROOT##
    ServerName ##SERVER_NAME##
</VirtualHost>
```
File: script.sh
```
export VHOST_PORT="80"
export DOCUMENT_ROOT="/var/www/"
export SERVER_NAME="example.com"
perl -pi.orig -w -e 's!##(.+?)##!$ENV{$1}!ge;' example_config_file.txt
```
