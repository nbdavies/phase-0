# Cipher Challenge

# I worked on this challenge by myself.
# I spent [#] hours on this challenge.

# 1. Solution
# Write your comments on what each thing is doing.
# If you have difficulty, go into IRB and play with the methods.

def dr_evils_cipher(coded_message)
  #takes the coded message, converts it all to lowercase, and splits the string into an array with each character as its own element.
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the Ruby docs.
  #initializes the output array
  decoded_sentence = []
  #defines a hash that translates one letter to another.
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
            "g" => "c",
            "h" => "d",
            "i" => "e",
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
  #iterates over each element (each character)
  input.each do |x| # What is #each doing here?
    #initializes found_match with a false value for this array item
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true?
    #Loops through the translation hash
    cipher.each_key do |y| # What is #each_key doing here?
      #Compares the character of the input array that we're on to the key of the hash
      if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really?
        #Pushes the value at that element of the hash to the output array
        decoded_sentence << cipher[y]
        #Sets found_match = true once we've translated this character of the input
        found_match = true
        #Breaks out of the loop since if we translated an "e" then we don't need to loop through the rest of the hash.
        break  # Why is it breaking here?
        #This block handles if the element of the input array is punctuation. Those are just turned into spaces.
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing?
        #Pushes a space into the output string
        decoded_sentence << " "
        #Records that we translated this piece of the input
        found_match = true
        #Breaks out of the hash loop (which we don't need to be in...)
        break
        #Takes the range 0 to 9, converts it to an array, and checks whether that array includes the current character of the input
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do?
        #Pushes the numeric character (as is) to the output array
        decoded_sentence << x
        #records that we translated this character
        found_match = true
        #Breaks out of the hash loop
        break
      end
    end
    # Handle the case where no translation was found for the current character
    if not found_match  # What is this looking for?
      # push the current character to the output array as is
      decoded_sentence << x
    end
  end
  # take the output array and concatenate it into a string. That is also what will be returned.
  decoded_sentence = decoded_sentence.join("")
  #What is this method returning?
end
# Your Refactored Solution
# Attempt 1
def dr_evils_cipher(coded_message, shift=4) 
  decoded_sentence = []
  coded_message.downcase.each_char do |char|   
    if ('a'..'z').include?(char)
      decoded_sentence << letter_convertor(shift, char)
    elsif '@#$%^&*'.include?(char)
      decoded_sentence << " "
    else decoded_sentence << char
    end
  end
  decoded_sentence.join("")
end

def letter_convertor(shift, letter_in)
  letter_array = ('a'..'z').to_a
  letter_array.rotate(-shift)[letter_array.index(letter_in)]
end

#Attempt 2
def dr_evils_cipher(coded_message, shift=4) 
  rotated_letters = ('a'..'z').to_a.rotate(-shift).join("")
  coded_message.downcase!
  coded_message.tr!('a-z',rotated_letters)
  coded_message.tr!('@#$%^&*',' ')
end

# Driver Test Code:
p dr_evils_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver test code and should print true
# Find out what Dr. Evil is saying below and turn it into driver test code as well. Driver test code statements should always return "true."
p dr_evils_cipher("syv%ievpc#exxiqtxw&ex^e$xvegxsv#fieq#airx%xlvsykl$wizivep#tvitevexmsrw.#tvitevexmsrw#e*xlvsykl#k&aivi%e@gsqtpixi&jempyvi.
&fyx%rsa,$pehmiw@erh#kirxpiqir,%ai%jmreppc@lezi&e&asvomrk%xvegxsv#fieq,^almgl^ai^wlepp%gepp@tvitevexmsr^l")
p dr_evils_cipher("csy&wii,@m'zi@xyvrih$xli*qssr$mrxs&alex@m#pmoi%xs#gepp%e^hiexl#wxev.")
p dr_evils_cipher("qmrm#qi,*mj^m#iziv^pswx#csy#m^hsr'x%orsa^alex@m%asyph^hs.
@m'h%tvsfefpc%qszi$sr%erh*kix#ersxliv$gpsri@fyx*xlivi@asyph^fi@e^15&qmryxi@tivmsh%xlivi$alivi*m*asyph&nywx^fi$mrgsrwspefpi.")
p dr_evils_cipher("alc@qeoi*e$xvmppmsr^alir#ai*gsyph%qeoi...#fmppmsrw?")

# Reflection
# Keep your reflection limited to 10-15 minutes!
=begin
  
What concepts did you review in this challenge?
String/array/range methods and conversion, and DRY refactoring.

What is still confusing to you about Ruby?
I tried to chain my descructive methods together and it didn't work out. But it's probably better to have them on separate lines anyway.

What are you going to study to get more prepared for Phase 1?
This was really useful, but I plan to keep working through some of the other exercises and hit up other sites (like Rubeque).  
=end