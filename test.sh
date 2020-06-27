#the purpose of this script is to know the purpose of special variables
echo #this prints a blank line 
echo "the no. of arguments passed is: $#" # '$#' prints the no. of arguments given
echo "the name of this script is $0"
echo "the basename of this script is `basename $0`"
echo "arguments: $1 $2 $3 $4 $5" #call this with exact 5 arguments
echo "all the command line parameters are: $*"
echo
exit 0
