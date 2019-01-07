# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190102181821) do

  create_table "answers", force: :cascade do |t|
    t.string  "author"
    t.integer "question_id"
    t.boolean "correct_answer"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "quote"
  end

  create_table "quiz_questions", force: :cascade do |t|
    t.integer "quiz_id"
    t.integer "question_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "password"
    t.string  "name"
    t.integer "high_score"
  end

end
