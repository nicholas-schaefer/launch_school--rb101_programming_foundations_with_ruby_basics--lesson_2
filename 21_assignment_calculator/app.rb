def display_prompt(text_to_prompt)
  puts "=> #{text_to_prompt}"
end

def randomly_generated_choice
  moves = ["rock", "paper", "scissors"].sample
end

def request_user_choice
  display_prompt("Your move! Enter either 'rock', 'paper', or 'scissors'")
end

def display_tie_warning
  display_prompt("You got a tie! You'll have to play again")
end


def request_play_again
  display_prompt("Would you like to play again?")
end



def update_user_choice
  request_user_choice()
  randomly_generated_choice()
end

def update_computer_choice
  randomly_generated_choice()
end

def update_round_winner
  user = update_user_choice()
  computer = update_computer_choice()

  case user
  when  "rock"
    return "user" if computer == "scissors"
    return "computer" if computer == "paper"
    return "nobody" if computer == "rock"
  when  "paper"
    return "user" if computer == "rock"
    return "computer" if computer == "scissors"
    return "nobody" if computer == "paper"
  when  "scissors"
    return "user" if computer == "paper"
    return "computer" if computer == "rock"
    return "nobody" if computer == "scissors"
  end
end



def my_app
  update_user_choice()
  update_computer_choice()
  puts round_winner = update_round_winner()
  request_play_again()
end

my_app()