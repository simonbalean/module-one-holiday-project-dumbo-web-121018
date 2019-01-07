$prompt = TTY::Prompt.new

def clear_screen
  system 'clear'
end

def play_song(string)
   pid = fork{ exec 'afplay', string }
end

def stop_song
 pid = fork{ exec 'killall', 'afplay' }
end

def welcome
  clear_screen
  play_song("hptheme.mp3")
  clear_screen
  sleep (5)
  no_good_page
  sleep(5)
  clear_screen
  puts " "
  puts " "
  puts " "
  puts " "
  puts " "
  puts " "
  puts "                                   welcome to      "
  sleep(3)
  clear_screen
  welcome_page
  # puts "Welcome to \"Who said it?\" !"
  sleep(5)
  clear_screen
end

def exit_trivia
  clear_screen
  exit_page
  sleep(1)
  clear_screen
  sleep(2)
  stop_song
  system 'exit'
end

def main_menu
  $prompt.select("What you wanna do?") do |menu|
    menu.choice "Create account" => -> do create_account end
    menu.choice "Login" => -> do log_in end
    menu.choice "Exit" => -> do exit_trivia end
  end
end

def create_account
  username_input = $prompt.ask("Username")
  # do |q|
    # q.validate(/^[a-zA-Z0-9_]{5,15}$/, "Userame must be 5-15 characters. Can only contain letters and numbers.")
    found_user = User.find_by(username: username_input)
    if(found_user)
      TTY::Prompt.new.select("Username \"#{username_input}\" already exists.") do |menu|
        menu.choice "Try new username" => -> do create_account end
        menu.choice "Log in" => -> do log_in end
        menu.choice "Exit" => -> do exit_trivia end
      end
    else
      password_input = $prompt.mask("Password") do |q|
        q.validate(/^\A[a-zA-Z0-9_]{5,10}\z$/, "Password must be between 5-10 characters. Can only contain letters and numbers.")
      end
      name_input = $prompt.ask("Name") do |q|
        q.validate(/^\A[a-zA-Z ]{3,20}\z$/, "Name must be between 3-20 characters. Can only contain letters and spaces.")
      end
      @user = User.create(
        username: username_input,
        password: password_input,
        name:name_input,
        high_score: 0
      )
    end
  clear_screen
  puts "Account created successfully"
  sleep(1)
  game_menu
end

def log_in
  username_input = $prompt.ask("Username")
  password_input = $prompt.mask("Password")
  @user = User.find_by(username: username_input, password: password_input)
  if @user == nil
    clear_screen
    $prompt.select("The username and password combination doesnt exist") do |menu|
      menu.choice "Try logging in again" => -> do log_in end
      menu.choice "Create account" => -> do create_account end
      menu.choice "Exit" => -> do exit_trivia end
    end
  else
    clear_screen
    # welcome name!
    game_menu
  end
end

def game_menu
  clear_screen
  $prompt.select("What you wanna do?") do |menu|
    menu.choice "Take quiz" => -> do take_quiz end
    menu.choice "View profile" => -> do view_profile end
    # menu.choice "View high score" => -> do view_highscore end
    menu.choice "Manage account" => -> do manage_account end
    menu.choice "Exit" => -> do exit_trivia end
  end
end

def take_quiz
  $count = 0
  @questions = Question.all.map do |q|
    q
  end
  @questions.each do |q|
    sleep(1)
    clear_screen
    if $lost
      $lost = false
      return
    else
      present_question(q)
    end
  end
end

def present_question(question)
  @answers = question.answers
  # system 'say question.quote'
  $prompt.select('"' + question.quote + '"') do |menu|
    # yield
    menu.choice @answers[0].author => -> do check_answer(@answers[0]) end
    menu.choice @answers[1].author => -> do check_answer(@answers[1]) end
    menu.choice @answers[2].author => -> do check_answer(@answers[2]) end
    menu.choice @answers[3].author => -> do check_answer(@answers[3]) end
  end
end

def check_answer(answer)
  clear_screen
  if answer.correct_answer
    $count += 1
    $prompt.say("You're a wizard!")
  else
    $prompt.say("muggle, smh")
    sleep(1)
    you_lose
    $lost = true
  end
end

def you_lose
  if $count > @user.high_score
    @user.high_score = $count
  end
  clear_screen
  you_lose_page
  sleep(2)
  puts "you have died"
  sleep(2)
  game_menu
end

def view_profile
  clear_screen
  profile_page
  $prompt.select("What you wanna do?") do |menu|

    # show liked quotes
    menu.choice "Go back" => -> do game_menu end
    menu.choice "Exit" => -> do exit_trivia end
  end
end

def manage_account
  clear_screen
  $prompt.select("What you wanna do?") do |menu|
    menu.choice "Change username" => -> do change_username end
    menu.choice "Change password" => -> do change_password end
    menu.choice "Change name" => -> do change_name end
    menu.choice "Delete account" => -> do delete_account end
    menu.choice "Go back" => -> do game_menu end
    menu.choice "Exit" => -> do exit_trivia end
  end
end

def change_username
  clear_screen

end

def change_password
  clear_screen
end

def change_name
  clear_screen
  name_input = $prompt.ask("Name") do |q|
    q.validate(/^\A[a-zA-Z ]{3,20}\z$/, "Name must be between 3-20 characters. Can only contain letters and spaces.")
  end
  @user.name = name_input
  clear_screen
  puts "Name successfully changed"
  sleep(1)
  manage_account
end

def delete_account
  clear_screen
end

def view_highscore
  clear_screen
end
