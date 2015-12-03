// Separate Numbers with Commas in JavaScript **Pairing Challenge**

// I worked on this challenge with: Coleby Kent.

// Pseudocode
// define a seperateComma Function with an integer as the argument.
// reverse the integer, take a slice of three digits
// insert comma after every slice.
// reverse again.
// output a string with commas in the correct positions.

// Initial Solution
function separateComma(integer) {
  var array = integer.toString()
  array = array.split("");
  for (var i = array.length-4; i >= 0; i -= 3){
    array[i] = array[i]+",";
  }
  var string = array.join("");
  return string
}

// Refactored Solution
function separateComma(integer) {
  var array = integer.toString().split("");
  for (var i = array.length-4; i >= 0; i -= 3){
    array[i] += ","};
  return array.join("")};

//Or the really lazy way:
function separateComma(integer) {
  return integer.toLocaleString()}

// Your Own Tests (OPTIONAL)
console.log(separateComma(1569743) == "1,569,743")
console.log(separateComma(10202011) == "10,202,011")
console.log(separateComma(50127) == "50,127")
console.log(separateComma(102000) == "102,000")
console.log(separateComma(321) == "321")

// Reflection
/*
What was it like to approach the problem from the perspective of JavaScript? Did you approach the problem differently?
Yeah, reversing the string had been central to our approach in Ruby, but wasn't readily available in JavaScript. So we got the digits split into an array, and then 

What did you learn about iterating over arrays in JavaScript?
In this case, we did it using a for loop, starting at the 3rd-from-the-end element of the array, and looped backwards by 3's from there.
I think it would have been possible to create a function without using an array at all.

What was different about solving this problem in JavaScript?
Ruby gives you really helpful error messages compared to JavaScript. So we had to do a lot more in terms of outputting the results of each step to check if it was doing what we thought.

What built-in methods did you find to incorporate in your refactored solution?
We found a method toLocaleString() that does it all for you! Otherwise our initial solution was already pretty DRY and readable. I tightened it up a little, but didn't find any methods that would make it any cleaner.
*/
