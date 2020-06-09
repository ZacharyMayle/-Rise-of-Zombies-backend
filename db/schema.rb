# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_09_172114) do

  create_table "movies", force: :cascade do |t|
    t.string "original_title"
    t.string "release_date"
    t.float "vote_average"
    t.integer "vote_count"
    t.string "poster"
    t.string "overview"
    t.integer "usermovies_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["usermovies_id"], name: "index_movies_on_usermovies_id"
  end

  create_table "usermovies", force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_usermovies_on_movie_id"
    t.index ["user_id"], name: "index_usermovies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.integer "usermovies_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["usermovies_id"], name: "index_users_on_usermovies_id"
  end

  add_foreign_key "movies", "usermovies", column: "usermovies_id"
  add_foreign_key "users", "usermovies", column: "usermovies_id"
end
