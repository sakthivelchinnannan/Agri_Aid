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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120328181250) do

  create_table "dealers", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "street"
    t.string   "taluk"
    t.string   "district"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "farmers", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "village"
    t.string   "taluk"
    t.string   "district"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "farmers", ["phone"], :name => "index_farmers_on_phone", :unique => true
  add_index "farmers", ["remember_token"], :name => "index_farmers_on_remember_token"

  create_table "lendablemachineries", :force => true do |t|
    t.integer  "machinery_id"
    t.integer  "lender_id"
    t.integer  "numofmachines"
    t.float    "rateperhr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lendablemachineries", ["lender_id", "machinery_id"], :name => "index_lendablemachineries_on_lender_id_and_machinery_id", :unique => true
  add_index "lendablemachineries", ["lender_id"], :name => "index_lendablemachineries_on_lender_id"
  add_index "lendablemachineries", ["machinery_id"], :name => "index_lendablemachineries_on_machinery_id"

  create_table "lenders", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "street"
    t.string   "taluk"
    t.string   "district"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "lenders", ["email"], :name => "index_lenders_on_email", :unique => true
  add_index "lenders", ["remember_token"], :name => "index_lenders_on_remember_token"

  create_table "machineries", :force => true do |t|
    t.string   "name"
    t.string   "manufacturer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "machinerycategory_id"
  end

  add_index "machineries", ["machinerycategory_id"], :name => "index_machineries_on_machinerycategory_id"

  create_table "machinerycategories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "machinerycategories", ["name"], :name => "index_machinerycategories_on_name", :unique => true

end
