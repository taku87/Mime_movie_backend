# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ContentVideoComment.create(body: "user1のテストコメント1",
                          user_id: "1",
                          content_video_id:"1"
                          )
ContentVideoComment.create(body: "user1のテストコメント2",
                          user_id: "1",
                          content_video_id:"1",
                          )
ContentVideoComment.create(body: "user2のテストコメント",
                          user_id: "2",
                          content_video_id:"1"
                          )

#Tag.create(name: "テストタグ１")
#Tag.create(name: "テストタグ２")
#Tag.create(name: "テストタグ３")
