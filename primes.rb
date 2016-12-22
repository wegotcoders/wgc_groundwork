class Primes
    
  def self.sum_to(limit = 100)
    numeroPrimo1 = 2
    sumaNumerosPrimos = 0

    while numeroPrimo1<2000000

        numeroAuxiliar = 1
        aux = 0

        while numeroAuxiliar <= numeroPrimo1

            if numeroPrimo1%numeroAuxiliar == 0
                aux += 1
            end

            numeroAuxiliar += 1
        end

        if aux<=2
            sumaNumerosPrimos += numeroPrimo1
            puts numeroPrimo1
        end

        numeroPrimo1 += 1
    end

    sumaNumerosPrimos
  end
end