
# Jungle Boogie


## Table of Contents 
:elephant: General Information

:snake: Code Snippet

:monkey: Technologies

:tiger2: Features

:water_buffalo: Status

:turtle: Creators



  ## General Information

Jungle Boogie is a CLI app that allows users to take an amazing safari adventure! Users are able to see animals on the safari and choose to either take a picture of that animal or continue on. Users will also have a photo album to either view or delete saved photos. Let the adventures begin!

## Code Snippet 
    def welcome
        returning = prompt.select("Are you a new explorer?", ["New Explorer", "Returning Adventurer"])
        if returning == "New Explorer" 
            sign_up
        else 
            log_in
        end
    end



## Technologies 
* Ruby
* ActiveRecord
* Sinatra-ActiveRecord
* sqlite3
* tty-prompt


## Features

* sign up as new user
* log in as returning user
* start a new adventure
* see animals 
* take photo or
* run away!
* save photos to photo album
* veiw photo album 
* delete photos from photo album

## Status 

Finished with options to expand on detail and functionality.

## Creators 
[Phil Haines](https://www.linkedin.com/in/philip-haines/) 

[Destiny Boing](http://linkedin.com/in/destiny-boling-58664554) 
