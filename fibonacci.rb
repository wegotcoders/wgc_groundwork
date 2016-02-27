class Fibonacci
  def self.fibonacci(limit)

    fibonacci = [1,2]

    i = 0

    while i <= limit
        i = fibonacci[-1] + fibonacci[-2]
        fibonacci.push(i)
        if fibonacci[-1] > limit
            fibonacci.pop
        end
    end

      even_fibonacci = fibonacci.select{|number| number % 2 == 0 }
      
      even_fibonacci.inject(0, :+)
      
  end
end