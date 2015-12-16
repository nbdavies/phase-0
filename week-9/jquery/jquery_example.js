// U3.W9:JQuery


// I worked on this challenge [by myself, with: ].
// This challenge took me [#] hours.

$(document).ready(function(){

//RELEASE 0:
  //link the image

//RELEASE 1:

  //Link this script and the jQuery library to the jQuery_example.html file and analyze what this code does.

$('body').css({'background-color': 'pink'});

//RELEASE 2:
//Add code here to select elements of the DOM
bodyElement = $('body');
mascotClass = $('.mascot');
header = $('h1');
//RELEASE 3:
  // Add code here to modify the css and html of DOM elements

$('body > h1').css("color", "red");
$('body > h1').css("border", "1px solid green");
$('body > h1').css("visibility", "hidden");

$('div > h1').html("Chorus Frogs");

//RELEASE 4: Event Listener
  // Add the code for the event listener here
$('img').css("border", "1px solid green");
$('img').on('mouseenter', function(e){
	e.preventDefault()
	$(this).attr('src', 'http://www.californiaherps.com/noncal/misc/miscfrogs/images/pstreckeriwc7073.jpg')
	$(this).animate({
		height: "50%",
		width: "50%",
		borderWidth: "20px",
	}, {
		duration: 5000
	});
});

$('img').on('mouseleave', function(e){
	e.preventDefault()
	$(this).attr('src', 'dbc_logo.png')
});

//RELEASE 5: Experiment on your own

//We added this to the mouseenter handler above.

})  // end of the document.ready function: do not remove or write DOM manipulation below this.

/*
What is jQuery?
jQuery is a set of scripts that makes it easier to manipulate the DOM. It enables the syntax $("css selector") to reference one or more elements on the page the same way you would in CSS.
It also has standard methods for those HTML element objects, to change the CSS styling, class attributes, position, etc., to do these things based on user events, and to have them take effect over time.

What does jQuery do for you?
It provides a streamlined way to make pages interactive, and to be able to traverse and manipulate the DOM.

What did you learn about the DOM while working on this challenge?
In release 2, we were a bit surprised that we didn't have to initialize our variables. Still not sure why we got a free pass on that.
Preparing for the challenge, I spent a bunch of time on the codeCademy jQuery tutorials, and then tried to apply it to my game from week 7. Still not entirely there yet, but it seems more easier to work with than JavaScript's native DOM methods.
Then pairing on this, my pair used a bunch of variations on the jQuery syntax that I wouldn't have assumed were possible.
