VALID_CHOICES = ["rock", "paper", "scissors"]

def display_prompt(text_to_prompt)
  puts "=> #{text_to_prompt}"
end

def randomly_generated_choice
  VALID_CHOICES.sample
end

def request_user_choice
  display_prompt("Your move! Enter either 'rock', 'paper', or 'scissors'")
end

def display_winner(winner:, user_throw:, computer_throw:)
  display_prompt("User choice: #{user_throw.capitalize}")
  display_prompt("Computer choice: #{computer_throw.capitalize}")
  display_prompt("#{winner.capitalize} is the winner!")
end

def display_tie_warning
  display_prompt("Because you got a tie! You'll have to play again")
end

def request_play_again
  user_wants_to_play_again = nil
  loop do
    display_prompt("Would you like to play again?(Y / N)")
    user_play_again_choice = gets.chomp.downcase
    user_wants_to_play_again =  case user_play_again_choice
                                when "y" then true
                                when "n" then false
                                end
    break unless user_wants_to_play_again.nil?
    display_prompt("I didn't understand your input, please select again.")
  end
  user_wants_to_play_again
end

def update_user_choice
  user_selection = ""

  loop do
    request_user_choice()
    user_selection = gets.chomp.downcase
    break if VALID_CHOICES.include?(user_selection)
    display_prompt("Idiot! You didn't select a valid option. Try again...")
  end

  user_selection
end

def update_computer_choice
  randomly_generated_choice()
end

def update_round_winner(user_selection, computer_selection)
  matchup_winner = {
    rock: {     rock: nil, paper: false, scissors: true },
    paper: {    rock: true, paper: false, scissors: nil },
    scissors: { rock: true, paper: false, scissors: nil }
  }
  player1_had_good_result = matchup_winner[user_selection.to_sym][computer_selection.to_sym]

  _this_rounds_winner = case player1_had_good_result
                        when true then "human"
                        when false then "computer"
                        else "nobody"
                        end
end

def my_app
  loop do
    round_winner = ""
    loop do
      user_choice = update_user_choice()
      computer_choice = update_computer_choice()
      round_winner = update_round_winner(user_choice, computer_choice)
      display_winner( \
        user_throw: user_choice, \
        computer_throw: computer_choice, \
        winner: round_winner \
      )
      break unless round_winner == "nobody"
      display_tie_warning()
    end
    break if request_play_again() == false
  end
  display_prompt("Ok, goodbye!")
end

my_app()
