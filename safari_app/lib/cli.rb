require "tty-prompt"
require 'ruby2d'

class CLI

    def prompt 
        prompt = TTY::Prompt.new
    end

    def hero
        system "clear"
        puts "Welcome to:"
        title = Artii::Base.new(:font => "slant")
        puts title.asciify("JUNGLE BOOGIE")
    #     pid = fork{exec "afplay", "lib/songs/Jungle_Boogie_Edit.mp3"}
    end

    def welcome
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
        adventure_or_photo
    end

    def log_in
        puts "Awesome! Please sign in"
        input = gets.chomp.downcase
        user = User.all.filter do |user|
            user.name.downcase == input 
        end
        $user = user[0]
        if user[0] 
            puts "Welcome Back #{input}!"
            adventure_or_photo
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
            adventure_1
        else
            puts "See you next time!"
            system('exit')
        end
    end

    def view_photos
        system('clear')
        photo = $user.photos
        binding.pry
        if photo.length > 0
            action = prompt.select("What would you like to do?", ["Look at photos", "Remove Photo"]) 
            if  action == "Look at photos"
                photo_array = photo.all.map {|photo|  photo.animal_id}
                photo_array.each { |id| puts Animal.find(id).emoji}
                sleep(5)
                adventure_or_photo
            else
                all_photos = photo.all.map {|photo| photo.id.to_s}
                selected = prompt.select("Which photo would you like to delete" , all_photos)
                selected_photo = Photo.find(selected)
                sleep(1)
                confirmation = prompt.yes? ("Do you really want to destory this photo?")
                if confirmation 
                    selected_photo.destroy
                    adventure_or_photo
                else
                    adventure_or_photo
                end
            end
        else
            puts "Oops! it looks like you have no photos!"
            new_adventure = prompt.yes?("Would you like to start a new adventure?")
            if new_adventure
                puts "Let's go explore!"
                sleep(1)
                adventure_1
            else
                puts "Okay, we will see you next time"
                system("exit")
            end
        end
    end

    def adventure_1
        system('clear')
        puts "welcome to Jungle Boogie! Here the adventure begins……."
        sleep(2)
        puts "You are greeted with a handshake from your guide as he opens the door and climb into the back seat…."
        sleep(2)
        puts "Your guide gives you a smile & begins to drive down the path leading you to the majestic kingdom that is the wild….."
        sleep(4)
        adventure
    end

    def adventure
        system('clear')
        see_animal
        sleep(1)
        picture_or_path
    end

    def generate_animal
        rand_id = rand(64..72)    
        animal = Animal.all.filter do |animal|
            animal.id == rand_id
        end
        $animal = animal[0]
    end

    def see_animal
        generate_animal
        puts "Ahhhhhh!! A wild #{$animal.name} " 
    end

    def picture_or_path
        pic_or_run = prompt.select("Do you want to take a picture or run away?", ["Take a picture", "High tail it out of here"])
        if pic_or_run == "Take a picture"
            binding.pry
            new_photo =  Photo.new(user: $user, animal: $animal)
            binding.pry
            save_photo = prompt.yes?("Do you want to save this picture?")
            if save_photo
                new_photo.save
                continue
            else
                puts "Okay, picture has been deleted"
                continue
            end
        else
            puts "1..................  2.................. 3.................. YOU GOT AWAY SAFELY"
            continue
        end
    end

    def continue
        want_to_continue = prompt.yes?("Do you want to continue your adventure?")
        # 
        if want_to_continue 
            next_adventure
        else
            adventure_or_photo
        end
    end

    def next_adventure
        adventure_picker = rand(1..7)

        case adventure_picker
        when 1
            system('clear')
            puts "As your guide continues down the path, you notice that you are approaching a large watering hole. The guide pulls of the road.  He looks back and asks Shall we see if anyone is out for a drink?”"
            sleep(3)
            adventure
        when 2
            system('clear')
            puts "Continuing on your adventure you have now finall reached the amazing savana! So many creatures. Who knows what animals are waiting to greet us"
            sleep(3)
            adventure
        when 3
            system('clear')
            puts "💀 💀  Your Jeep was over run by a pack of wild chimps! SORRY 💀 💀 "
            sleep(2)
            system('exit')
        when 4
            system('clear')
            puts "I think thats enough for today! Time to head back to the lodge."
            sleep(3)
            adventure_or_photo
        when 5
            system('clear')
            puts "Ahhhh smashing! Lets get to it then!"
            adventure
        when 6
            system('clear')
            puts "Make sure to listen for the fish eagle. Keep your eyes sharp!"
            adventure
        when 7 
            system('clear')
            puts "I think I was a pack of antelope this way! Make sure you have your camera ready."
        end
    end
end