#double quotes
List="one two three"
for a in $List
do 
  echo "$a"
done
echo "----"

for a in "$List"
do 
  echo "$a"
done
echo "----"

#single quotes
echo "Why can't I write 's between single quotes"
echo 
echo 'Why can'\''t I write '"'"'s between single quotes'

#escaping
echo "this is will print  
as two line"
echo "this will print \
  as single line"

quote=$'\042'
echo "$quote Quoted string $quote and this line lies outside the quoting."
