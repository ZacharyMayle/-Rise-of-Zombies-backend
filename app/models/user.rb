class User < ApplicationRecord
    has_many :usermovies
    has_many :movies, through: :usermovies
end
