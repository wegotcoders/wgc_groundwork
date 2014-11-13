$(function(){

  function getPrimeNumbers(){
  // we need another copy of number 
  // a prime number....
    // two factors are 1 and itself... 
      // we need to devide by something....
  var primeNumbers = []
    num = 100
    // find square route of num... 
    var numSql = Math.sqrt(num);
    console.log(numSql)
    for(i=2; i<=numSql; i++){

      if(num % i == 0){
        // primeNumbers.push(i)
        console.log(i)
        // return false
      }
      // three and two? why do we need thes? ..... 
      // return true... 
    }
    console.log(primeNumbers)
  }
  getPrimeNumbers()
})