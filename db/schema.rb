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

ActiveRecord::Schema.define(version: 20160313091917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_degrees", force: :cascade do |t|
    t.string  "degree",  default: ""
    t.boolean "enabled", default: false
  end

  add_index "academic_degrees", ["degree"], name: "index_academic_degrees_on_degree", using: :btree

  create_table "academic_levels", force: :cascade do |t|
    t.string "name"
  end

  add_index "academic_levels", ["name"], name: "index_academic_levels_on_name", using: :btree

  create_table "applicant_contact_details", force: :cascade do |t|
    t.integer "applicant_id",    default: 0
    t.integer "contact_type_id", default: 0
    t.string  "value",           default: ""
  end

  add_index "applicant_contact_details", ["applicant_id"], name: "index_applicant_contact_details_on_applicant_id", using: :btree
  add_index "applicant_contact_details", ["contact_type_id"], name: "index_applicant_contact_details_on_contact_type_id", using: :btree

  create_table "applicant_educations", force: :cascade do |t|
    t.integer "applicant_id",      default: 0
    t.string  "school",            default: ""
    t.integer "academic_level_id", default: 0
    t.string  "academic_degree",   default: ""
    t.integer "from"
    t.integer "to"
  end

  add_index "applicant_educations", ["applicant_id"], name: "index_applicant_educations_on_applicant_id", using: :btree

  create_table "applicant_employments", force: :cascade do |t|
    t.integer "applicant_id", default: 0
    t.string  "occupation",   default: ""
    t.string  "country",      default: ""
    t.string  "employer",     default: ""
    t.string  "from",         default: "1990"
    t.string  "to",           default: "1990"
    t.integer "years"
    t.string  "address",      default: ""
    t.string  "contact",      default: ""
    t.string  "salary",       default: ""
  end

  add_index "applicant_employments", ["applicant_id"], name: "index_applicant_employments_on_applicant_id", using: :btree

  create_table "applicant_family_details", force: :cascade do |t|
    t.integer "applicant_id", default: 0
    t.integer "sisters"
    t.integer "brothers"
    t.integer "no_in_fam"
    t.integer "eldest"
    t.integer "youngest"
    t.integer "children"
  end

  add_index "applicant_family_details", ["applicant_id"], name: "index_applicant_family_details_on_applicant_id", using: :btree

  create_table "applicant_family_members", force: :cascade do |t|
    t.integer "applicant_id",    default: 0
    t.string  "occupation",      default: ""
    t.integer "relationship_id", default: 0
    t.string  "name",            default: ""
    t.string  "salary",          default: ""
    t.integer "age"
  end

  add_index "applicant_family_members", ["applicant_id"], name: "index_applicant_family_members_on_applicant_id", using: :btree
  add_index "applicant_family_members", ["relationship_id"], name: "index_applicant_family_members_on_relationship_id", using: :btree

  create_table "applicant_languages", force: :cascade do |t|
    t.integer "applicant_id", default: 0
    t.integer "language_id",  default: 0
    t.boolean "read"
    t.boolean "write"
    t.boolean "speak"
  end

  add_index "applicant_languages", ["applicant_id"], name: "index_applicant_languages_on_applicant_id", using: :btree
  add_index "applicant_languages", ["language_id"], name: "index_applicant_languages_on_language_id", using: :btree

  create_table "applicant_meta_data", force: :cascade do |t|
    t.integer "applicant_id"
    t.string  "key"
    t.string  "value"
  end

  create_table "applicant_photos", force: :cascade do |t|
    t.integer  "applicant_id",           default: 0
    t.string   "mug_shot_file_name"
    t.string   "mug_shot_content_type"
    t.string   "mug_shot_file_size"
    t.datetime "mug_shot_updated_at"
    t.string   "full_body_file_name"
    t.string   "full_body_content_type"
    t.string   "full_body_file_size"
    t.datetime "full_body_updated_at"
    t.integer  "crop_mug_shot_x"
    t.integer  "crop_mug_shot_y"
    t.integer  "crop_mug_shot_w"
    t.integer  "crop_mug_shot_h"
    t.integer  "crop_full_body_x"
    t.integer  "crop_full_body_y"
    t.integer  "crop_full_body_w"
    t.integer  "crop_full_body_h"
  end

  add_index "applicant_photos", ["applicant_id"], name: "index_applicant_photos_on_applicant_id", using: :btree
  add_index "applicant_photos", ["full_body_content_type"], name: "index_applicant_photos_on_full_body_content_type", using: :btree
  add_index "applicant_photos", ["full_body_file_name"], name: "index_applicant_photos_on_full_body_file_name", using: :btree
  add_index "applicant_photos", ["full_body_file_size"], name: "index_applicant_photos_on_full_body_file_size", using: :btree
  add_index "applicant_photos", ["full_body_updated_at"], name: "index_applicant_photos_on_full_body_updated_at", using: :btree
  add_index "applicant_photos", ["mug_shot_content_type"], name: "index_applicant_photos_on_mug_shot_content_type", using: :btree
  add_index "applicant_photos", ["mug_shot_file_name"], name: "index_applicant_photos_on_mug_shot_file_name", using: :btree
  add_index "applicant_photos", ["mug_shot_file_size"], name: "index_applicant_photos_on_mug_shot_file_size", using: :btree
  add_index "applicant_photos", ["mug_shot_updated_at"], name: "index_applicant_photos_on_mug_shot_updated_at", using: :btree

  create_table "applicant_requirements", force: :cascade do |t|
    t.integer "applicant_id", default: 0
    t.integer "document_id",  default: 0
    t.date    "apply"
    t.date    "arrive"
    t.date    "expire"
    t.string  "note",         default: ""
  end

  add_index "applicant_requirements", ["applicant_id"], name: "index_applicant_requirements_on_applicant_id", using: :btree
  add_index "applicant_requirements", ["document_id"], name: "index_applicant_requirements_on_document_id", using: :btree
  add_index "applicant_requirements", ["document_id"], name: "index_applicant_requirements_on_requirement_id", using: :btree

  create_table "applicant_skills", force: :cascade do |t|
    t.integer "applicant_id", default: 0
    t.integer "skill_id",     default: 0
  end

  add_index "applicant_skills", ["applicant_id"], name: "index_applicant_skills_on_applicant_id", using: :btree
  add_index "applicant_skills", ["skill_id"], name: "index_applicant_skills_on_skill_id", using: :btree

  create_table "applicants", force: :cascade do |t|
    t.integer "religion_id",     default: 0
    t.integer "citizenship_id",  default: 0
    t.integer "civil_status_id", default: 0
    t.string  "first_name",      default: ""
    t.string  "last_name",       default: ""
    t.string  "middle_name",     default: ""
    t.string  "suffix_name",     default: ""
    t.date    "birthday"
    t.string  "birthplace",      default: ""
    t.boolean "gender",          default: true
    t.string  "height"
    t.string  "weight"
    t.string  "video_url",       default: ""
  end

  add_index "applicants", ["birthday"], name: "index_applicants_on_birthday", using: :btree
  add_index "applicants", ["birthplace"], name: "index_applicants_on_birthplace", using: :btree
  add_index "applicants", ["citizenship_id"], name: "index_applicants_on_citizenship_id", using: :btree
  add_index "applicants", ["civil_status_id"], name: "index_applicants_on_civil_status_id", using: :btree
  add_index "applicants", ["first_name"], name: "index_applicants_on_first_name", using: :btree
  add_index "applicants", ["gender"], name: "index_applicants_on_gender", using: :btree
  add_index "applicants", ["height"], name: "index_applicants_on_height", using: :btree
  add_index "applicants", ["last_name"], name: "index_applicants_on_last_name", using: :btree
  add_index "applicants", ["middle_name"], name: "index_applicants_on_middle_name", using: :btree
  add_index "applicants", ["religion_id"], name: "index_applicants_on_religion_id", using: :btree
  add_index "applicants", ["suffix_name"], name: "index_applicants_on_suffix_name", using: :btree
  add_index "applicants", ["weight"], name: "index_applicants_on_weight", using: :btree

  create_table "applications", force: :cascade do |t|
    t.integer "applicant_id",   default: 0
    t.integer "job_opening_id", default: 0
    t.date    "date_applied"
    t.date    "availability"
    t.string  "applicant_code", default: ""
    t.boolean "available",      default: false
  end

  add_index "applications", ["applicant_id"], name: "index_applications_on_applicant_id", using: :btree
  add_index "applications", ["job_opening_id"], name: "index_applications_on_job_opening_id", using: :btree

  create_table "band_members", force: :cascade do |t|
    t.string  "name"
    t.integer "band_id"
  end

  add_index "band_members", ["band_id"], name: "index_band_members_on_band_id", using: :btree

  create_table "band_repertoires", force: :cascade do |t|
    t.string  "name"
    t.integer "band_id"
  end

  add_index "band_repertoires", ["band_id"], name: "index_band_repertoires_on_band_id", using: :btree

  create_table "bands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "availabilities"
    t.text     "venues"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "cover_image_file_name"
    t.string   "cover_image_content_type"
    t.integer  "cover_image_file_size"
    t.datetime "cover_image_updated_at"
    t.boolean  "published",                default: false
  end

  create_table "blood_types", force: :cascade do |t|
    t.string "name"
  end

  add_index "blood_types", ["name"], name: "index_blood_types_on_name", using: :btree

  create_table "citizenships", force: :cascade do |t|
    t.string  "name",    default: ""
    t.boolean "enabled", default: false
  end

  add_index "citizenships", ["name"], name: "index_citizenships_on_name", using: :btree

  create_table "civil_statuses", force: :cascade do |t|
    t.string  "name",    default: ""
    t.boolean "enabled", default: false
  end

  add_index "civil_statuses", ["name"], name: "index_civil_statuses_on_name", using: :btree

  create_table "contact_types", force: :cascade do |t|
    t.string "name"
  end

  add_index "contact_types", ["name"], name: "index_contact_types_on_name", using: :btree

  create_table "contact_us_messages", force: :cascade do |t|
    t.string   "name",       default: ""
    t.string   "email",      default: ""
    t.string   "subject",    default: ""
    t.text     "message"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string  "iso",            default: ""
    t.string  "name",           default: ""
    t.string  "printable_name", default: ""
    t.string  "iso3",           default: ""
    t.integer "numcode",        default: 0
    t.boolean "enabled",        default: false
  end

  add_index "countries", ["iso"], name: "index_countries_on_iso", using: :btree
  add_index "countries", ["iso3"], name: "index_countries_on_iso3", using: :btree
  add_index "countries", ["name"], name: "index_countries_on_name", using: :btree
  add_index "countries", ["numcode"], name: "index_countries_on_numcode", using: :btree
  add_index "countries", ["printable_name"], name: "index_countries_on_printable_name", using: :btree

  create_table "documents", force: :cascade do |t|
    t.string  "name",    default: ""
    t.boolean "enabled", default: false
  end

  add_index "documents", ["name"], name: "index_documents_on_name", using: :btree

  create_table "job_openings", force: :cascade do |t|
    t.integer "country_id",    default: 0
    t.integer "occupation_id", default: 0
    t.boolean "enabled",       default: false
    t.integer "template"
  end

  add_index "job_openings", ["country_id"], name: "index_job_openings_on_country_id", using: :btree
  add_index "job_openings", ["occupation_id"], name: "index_job_openings_on_occupation_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string  "name",    default: ""
    t.boolean "enabled", default: false
  end

  add_index "languages", ["name"], name: "index_languages_on_name", using: :btree

  create_table "occupations", force: :cascade do |t|
    t.string  "name",      default: ""
    t.boolean "enabled",   default: false
    t.string  "shorthand"
  end

  add_index "occupations", ["name"], name: "index_occupations_on_name", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.string  "name"
    t.boolean "enabled", default: true
  end

  add_index "relationships", ["enabled"], name: "index_relationships_on_enabled", using: :btree
  add_index "relationships", ["name"], name: "index_relationships_on_name", using: :btree

  create_table "religions", force: :cascade do |t|
    t.string  "name",    default: ""
    t.boolean "enabled", default: false
  end

  add_index "religions", ["name"], name: "index_religions_on_name", using: :btree

  create_table "requirements", force: :cascade do |t|
    t.integer "job_opening_id", default: 0
    t.integer "document_id",    default: 0
    t.boolean "enabled",        default: false
  end

  add_index "requirements", ["document_id"], name: "index_requirements_on_document_id", using: :btree
  add_index "requirements", ["job_opening_id"], name: "index_requirements_on_job_opening_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string  "name",    default: ""
    t.boolean "enabled", default: false
  end

  add_index "schools", ["name"], name: "index_schools_on_name", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string  "name",    default: ""
    t.boolean "enabled", default: false
  end

  add_index "skills", ["name"], name: "index_skills_on_name", using: :btree

  create_table "skin_types", force: :cascade do |t|
    t.string "name"
  end

  add_index "skin_types", ["name"], name: "index_skin_types_on_name", using: :btree

  create_table "sources", force: :cascade do |t|
    t.string  "name",    default: ""
    t.string  "code",    default: ""
    t.string  "address", default: ""
    t.string  "tel",     default: ""
    t.string  "fax",     default: ""
    t.string  "mobile",  default: ""
    t.string  "email",   default: ""
    t.boolean "enabled", default: false
  end

  add_index "sources", ["address"], name: "index_sources_on_address", using: :btree
  add_index "sources", ["code"], name: "index_sources_on_code", using: :btree
  add_index "sources", ["email"], name: "index_sources_on_email", using: :btree
  add_index "sources", ["fax"], name: "index_sources_on_fax", using: :btree
  add_index "sources", ["mobile"], name: "index_sources_on_mobile", using: :btree
  add_index "sources", ["name"], name: "index_sources_on_name", using: :btree
  add_index "sources", ["tel"], name: "index_sources_on_tel", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "first_name",             default: ""
    t.string   "last_name",              default: ""
    t.string   "middle_name",            default: ""
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "zodiacs", force: :cascade do |t|
    t.string "name"
  end

  add_index "zodiacs", ["name"], name: "index_zodiacs_on_name", using: :btree

end
