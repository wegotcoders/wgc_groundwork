
function count_prime(arg){

	 arg = typeof arg !== 'undefined' ? arg : 20; //default value
	var list = [2]
	var list2 = [0,1]
	var real_prime = []


	counter = 2
	while (counter < arg ){
		if (counter % 2 !== 0) {
			list.push(counter)
			
		}
	list2.push(counter)  // will be used to display list of numbers to be seived
	counter++

	}

	for (i = 0; i < list.length - 1; i++){
		var a = list[i]

			for (j = 0; j < list.length - 1; j++){

				if (list[j] % a === 0 && list[j] !== a){
					 list[j] = false;			// assign false to non-prime numbers
				}
			}

            if (list[i] !== false){ real_prime.push(list[i]); } // save all prime numbers in new array
	}

	var sum = real_prime.reduce( function(total, num){ return total + num }, 0) ;

 	var ccc = document.getElementById("primesum") ;
 		ccc.innerHTML = sum;
   }

window.onload=count_prime(100);