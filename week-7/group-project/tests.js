
// Add the finished solution here when you receive it.
// __________________________________________
function sum(array_of_vals) {
  var container = 0;
  for (var counter = 0; counter < array_of_vals.length; counter++) {
    container += array_of_vals[counter];
  }
  return container;
}

function median(array_of_vals) {
  array_of_vals.sort()
  if (array_of_vals.length % 2 != 0) {
    var median_index = Math.floor(array_of_vals.length/2);
    return array_of_vals[median_index];
  } else {
    var median_index = array_of_vals.length/2;
    return (array_of_vals[median_index] + array_of_vals[median_index-1])/2;
  }
}

function pony(){
  console.log("      ./|,,/|");
  console.log("     <   o o)")
  console.log("    <\\ (    |")
  console.log("   <\\\\  |\\  |")
  console.log("  <\\\\\\  |(__)")
  console.log(" <\\\\\\\\  |")
}

//Adding this just so we can confirm that the other parts work...
function mean(array){
  return (sum(array)/array.length)
}

// Tests:  Do not alter code below this line.
pony()

oddLengthArray  = [1, 2, 3, 4, 5, 5, 7]
evenLengthArray = [4, 4, 5, 5, 6, 6, 6, 7]


function assert(test, message, test_number) {
  if (!test) {
    console.log(test_number + "false");
    throw "ERROR: " + message;
  }
  console.log(test_number + "true");
  return true;
}

// tests for sum
assert(
  (sum instanceof Function),
  "sum should be a Function.",
  "1. "
)

assert(
  sum(oddLengthArray) === 27,
  "sum should return the sum of all elements in an array with an odd length.",
  "2. "
)

assert(
  sum(evenLengthArray) === 43,
  "sum should return the sum of all elements in an array with an even length.",
  "3. "
)

// tests for mean
assert(
  (mean instanceof Function),
  "mean should be a Function.",
  "4. "
)

assert(
  mean(oddLengthArray) === 3.857142857142857,
  "mean should return the average of all elements in an array with an odd length.",
  "5. "
)

assert(
  mean(evenLengthArray) === 5.375,
  "mean should return the average of all elements in an array with an even length.",
  "6. "
)

// tests for median
assert(
  (median instanceof Function),
  "median should be a Function.",
  "7. "
)

assert(
  median(oddLengthArray) === 4,
  "median should return the median value of all elements in an array with an odd length.",
  "8. "
)

assert(
  median(evenLengthArray) === 5.5,
  "median should return the median value of all elements in an array with an even length.",
  "9. "
)