// Tally Votes in JavaScript Pairing Challenge.

// I worked on this challenge with:
// This challenge took me [#] hours.

// These are the votes cast by each student. Do not alter these objects here.
var votes = {
  "Alex": { president: "Bob", vicePresident: "Devin", secretary: "Gail", treasurer: "Kerry" },
  "Bob": { president: "Mary", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Cindy": { president: "Cindy", vicePresident: "Hermann", secretary: "Bob", treasurer: "Bob" },
  "Devin": { president: "Louise", vicePresident: "John", secretary: "Bob", treasurer: "Fred" },
  "Ernest": { president: "Fred", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Fred": { president: "Louise", vicePresident: "Alex", secretary: "Ivy", treasurer: "Ivy" },
  "Gail": { president: "Fred", vicePresident: "Alex", secretary: "Ivy", treasurer: "Bob" },
  "Hermann": { president: "Ivy", vicePresident: "Kerry", secretary: "Fred", treasurer: "Ivy" },
  "Ivy": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Gail" },
  "John": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Kerry" },
  "Kerry": { president: "Fred", vicePresident: "Mary", secretary: "Fred", treasurer: "Ivy" },
  "Louise": { president: "Nate", vicePresident: "Alex", secretary: "Mary", treasurer: "Ivy" },
  "Mary": { president: "Louise", vicePresident: "Oscar", secretary: "Nate", treasurer: "Ivy" },
  "Nate": { president: "Oscar", vicePresident: "Hermann", secretary: "Fred", treasurer: "Tracy" },
  "Oscar": { president: "Paulina", vicePresident: "Nate", secretary: "Fred", treasurer: "Ivy" },
  "Paulina": { president: "Louise", vicePresident: "Bob", secretary: "Devin", treasurer: "Ivy" },
  "Quintin": { president: "Fred", vicePresident: "Hermann", secretary: "Fred", treasurer: "Bob" },
  "Romanda": { president: "Louise", vicePresident: "Steve", secretary: "Fred", treasurer: "Ivy" },
  "Steve": { president: "Tracy", vicePresident: "Kerry", secretary: "Oscar", treasurer: "Xavier" },
  "Tracy": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Ullyses": { president: "Louise", vicePresident: "Hermann", secretary: "Ivy", treasurer: "Bob" },
  "Valorie": { president: "Wesley", vicePresident: "Bob", secretary: "Alex", treasurer: "Ivy" },
  "Wesley": { president: "Bob", vicePresident: "Yvonne", secretary: "Valorie", treasurer: "Ivy" },
  "Xavier": { president: "Steve", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Yvonne": { president: "Bob", vicePresident: "Zane", secretary: "Fred", treasurer: "Hermann" },
  "Zane": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Mary" }
}

// Tally the votes in voteCount.
var voteCount = {
  president: {},
  vicePresident: {},
  secretary: {},
  treasurer: {}
}

/* The name of each student receiving a vote for an office should become a property
of the respective office in voteCount.  After Alex's votes have been tallied,
voteCount would be ...

  var voteCount = {
    president: { Bob: 1 },
    vicePresident: { Devin: 1 },
    secretary: { Gail: 1 },
    treasurer: { Kerry: 1 }
  }

*/


/* Once the votes have been tallied, assign each officer position the name of the
student who received the most votes. */
var officers = {
  president: undefined,
  vicePresident: undefined,
  secretary: undefined,
  treasurer: undefined
}

// Pseudocode
/*
create function that goes throguh votes object
store votes for each candidate in voteCount{}
loop through to find most voted candidate
select them to the proper positions, stored in officers{}



*/

// __________________________________________
// Initial Solution

// function countVotes(votes){
//   for (var voter in votes){
//     for (var position in votes[voter]){
//       var candidate = votes[voter][position];
//       if (voteCount[position][candidate]==undefined) {voteCount[position][candidate]=0;}
//       voteCount[position][candidate]+=1;
//     }
//   }
// }
// countVotes(votes)
// console.log(voteCount)
// function selectWinner(voteCount){
//   for (var position in voteCount){
//     var highest = 0;
//     for (var candidate in voteCount[position]){
//       if (voteCount[position][candidate] > highest){
//         highest = voteCount[position][candidate]
//         officers[position] = candidate;
//       }
//     }
//   }
// }
// selectWinner(voteCount)
// console.log(officers)

// var obj = { foo: "bar", baz: 42 };
// console.log(Object.values(obj)); // ['bar', 42]

// __________________________________________
// Refactored Solution

function countVotes(votes){
  for (var voter in votes){    
    for (var position in votes[voter]){
      var candidate = votes[voter][position];
      if (voteCount[position][candidate]==undefined) {voteCount[position][candidate]=0;}
      voteCount[position][candidate]+=1;
    }
  }
}



countVotes(votes)
function selectWinner(voteCount){
  for (var position in voteCount){
    var highest = 0;
    for (var candidate in voteCount[position]){
      if (voteCount[position][candidate] > highest){
        highest = voteCount[position][candidate]
        officers[position] = candidate;
      }
    }
  }
}
selectWinner(voteCount)

// __________________________________________
// Reflection

/*
What did you learn about iterating over nested objects in JavaScript?
My pair and I used the for (var property in object) notation. But it's important to keep in mind that this is looping over the properties, not the property values, so to get to the values, you still need to reference object[property].

Were you able to find useful methods to help you with this?
Not really! We did some extensive searching of the documentation, and it looks like there will be things like .entries or .values in the next version of Javascript, that will return an array including the property values of an object. But I couldn't find anything useful right now.
If there are methods to symplify this, I would love to know.

What concepts were solidified in the process of working through this challenge?
It was good practice of picking apart multi-dimensional/nested data structures and turning one structure into another.
*/

// __________________________________________
// Test Code:  Do not alter code below this line.

function assert(test, message, test_number) {
  if (!test) {
    console.log(test_number + "false");
    throw "ERROR: " + message;
  }
  console.log(test_number + "true");
  return true;
}

assert(
  (voteCount.president["Bob"] === 3),
  "Bob should receive three votes for President.",
  "1. "
)

assert(
  (voteCount.vicePresident["Bob"] === 2),
  "Bob should receive two votes for Vice President.",
  "2. "
)

assert(
  (voteCount.secretary["Bob"] === 2),
  "Bob should receive two votes for Secretary.",
  "3. "
)

assert(
  (voteCount.treasurer["Bob"] === 4),
  "Bob should receive four votes for Treasurer.",
  "4. "
)

assert(
  (officers.president === "Louise"),
  "Louise should be elected President.",
  "5. "
)

assert(
  (officers.vicePresident === "Hermann"),
  "Hermann should be elected Vice President.",
  "6. "
)

assert(
  (officers.secretary === "Fred"),
  "Fred should be elected Secretary.",
  "7. "
)

assert(
  (officers.treasurer === "Ivy"),
  "Ivy should be elected Treasurer.",
  "8. "
)