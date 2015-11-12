What does puts do?

The "puts" command does two things:
1. It returns a value of nil.
2. It evaluates the argument you give it, and writes the value on a new line.

What is an integer? What is a float?

An integer is a positive or negative whole number. You can do all sorts of mathematical operations on one or more integer, and the result will always be expressed as an integer, even for division.
A float is a positive or negative number with a decimal included, even if it's something like "2.0". When you do mathematical operations on floats, the result will be a float as well.

What is the difference between float and integer division? How would you explain the difference to someone who doesn't know anything about programming?

Float division is what we would typically expect a computer to do. In cases like 1/3 for example, the result would be expressed as a decimal (0.3333333333333333).
For integer division, it returns only the integer portion of the result. 1/3 = 0 for example. It would be like if you were trying to divide up some number of things--pencils maybe--amongst a certain number of people, and if there's a remainder left over, that doesn't change how many pencils each person received.

Hours in a year
```ruby
puts 24*365
```

Minutes in a decade
```ruby
puts 24*365*60*10
```

[Challenge 4.2.1](https://github.com/nbdavies/phase-0/blob/master/week-4/defining-variables.rb)

[Challenge 4.2.2](https://github.com/nbdavies/phase-0/blob/master/week-4/simple-string.rb)

[Challenge 4.2.3](https://github.com/nbdavies/phase-0/blob/master/week-4/basic-math.rb)

How does Ruby handle addition, subtraction, multiplication, and division of numbers?

The typical mathematical symbols apply (+, -, *, /). From a technical perspective, Ruby treats these as methods, where the first number is being acted upon, with the second number as an argument.

What is the difference between integers and floats?

An integer is a positive or negative whole number. You can do all sorts of mathematical operations on one or more integer, and the result will always be expressed as an integer, even for division.
A float is a positive or negative number with a decimal included, even if it's something like "2.0". When you do mathematical operations on floats, the result will be a float as well.

What is the difference between integer and float division?

Float division is what we would typically expect a computer to do. In cases like 1/3 for example, the result would be expressed as a decimal (0.3333333333333333).
For integer division, it returns only the integer portion of the result. 1/3 = 0 for example. It would be like if you were trying to divide up some number of things--pencils maybe--amongst a certain number of people, and if there's a remainder left over, that doesn't change how many pencils each person received.

What are strings? Why and when would you use them?

Strings would be for lots of sorts of information that aren't numeric. Names, addresses, etc. You can also store a sequence of digits as a string.

What are local variables? Why and when would you use them?

Local variables allow you to store off and recall a value, and to do operations upon them, rather than writing it out every time, or to generalize your code if you don't know value your code is going to be taking in.

How was this challenge? Did you get a good review of some of the basics?

Yeah, it went really smoothly once I got Ruby and rspec working.