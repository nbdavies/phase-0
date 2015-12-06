 // JavaScript Olympics

// I paired with: KB DiAngelo on this challenge.

// This challenge took me 0.75 hours.

// Warm Up
//Not sure what was meant to go here.

// Bulk Up
var bob = {name: "Bob Jones", event:"Swimming"};
var jane = {name: "Jane Smith", event: "Running"};
var mary = {name: "Mary Johnson", event: "Boxing"};

var example_athletes = [bob, jane, mary];

var bulkUp = function(array_of_athletes) {
  array_of_athletes.forEach(function(athlete){
    athlete.win = function(){
      console.log(athlete.name + " won the " + athlete.event + "!");
    }
  })
}

bulkUp(example_athletes);
bob.win()

// Jumble your words
function reverseString(string){
  var array = string.split("");
  return array.reverse().join("");  
}

console.log(reverseString("Hello I am a human"))

// 2,4,6,8

var array = [1, 2, 3, 4, 5, 6];

var onlyEven = function(array_of_nums) {
  return array_of_nums.filter(function(number){
    return number % 2 == 0;
  })
}

console.log(onlyEven(array));

// "We built this city"
function Athlete(name, age, sport, quote){
  this.name = name;
  this.age = age;
  this.sport = sport;
  this.quote = quote;
}

var michaelPhelps = new Athlete("Michael Phelps", 29, "swimming", "It's medicinal I swear!")
console.log(michaelPhelps.constructor === Athlete)
console.log(michaelPhelps.name + " " + michaelPhelps.sport + " " + michaelPhelps.quote)


// Reflection
/*What JavaScript knowledge did you solidify in this challenge?
Function expressions (function name(args){}) vs. function declarations (var name=function(args){}) vs. inline-defined functions (function(args){}) vs. constructor functions (function Object(args){}).

What are constructor functions?
These are functions for constructing a type of object and its properties.

How are constructors different from Ruby classes (in your research)?
So far I haven't seen a way to specify the parent class within the Javascript constructor function. 
*/