numbers = []
operand = ""
math_result = nil


def get_user_number
  Kernel.puts(">> provide a number")
  Kernel.gets().chomp().to_s().to_f()
end


def get_operand numbers

  valid_user_selected_operator = nil
  valid_operators = ["add", "subtract", "multiply", "divide"]
  error_message = "You need to try again."
  have_selected_valid_operation = false
  until have_selected_valid_operation do
    Kernel.puts(">> input one of the following operands: 'add', 'subtract', 'multiply', 'divide'")
    math_request = Kernel.gets().chomp().to_s().downcase()

    if valid_operators.include?(math_request)
      if math_request == "divide" && numbers[1] == 0
        valid_user_selected_operator = false
        error_message += "You can't have 0 as your second number and ask for division."
      else
        valid_user_selected_operator = math_request
      end
    end

    break if valid_user_selected_operator
    error_message += " Your entry wasn't one of the options!"
    Kernel.puts(error_message)
    error_message = "You need to try again."
  end
  
  operand = nil
  operand = case math_request
            when "add" then :+
            when "subtract" then :-
            when "multiply" then :*
            when "divide" then :/
            else false
  end
end


numbers << get_user_number() << get_user_number()
operand = get_operand(numbers)
formula = "(#{numbers[0]} #{operand} #{numbers[1]})"
math_result = numbers.reduce(operand)


puts "The result of #{formula} rounded to 2 places is: #{math_result.round(2)} "



