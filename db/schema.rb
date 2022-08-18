ActiveRecord::Schema[7.0].define(version: 2022_08_18_182415) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "Text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "authorId", null: false
    t.bigint "post_id", null: false
    t.index ["authorId"], name: "index_comments_on_authorId"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "authorId", null: false
    t.bigint "post_id", null: false
    t.index ["authorId"], name: "index_likes_on_authorId"
    t.index ["post_id"], name: "index_likes_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "Title"
    t.text "Text"
    t.integer "CommentsCounter"
    t.integer "LikesCounter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "authorId", null: false
    t.index ["authorId"], name: "index_posts_on_authorId"
  end

  create_table "users", force: :cascade do |t|
    t.string "Name"
    t.string "Photo"
    t.text "Bio"
    t.integer "PostsCounter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users", column: "authorId"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users", column: "authorId"
  add_foreign_key "posts", "users", column: "authorId"
end
