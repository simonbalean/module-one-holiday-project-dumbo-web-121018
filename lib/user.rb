class User < ActiveRecord::Base

  has_many :quizzes
  has_many :likes
  # attr_accessor :highscore

end
