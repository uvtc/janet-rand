# Rand

Some functions to get you random things.

## Examples

~~~janet
(import rand :prefix "")

(rand-int n)     #=> random integer from 0 to n - 1
(rand-int n m)   #=> random integer from n to m - 1
(rand-elem arr)  #=> random element from array

(rand-elems n arr)  #=> n random unique elements of the array
# Roll a `(length arr)`-sided die (one elem per side), n times:
(rand-rolls n arr)  #=> n random elems of arr (may repeat)

(shuffle arr)   #=> a copy of the array, shuffled

(rand-key tbl)  #=> random key   from a table
(rand-val tbl)  #=> random value from a table
(rand-kv  tbl)  #=> random key/value pair (tuple)

(rand-str n)    #=> random n-character lowercase string
~~~
