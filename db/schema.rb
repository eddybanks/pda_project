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

ActiveRecord::Schema.define(version: 0) do

  create_table "Attractions", primary_key: "Number", force: :cascade do |t|
    t.string  "Name",        limit: 255, null: false
    t.string  "Size",        limit: 255
    t.string  "Type",        limit: 255
    t.integer "Park_number", limit: 4,   null: false
  end

  add_index "Attractions", ["Park_number"], name: "Park_number", using: :btree

  create_table "Attractions_Sell", id: false, force: :cascade do |t|
    t.integer "Attraction_number",  limit: 4, null: false
    t.integer "Transaction_number", limit: 4, null: false
  end

  add_index "Attractions_Sell", ["Transaction_number"], name: "Transaction_number", using: :btree

  create_table "Parks", primary_key: "Number", force: :cascade do |t|
    t.string "Name",    limit: 255, null: false
    t.string "Address", limit: 255, null: false
    t.string "Size",    limit: 255
  end

  create_table "Parks_Sell", id: false, force: :cascade do |t|
    t.integer "Park_number",        limit: 4, null: false
    t.integer "Transaction_number", limit: 4, null: false
  end

  add_index "Parks_Sell", ["Transaction_number"], name: "Transaction_number", using: :btree

  create_table "Reviews", primary_key: "Number", force: :cascade do |t|
    t.string  "Comment",           limit: 255
    t.integer "Rating",            limit: 4
    t.integer "Visitor_id",        limit: 4
    t.integer "Attraction_number", limit: 4
  end

  add_index "Reviews", ["Attraction_number"], name: "Attraction_number", using: :btree
  add_index "Reviews", ["Visitor_id"], name: "Visitor_id", using: :btree

  create_table "Transactions", primary_key: "Number", force: :cascade do |t|
    t.datetime "Date",                   null: false
    t.string   "Type",       limit: 255, null: false
    t.string   "Price",      limit: 255, null: false
    t.integer  "Visitor_id", limit: 4,   null: false
  end

  add_index "Transactions", ["Visitor_id"], name: "Visitor_id", using: :btree

  create_table "Visitors", primary_key: "ID", force: :cascade do |t|
    t.string   "Name",     limit: 255, null: false
    t.string   "Gender",   limit: 2
    t.datetime "Birthday"
  end

  create_table "departments", primary_key: "dept_no", force: :cascade do |t|
    t.string "dept_name", limit: 40, null: false
  end

  add_index "departments", ["dept_name"], name: "dept_name", unique: true, using: :btree

  create_table "dept_emp", id: false, force: :cascade do |t|
    t.integer "emp_no",    limit: 4, null: false
    t.string  "dept_no",   limit: 4, null: false
    t.date    "from_date",           null: false
    t.date    "to_date",             null: false
  end

  add_index "dept_emp", ["dept_no"], name: "dept_no", using: :btree
  add_index "dept_emp", ["emp_no"], name: "emp_no", using: :btree

  create_table "dept_manager", id: false, force: :cascade do |t|
    t.string  "dept_no",   limit: 4, null: false
    t.integer "emp_no",    limit: 4, null: false
    t.date    "from_date",           null: false
    t.date    "to_date",             null: false
  end

  add_index "dept_manager", ["dept_no"], name: "dept_no", using: :btree
  add_index "dept_manager", ["emp_no"], name: "emp_no", using: :btree

  create_table "employees", primary_key: "emp_no", force: :cascade do |t|
    t.date   "birth_date",            null: false
    t.string "first_name", limit: 14, null: false
    t.string "last_name",  limit: 16, null: false
    t.string "gender",     limit: 1,  null: false
    t.date   "hire_date",             null: false
  end

  create_table "prices_without_symbol", id: false, force: :cascade do |t|
    t.float "Price", limit: 53
  end

  create_table "salaries", id: false, force: :cascade do |t|
    t.integer "emp_no",    limit: 4, null: false
    t.integer "salary",    limit: 4, null: false
    t.date    "from_date",           null: false
    t.date    "to_date",             null: false
  end

  add_index "salaries", ["emp_no"], name: "emp_no", using: :btree

  create_table "titles", id: false, force: :cascade do |t|
    t.integer "emp_no",    limit: 4,  null: false
    t.string  "title",     limit: 50, null: false
    t.date    "from_date",            null: false
    t.date    "to_date"
  end

  add_index "titles", ["emp_no"], name: "emp_no", using: :btree

  add_foreign_key "dept_emp", "departments", column: "dept_no", primary_key: "dept_no", name: "dept_emp_ibfk_2", on_delete: :cascade
  add_foreign_key "dept_emp", "employees", column: "emp_no", primary_key: "emp_no", name: "dept_emp_ibfk_1", on_delete: :cascade
  add_foreign_key "dept_manager", "departments", column: "dept_no", primary_key: "dept_no", name: "dept_manager_ibfk_2", on_delete: :cascade
  add_foreign_key "dept_manager", "employees", column: "emp_no", primary_key: "emp_no", name: "dept_manager_ibfk_1", on_delete: :cascade
  add_foreign_key "salaries", "employees", column: "emp_no", primary_key: "emp_no", name: "salaries_ibfk_1", on_delete: :cascade
  add_foreign_key "titles", "employees", column: "emp_no", primary_key: "emp_no", name: "titles_ibfk_1", on_delete: :cascade
end
