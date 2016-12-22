
	number3 = 0
	999.downto(1).each do |number|
		999.downto(1).each do |number1|
			number2 = number * number1
			
			if number2.to_s == number2.to_s.reverse && number2 > number3
				number3 = number2
			
			end
		
		end
	end


puts "#{number3} is the highest number"