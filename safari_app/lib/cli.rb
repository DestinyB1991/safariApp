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
 puts "Thanks #{input}!"
end

def log_in
    puts "Welcome back!"
    input = gets.chomp.downcase
    user = User.all.filter do |user|
        user.name.downcase == input
    end
    binding.pry
    puts "Thanks #{input}!"
end