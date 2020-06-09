class Movie < ApplicationRecord
    has_many :usermovies
    has_many :users, through: :usermovies
end
