
require 'prime'

p = Prime.new
(1..100).each do |n|
  q = p.next()
  puts "#{n}: #{q}"
end

