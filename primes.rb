   


# TODO - add your prime number solution here...

	  require 'prime'
first_array = Prime.take_while {|p| p < 100 }
sum_count = first_array.inject {|sum,items| sum + items }
p sum_count
	  

second_array = Prime.take_while {|q| q < 2000000 }
amount_count = second_array.inject {|amount,digits| amount + digits }
p amount_count

	   "1,060 and 142,913,828,922!"
 