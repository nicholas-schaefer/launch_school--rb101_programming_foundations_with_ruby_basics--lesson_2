#Booleans and logical Operators

true.class          # => TrueClass
true.nil?           # => false
true.to_s           # => "true"
true.methods        # => list of methods you can call on the true object

false.class         # => FalseClass
false.nil?          # => false
false.to_s          # => "false"
false.methods       # => list of methods you can call on the false object

#Truthiness

=begin
After that review of booleans and logical operators, we're finally able to talk about the notion of "truthiness".
Truthiness differs from the boolean values true and false since Ruby considers several different values be "truthy", while only true is true.
Likewise, there are multiple values that Ruby treats as "falsy" (or "falsey"), but only false is false.
In fact, Ruby is a very liberal language and considers everything to be truthy other than the two falsy values, false and nil.

This means that we can use any expression in a conditional, or with logical operators.
As long as the expression isn't falsy, Ruby considers the value to be true.
Note that an expression that Ruby considers true is not the same as the true object, and something the Ruby considers false is not the same as the false object.
Truthiness concerns itself with the difference between values that Ruby considers true or false.
=end

num = 5

if num
  puts "valid number" #this is what wins, because 5 is neither false nor nil
else
  puts "error!"
end