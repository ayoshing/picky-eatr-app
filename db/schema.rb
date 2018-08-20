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

ActiveRecord::Schema.define(version: 20180711125925) do
=======
ActiveRecord::Schema.define(version: 20180713060749) do
>>>>>>> final-countdown

  create_table "cuisines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuisines_preferences", id: false, force: :cascade do |t|
    t.integer "preference_id", null: false
    t.integer "cuisine_id", null: false
    t.index ["cuisine_id", "preference_id"], name: "index_cuisines_preferences_on_cuisine_id_and_preference_id"
    t.index ["preference_id", "cuisine_id"], name: "index_cuisines_preferences_on_preference_id_and_cuisine_id"
=======
  create_table "cuisines_preferences", force: :cascade do |t|
    t.integer "cuisine_id"
    t.integer "preference_id"
  end

>>>>>>> 3866f856621d49d5a71bd77ddeb1e9f7329b1422
  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
    t.string "cuisine_ids"
=======
>>>>>>> final-countdown
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.integer "cuisine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "password_digest"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
