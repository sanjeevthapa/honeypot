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

ActiveRecord::Schema.define(version: 20161120112917) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "content",    limit: 65535
    t.string   "image"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_jobs", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "job_id",      null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "fk_rails_3b7ee7e432", using: :btree
    t.index ["job_id"], name: "fk_rails_f31e03e350", using: :btree
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "fk_rails_e57cb42012", using: :btree
  end

  create_table "job_seeker_resumes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "profession"
    t.text     "resume_content",        limit: 65535
    t.string   "school_name"
    t.string   "qualification"
    t.date     "education_start_date"
    t.date     "education_end_date"
    t.text     "education_note",        limit: 65535
    t.string   "employer"
    t.string   "job_title"
    t.string   "experience_institute"
    t.date     "experience_start_date"
    t.date     "experience_end_date"
    t.text     "experience_note",       limit: 65535
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["user_id"], name: "index_job_seeker_resumes_on_user_id", using: :btree
  end

  create_table "job_seekers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "fk_rails_7c37d45b07", using: :btree
  end

  create_table "job_seekers_jobs", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "job_id",        null: false
    t.integer "job_seeker_id", null: false
    t.index ["job_id"], name: "fk_rails_b293eee1a5", using: :btree
    t.index ["job_seeker_id"], name: "fk_rails_1c8ad9b603", using: :btree
  end

  create_table "job_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.string   "image"
    t.integer  "salary"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "company_id"
    t.integer  "job_type_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["company_id"], name: "fk_rails_b34da78090", using: :btree
    t.index ["job_type_id"], name: "fk_rails_8466b38317", using: :btree
  end

  create_table "jobs_tags", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "job_id", null: false
    t.integer "tag_id", null: false
    t.index ["job_id"], name: "fk_rails_d9fe46ad96", using: :btree
    t.index ["tag_id"], name: "fk_rails_e42b95de0c", using: :btree
  end

  create_table "site_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "facebook"
    t.string   "twitter"
    t.string   "gplus"
    t.string   "linkedin"
    t.string   "location"
    t.string   "phone_no"
    t.string   "email"
    t.string   "website"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_queries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "email",      limit: 65535
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "status"
    t.string   "verify_token"
    t.datetime "verify_token_sent_at"
    t.boolean  "terms"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "gender"
    t.date     "dob"
    t.integer  "age"
    t.bigint   "mobile"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "location"
    t.integer  "type"
  end

  add_foreign_key "categories_jobs", "categories"
  add_foreign_key "categories_jobs", "jobs"
  add_foreign_key "companies", "users"
  add_foreign_key "job_seeker_resumes", "users"
  add_foreign_key "job_seekers", "users"
  add_foreign_key "job_seekers_jobs", "job_seekers"
  add_foreign_key "job_seekers_jobs", "jobs"
  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs", "job_types"
  add_foreign_key "jobs_tags", "jobs"
  add_foreign_key "jobs_tags", "tags"
end
