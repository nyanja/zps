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

ActiveRecord::Schema.define(version: 2018_09_27_130625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "ads", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "url"
    t.string "type"
    t.string "description"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_ads_on_article_id"
    t.index ["type"], name: "index_ads_on_type"
  end

  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "preview"
    t.text "content"
    t.string "title"
    t.string "description"
    t.string "keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "views_count", default: 0
  end

  create_table "articles_links", force: :cascade do |t|
    t.integer "article_id"
    t.integer "link_id"
    t.index ["article_id"], name: "index_articles_links_on_article_id"
    t.index ["link_id"], name: "index_articles_links_on_link_id"
  end

  create_table "articles_tags", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "tag_id"
    t.index ["article_id"], name: "index_articles_tags_on_article_id"
    t.index ["tag_id"], name: "index_articles_tags_on_tag_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["slug"], name: "index_categories_on_slug"
  end

  create_table "comments", force: :cascade do |t|
    t.string "username"
    t.text "content"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meows", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "url"
    t.string "meow_type"
    t.string "description"
    t.integer "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_alt"
    t.string "image_title"
    t.index ["article_id"], name: "index_meows_on_article_id"
    t.index ["meow_type"], name: "index_meows_on_meow_type"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name"
  end

end
