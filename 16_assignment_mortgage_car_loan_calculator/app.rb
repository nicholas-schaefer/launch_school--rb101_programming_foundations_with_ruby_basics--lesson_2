def prompt(input)
  "=> #{input}"
end

def valid_positive_float?(input)
  count_of_decimals = input.count(".")
  return false if count_of_decimals > 1

  input.gsub(",", "").to_f > 0
end

def get_user_loan_amount
  loop do
    puts prompt("What was the amount of your loan?")
    user_submitted_loan = gets.chomp
    if valid_positive_float?(user_submitted_loan)
      return user_submitted_loan.to_f
    else
      puts prompt("PROMBLEM! Give is a number we can work with.")
    end
  end
end

def get_user_monthly_interest_rate
  loop do
    puts prompt("What is the amount of your monthly interest rate?")
    user_submitted_monthly_int_rate = gets.chomp
    if valid_positive_float?(user_submitted_monthly_int_rate)
      user_submitted_monthly_int_rate = user_submitted_monthly_int_rate.to_f
      user_submitted_monthly_int_rate *= 0.01
      user_submitted_monthly_int_rate /= 12
      return user_submitted_monthly_int_rate
    else
      puts prompt("PROMBLEM! Give is a number we can work with.")
    end
  end
end

def get_user_loan_duration
  loop do
    puts prompt("What is the length of your loan duration in months?")
    user_submitted_loan_duration = gets.chomp
    if valid_positive_float?(user_submitted_loan_duration)
      user_submitted_loan_duration = user_submitted_loan_duration.to_f
      return user_submitted_loan_duration
    else
      puts prompt("PROMBLEM! Give is a number we can work with.")
    end
  end
end

def caluclate_monthly_payment(loan_amount, monthly_interest_rate, loan_duration_in_months)
  exact_monthly_payment =   loan_amount * monthly_interest_rate / \
                            (1 - ((1 + monthly_interest_rate)**(-loan_duration_in_months)))
  _pretty_monthly_payment = sprintf("%.2f", exact_monthly_payment)
end

def my_app
  homebuyer = {
    loan_amount:              5_000.0,
    monthly_interest_rate:    1.5e-2 / 12,
    loan_duration_in_months:  12.0
  }

  homebuyer[:loan_amount] = get_user_loan_amount()
  homebuyer[:monthly_interest_rate] = get_user_monthly_interest_rate()
  homebuyer[:loan_duration] = get_user_loan_duration()
  monthly_payment = caluclate_monthly_payment( \
    homebuyer[:loan_amount], \
    homebuyer[:monthly_interest_rate], \
    homebuyer[:loan_duration] \
  )

  puts prompt("Your monthly payment will be: $#{monthly_payment}!")
end

my_app()
