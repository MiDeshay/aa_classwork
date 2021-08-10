# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mike = User.create(username: "mike")
jimmy = User.create(username: "jimmy")
laura = User.create(username: "laura")


science = Poll.new(user_id: 1, title: "Science")
geography = Poll.new(user_id: 2, title: "Geography")

sci1 = Question.new(poll_id: 1, text: "Hg is the chemical symbol of which element?")
sci2 = Question.new(poll_id: 2, text: "About how many taste buds does the average human tongue have?")
geo1 = Question.new(poll_id: 3, text: "What is the capital city of Spain?")


sci1_A = AnswerChoice.new(question_id: 1, text: 'Helium')
sci1_B = AnswerChoice.new(question_id: 1, text: 'Hydrogen')
sci1_C = AnswerChoice.new(question_id: 1, text: 'Mecury')
sci1_D = AnswerChoice.new(question_id: 1, text: 'Neon')

sci2_A = AnswerChoice.new(question_id: 2, text: '10,000')
sci2_B = AnswerChoice.new(question_id: 2, text: '20,000')
sci2_C = AnswerChoice.new(question_id: 2, text: '200,000')
sci2_D = AnswerChoice.new(question_id: 2, text: '800,000')

geo1_A = AnswerChoice.new(question_id: 3, text: 'Seville')
geo1_B = AnswerChoice.new(question_id: 3, text: 'Barcelona')
geo1_C = AnswerChoice.new(question_id: 3, text: 'Madrid')
geo1_D = AnswerChoice.new(question_id: 3, text: 'Granada')

mike_sci1_res = Response.new(user_id: 1, question_id: 1, answer_choice_id: 3)
mike_sci2_res = Response.new(user_id: 1, question_id: 2, answer_choice_id: 1)
mike_geo1_res = Response.new(user_id: 1, question_id: 3, answer_choice_id: 3)

jimmy_sci1_res = Response.new(user_id: 2, question_id: 1, answer_choice_id: 3)
jimmy_sci2_res = Response.new(user_id: 2, question_id: 2, answer_choice_id: 2)
jimmy_geo1_res = Response.new(user_id: 2, question_id: 3, answer_choice_id: 4)

laura_sci1_res = Response.new(user_id: 3, question_id: 1, answer_choice_id: 2)
laura_sci2_res = Response.new(user_id: 3, question_id: 2, answer_choice_id: 3)
laura_geo1_res = Response.new(user_id: 3, question_id: 3, answer_choice_id: 3)

