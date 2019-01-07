puts "setting up seeds"
# deletes all questions
Question.destroy_all
Answer.destroy_all
# User.destroy_all

question1 = Question.create(quote: "who stole the sorcerer's stone?")
question1.answers << Answer.create(author: "prof. quirrel", correct_answer: true)
question1.answers << Answer.create(author: "prof. squirrel")
question1.answers << Answer.create(author: "prof. snape")
question1.answers << Answer.create(author: "ron weazly")

question2 = Question.create(quote: "where is the entrance to the chamber of secrets?")
question2.answers << Answer.create(author: "under the whomping willow")
question2.answers << Answer.create(author: "girl's bathroom", correct_answer: true)
question2.answers << Answer.create(author: "room of requirements")
question2.answers << Answer.create(author: "slytherin common room")

question3 = Question.create(quote: "who kills dumbledore?")
question3.answers << Answer.create(author: "malfoy")
question3.answers << Answer.create(author: "voldemort")
question3.answers << Answer.create(author: "snape", correct_answer: true)
question3.answers << Answer.create(author: "bellatrix")

question4 = Question.create(quote: "who is the half blood prince?")
question4.answers << Answer.create(author: "ron")
question4.answers << Answer.create(author: "harry")
question4.answers << Answer.create(author: "hermionie")
question4.answers << Answer.create(author: "snape", correct_answer: true)

question5 = Question.create(quote: "who does bellatrix kill?")
question5.answers << Answer.create(author: "dobby")
question5.answers << Answer.create(author: "tonks")
question5.answers << Answer.create(author: "sirius black")
question5.answers << Answer.create(author: "all of the above", correct_answer: true)

question6 = Question.create(quote: "how many siblings does ron have?")
question6.answers << Answer.create(author: "four")
question6.answers << Answer.create(author: "five")
question6.answers << Answer.create(author: "six", correct_answer: true)
question6.answers << Answer.create(author: "seven")

question7 = Question.create(quote: "who is gryffindor")
question7.answers << Answer.create(author: "crabbe")
question7.answers << Answer.create(author: "goyle")
question7.answers << Answer.create(author: "neville", correct_answer: true)
question7.answers << Answer.create(author: "cedric diggory")


#
# question1 = Question.create(quote: "one fish, two fish, red fish, blue fish")
# question1.answers << Answer.create(author: "dr. suess", correct_answer: true)
# question1.answers << Answer.create(author: "mr. suess")
# question1.answers << Answer.create(author: "mrs. suess")
# question1.answers << Answer.create(author: "captn suess")

# question1 = Question.create(quote: "The square root of 69 is 8 something, right? \n \'cause I\'ve been trying to work it out")
# question1.answers << Answer.create(author: "Drake", correct_answer: true)
# question1.answers << Answer.create(author: "wrongg")
# question1.answers << Answer.create(author: "wrongg")
# question1.answers << Answer.create(author: "wrongg")
#
# question2 = Question.create(quote: "She got a light skin friend, look like Michael Jackson. Got a dark skin friend, look like Michael Jackson")
# question2.answers << Answer.create(author: "wrongg")
# question2.answers << Answer.create(author: "Kanye West", correct_answer: true)
# question2.answers << Answer.create(author: "wrongg")
# question2.answers << Answer.create(author: "wrongg")
#
# question3 = Question.create(quote: "Girl, you\'re hot and cold. That makes you warm")
# question3.answers << Answer.create(author: "wrongg")
# question3.answers << Answer.create(author: "wrongg")
# question3.answers << Answer.create(author: "Tyga", correct_answer: true)
# question3.answers << Answer.create(author: "wrongg")
#
# question4 = Question.create(quote: "I love you, like a fat kid loves cake")
# question4.answers << Answer.create(author: "wrongg")
# question4.answers << Answer.create(author: "wrongg")
# question4.answers << Answer.create(author: "wrongg")
# question4.answers << Answer.create(author: "50 Cent", correct_answer: true)
#
# question5 = Question.create(quote: "I sell ice in the winter. I sell fire in hell. I\'m a hustler baby. I\'ll sell water to a well")
# question5.answers << Answer.create(author: "wrongg")
# question5.answers << Answer.create(author: "wrongg")
# question5.answers << Answer.create(author: "Jay Z", correct_answer: true)
# question5.answers << Answer.create(author: "wrongg")
#
# question6 = Question.create(quote: "She said, \'Boy, you want your cake and eat it too.\' I said it\'s cake. That\'s what you\'re supposed to do")
# question6.answers << Answer.create(author: "wrongg")
# question6.answers << Answer.create(author: "J. Cole", correct_answer: true)
# question6.answers << Answer.create(author: "wrongg")
# question6.answers << Answer.create(author: "wrongg")
#
# question7 = Question.create(quote: "You remind me of a school on a Sunday. No class")
# question7.answers << Answer.create(author: "Redman", correct_answer: true)
# question7.answers << Answer.create(author: "wrongg")
# question7.answers << Answer.create(author: "wrongg")
# question7.answers << Answer.create(author: "wrongg")
#
# question8 = Question.create(quote: "Have you ever seen crocodile seats in the truck? Turn around. Sit down. Let \'em bite yo butt")
# question8.answers << Answer.create(author: "wrongg")
# question8.answers << Answer.create(author: "Big Tymers", correct_answer: true)
# question8.answers << Answer.create(author: "wrongg")
# question8.answers << Answer.create(author: "wrongg")
#
# question9 = Question.create(quote: "Couldn\'t afford a car. So she named her daughter Alexis")
# question9.answers << Answer.create(author: "wrongg")
# question9.answers << Answer.create(author: "wrongg")
# question9.answers << Answer.create(author: "Kanye West", correct_answer: true)
# question9.answers << Answer.create(author: "wrongg")





puts "finished running seeds!"
