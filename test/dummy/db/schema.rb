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

ActiveRecord::Schema.define(version: 2019_10_12_135930) do

  create_table "asdfs", force: :cascade do |t|
    t.boolean "bool"
    t.date "dated_on"
    t.datetime "datetimed_at"
  end

  create_table "qwers", force: :cascade do |t|
    t.date "dated_on"
    t.datetime "datetimed_at"
  end

end
