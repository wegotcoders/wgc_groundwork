# The idea is to use recursion. Each recursive cycle will either remove the highest allowed denomination or reduce the amount.
#
# Here I use a technique called memoization to improve performance. Though recursion works fine for small amounts, memoization improves calculation speed for big amounts by remembering calculations it has done before (it stores them in a hashmap which has linear lookup time).

$sums = Hash.new();

def coinSum(amount, coins)
  if $sums.key?([amount, coins]) then
    return $sums[[amount, coins]]
  elsif coins.length == 1 then
    cs= 1 
  elsif coins[0] > amount then
    cs = coinSum(amount, coins[1..-1])
  else
    cs= (coinSum(amount - coins[0], coins) + coinSum(amount, coins[1..-1]))
  end
  $sums[[amount, coins]] = cs
  return cs
end

puts(coinSum(200, [200,100,50, 20,10,5,2,1]))


