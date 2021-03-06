# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150122073107) do

  create_table "exam_answers", force: true do |t|
    t.integer  "exam_id",    null: false
    t.integer  "user_id",    null: false
    t.boolean  "q1",         null: false
    t.boolean  "q2",         null: false
    t.boolean  "q3",         null: false
    t.boolean  "q4",         null: false
    t.boolean  "q5",         null: false
    t.boolean  "q6",         null: false
    t.boolean  "q7",         null: false
    t.boolean  "q8",         null: false
    t.boolean  "q9",         null: false
    t.boolean  "q10",        null: false
    t.integer  "rec_points", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "ans1",       null: false
    t.text     "ans2",       null: false
    t.text     "ans3",       null: false
    t.text     "ans4",       null: false
    t.text     "ans5",       null: false
    t.text     "ans6",       null: false
    t.text     "ans7",       null: false
    t.text     "ans8",       null: false
    t.text     "ans9",       null: false
    t.text     "ans10",      null: false
    t.text     "exam_level"
  end

  create_table "exams", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "level"
    t.text     "question1"
    t.text     "question2"
    t.text     "question3"
    t.text     "question4"
    t.text     "question5"
    t.text     "question6"
    t.text     "question7"
    t.text     "question8"
    t.text     "question9"
    t.text     "question10"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "branch"
    t.text     "text"
    t.text     "answer1"
    t.text     "answer2"
    t.text     "answer3"
    t.text     "answer4"
    t.text     "answerR"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "questionID"
    t.string   "level"
  end

  create_table "user_progresses", force: true do |t|
    t.integer  "user_id",                      null: false
    t.boolean  "p1",           default: false, null: false
    t.boolean  "p2",           default: false, null: false
    t.boolean  "p3",           default: false, null: false
    t.boolean  "p4",           default: false, null: false
    t.boolean  "p5",           default: false, null: false
    t.boolean  "p6",           default: false, null: false
    t.boolean  "p7",           default: false, null: false
    t.boolean  "p8",           default: false, null: false
    t.boolean  "p9",           default: false, null: false
    t.boolean  "p10",          default: false, null: false
    t.boolean  "poczatkujacy", default: false, null: false
    t.boolean  "z1",           default: false, null: false
    t.boolean  "z2",           default: false, null: false
    t.boolean  "z3",           default: false, null: false
    t.boolean  "z4",           default: false, null: false
    t.boolean  "z5",           default: false, null: false
    t.boolean  "z6",           default: false, null: false
    t.boolean  "z7",           default: false, null: false
    t.boolean  "z8",           default: false, null: false
    t.boolean  "z9",           default: false, null: false
    t.boolean  "z10",          default: false, null: false
    t.boolean  "zaawansowany", default: false, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at"
    t.boolean  "complete_all", default: false, null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin"
    t.boolean  "instructor"
    t.integer  "points",                 default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
