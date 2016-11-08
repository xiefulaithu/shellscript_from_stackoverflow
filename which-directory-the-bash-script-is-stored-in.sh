#!/bin/bash
#Refer: http://stackoverflow.com/questions/59895/can-a-bash-script-tell-which-directory-it-is-stored-in
#Anwser From: Dave Dopson
#This one will work with any combination of aliases, source, bash -c, symlinks, etc.
#Beware: if you cd to a different directory before running this snippet, the result may be incorrect! Also, watch out for $CDPATH gotchas.

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
