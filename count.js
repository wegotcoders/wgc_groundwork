function countWords(str) {
var count = 0,
i,
foo = str.length;

for (i = 0; i <= foo; i++) {
if (str.charAt(i) == " ") {
count ++;
}

}
return console.log(count + 1);  
}


countWords("I am a short ><><<><>// sentence");