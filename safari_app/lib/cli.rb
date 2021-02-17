require "tty-prompt"
def prompt 
    prompt = TTY::Prompt.new
end

def welcome
    puts "Welcome to the Safari" 
    returning = prompt.select("Are you a new explorer?", ["New Explorer", "Returning Adventurer"])
    if returning == "New Explorer" 
        sign_up
    else 
        log_in
    end
end

def sign_up 
    puts "Welcome, new expolorer! Create Username"
    input = gets.chomp.downcase 
    user = User.create(name: input)
    $user = user 
    puts "Thanks #{input}!"
    sleep(2)
end

def log_in
    puts "Awesome! Please sign in"
    input = gets.chomp.downcase
    user = User.all.filter do |user|
        user.name.downcase == input 
    end
    $user = user
    if user[0] 
        puts "Welcome Back #{input}!"
    else
        oops = prompt.yes?("Oops! did you mean to Sign Up?") 
        if oops
            sign_up
        else
            log_in
        end
    end
end

def adventure_or_photo
    system('clear')
    start = prompt.select("Would you like to view your photos or go exploring", ["Photos", "New Advenutre", "Exit"])
    if start == "Photos"
        view_photos
    elsif start == "New Advenutre"
        adventure
    else
        puts "See you next time!"
        system('exit')
    end
end

def view_photos
    photo = $user[0].photos
    if photo[0]
        photo.each do |photo|
            puts photo
        end
    else
        puts "Oops! it looks like you have no photos!"
        new_adventure = prompt.yes?("Would you like to start a new adventure?")
        if new_adventure
            puts "Let's go explore!"
            sleep(1)
            adventure
        else
            puts "Okay, we will see you next time"
            system("exit")
        end
    end
end

def adventure
    puts "Place holder fun text explaining safari story"

    def generate_animal
    rand_id = rand(10..12)    
    animal = Animal.all.filter do |animal|
            animal.id == rand_id
        end
    $animal = animal[0]
    end

    def see_animal
        generate_animal
        puts "Ahhhhhh!! A wild #{$animal.name} " 
    end

    see_animal

    def picture_or_path
        pic_or_run = prompt.select("Do you want to take a picture or run away?", ["Take a picture", "High tail it out of here"])
        if pic_or_run == "Take a picture"
            Photo.create(user: $user[0], animal: $animal)
        else
            puts "1.............                           2..............                            3..................                          YOU GOT AWAY SAFELY"
        continue = prompt.yes?("Do you want to continue your adventure?")
            if continue 
                see_animal
            else
                adventure_or_photo
            end
        end
    end

    picture_or_path

end