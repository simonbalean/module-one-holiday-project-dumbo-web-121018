class Question < ActiveRecord::Base

  has_many :quiz_questions
  has_many :answers
  has_many :likes

end
