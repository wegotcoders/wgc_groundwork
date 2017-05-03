# The idea is to use recursion. Each recursive cycle will either remove the highest allowed denomination or reduce the amount.
#
# Here I use a technique called memoization to improve performance. Though recursion works fine for small amounts, memoization improves calculation speed for big amounts by remembering calculations it has done before (it stores them in a hashmap which has linear lookup time).


class CoinSum
  $sums = Hash.new();

  def self.combos(amount, coins= [200,100,50, 20,10,5,2,1])
    if $sums.key?([amount, coins]) then
      return $sums[[amount, coins]]
    elsif coins.length == 1 then
      cs= 1 
    elsif coins[0] > amount then
      cs = self.combos(amount, coins[1..-1])
    else
      cs= (self.combos(amount - coins[0], coins) + self.combos(amount, coins[1..-1]))
    end
    $sums[[amount, coins]] = cs
    return cs
  end
end

puts(CoinSum.combos(200))



