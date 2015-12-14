/* Requirements
Create a new list
Add an item with a quantity to the list
Remove an item from the list
Update quantities for items in your list
Print the list (Consider how to make it look nice!)

Pseudocode:
Create an object for the grocery list
This object should have methods to: 
* add an item (and optional quantity) to the list contents.
  Input: item (string), quantity (integer). Add properties to object. No output value.
* remove an item with all its quantity at once.
  Input: item. Remove property from object. No output value.
* update the quantity for a specified item.
  Input: item, quantity. Change values of object properties. No output value.
* print the current contents of the list.
  None. Print list contents to screen. No output value.
This object should have a "contents" property, which will be an object with a property for each grocery item, where the value is the quantity for that item.

*/

//Initial Solution
function GroceryList () {
  this.add_item = function (item, quantity){
    this[item]=quantity;
  };
  this.remove_item = function (item){
    delete this[item];
  };
  this.update_item = function (item, quantity){
    this[item]=quantity;
  };
  this.print_list = function () {
    for (var item in this) {
      if (typeof this[item] != "function") {console.log(this[item] + " " + item + "(s)")}
    }
  };
}

//Refactored Solution
function GroceryList () {
  this.add_item = function (item, quantity){this[item]=quantity};
  this.remove_item = function (item){delete this[item]};
  this.update_item = this.add_item;
  this.print_list = function () {
    for (var item in this) {
      if (typeof this[item] != "function") {console.log(this[item] + " " + item + "(s)")}
    }
  };
}
//I looked at JS Object methods, and didn't see anything useful for simplifying any further than this.

/*
What concepts did you solidify in working on this challenge? (reviewing the passing of information, objects, constructors, etc.)
This helped review object constructor functions and working with object properties. I also worked with typeof, and found out that JS doesn't allow "IF" after a statement like Ruby does.

What was the most difficult part of this challenge?
I struggled with refactoring. I just don't see any way to polish it further.

Did an array or object make more sense to use and why?
I think that it would make sense to create an object for this, since the data is more hash-like, and so I can build the methods into the object itself.
*/
