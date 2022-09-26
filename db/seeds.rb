# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "テストユーザー１", email: "test1@example.com")
User.create(name: "テストユーザー２", email: "test2@example.com")
User.create(name: "テストユーザー３", email: "test3@example.com")

ContentVideo.create(number: "100",
                    title: "コンテンツ動画１",
                    youtube_url: "VzfeQm89UEE")
ContentVideo.create(number: "200",
                    title: "コンテンツ動画２",
                    youtube_url: "b8UXOaeiTgA")
ContentVideo.create(number: "300",
                    title: "コンテンツ動画３",
                    youtube_url: "grbnA9eViB8")

Tag.create(name: "テストタグ１")
Tag.create(name: "テストタグ２")
Tag.create(name: "テストタグ３")

#UserVideo.create(user_id: 1, content_video_id: 1, number: "1", content_number: "100", video_url: "uploads/user_video/video_url/1")
#UserVideo.create(user_id: 1, content_video_id: 2, number: "2", content_number: "200", video_url: "uploads/user_video/video_url/2")
#UserVideo.create(user_id: 1, content_video_id: 3, number: "3", content_number: "300", video_url: "uploads/user_video/video_url/3")
