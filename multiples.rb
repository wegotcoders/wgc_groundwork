class Multiples
  def self.multiples(limit)

    multiples = []

    limit.times do |n|
        if n % 3 == 0
            multiples.push(n)
        elsif n % 5 == 0
            multiples.push(n)
        end
    end

    multiples.inject(0, :+)
      
  end
end