class User < ActiveRecord::Base

    has_many :photos
    has_many :animals, through: :photos
    
end