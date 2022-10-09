# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
