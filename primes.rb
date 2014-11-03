# easy Primes
=begin
class Primes
  def self.sum_to(limit = 100)
    total = 0;
    (2..limit).each { |n| total+=n if is_p? n }
    return total;
  end

  # this method is to check if a given number can be devided 
  # by any number that came before it.
  # (technically, it just tells you if a given number is prime)
  def self.is_p?(p)
    (2...p).each { |n| return false if p % n == 0 };
    return true;
  end

end
=end

# refactored Primes
# this was fun; first version was implemented using arrays (' know not very smart)...
# at any rate, hashes improved performance greatly.
# applying Sieve of Eratosthenes
class Primes
  def self.sum_to(limit = 100)
    a = Hash[(2...limit).map { |num| [num, num] }] # guess ' could make this line prettier, but neeehh...
    first = Math.sqrt(limit);

    # Sieve of Eratosthenes
    for i in (2...first) # ' still find for(int i; i < first; i++) prettier
      if a[i]
        num = 0;
        j = i*2;     
        while j < limit^2     
          a.delete(j);          
          j = (i*2)+(num*i);
          num+=1;
        end    
      end
    end

    sum = 0;
    a.each { |key, value| sum+=value }
    return sum;
  end
end

# takes about 5-10 min on my machine
#puts Primes.sum_to(2_000_000); 

=begin
Input: an integer n > 1
 
Let A be an array of Boolean values, indexed by integers 2 to n,
initially all set to true.
 
 for i = 2, 3, 4, ..., not exceeding √n:
  if A[i] is true:
    for j = i2, i2+i, i2+2i, ..., not exceeding n:
      A[j] := false
=end