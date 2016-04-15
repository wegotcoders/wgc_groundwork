class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    #Sieve of Eratosthenes - apparently.
#Step 1: Make a class for the integers that can hold both a boolean value and the integer value (maybe a hash instead)
#Step 2: Put a number of these in an array, up to a maximum limit, setting them all to "true".
#Step 3: "Sieve" through these numbers, starting at 2 (the lowest prime) go through the list in multiples of that number until you hit the ca#return numhash[5].key(5)
#Step 3 cont: Set all multiples of the number to "false"
#Step 4: Start at the next non-false number in sequence, and repeat step 3 until all numbers are complete.
#Step 5: Loop through again, taking out all the remaining "true" integers - these are all the primes.

#all that's far too complicated, lets just symplify by being destructive with an array.

ary = (2..limit).to_a

ary.each do |val1|
	ary.delete_if{|val2| (val2 > val1) && (val2 % val1 == 0)}#I'm amazed this actually works, some languages would flip their lid at altering a structure while it's in process.
end

return ary.inject(0,:+) #stole this from the web, seemed nice and simple.
end
end