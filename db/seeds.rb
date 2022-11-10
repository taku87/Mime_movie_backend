# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ContentVideo.create(number: "100",
                    title: "パントマイム編「ROPE」",
                    description:"パントマイムの定番「ロープ」！",
                    thumbnail: "tmb-pantomime-rope.jpg",
                    youtube_url:"BZeHfLsVMTo",
                    state: 1
                    )
ContentVideo.create(number: "200",
                    title: "Engineer編「エラー地獄」",
                    description:"エンジニアには切っては切り離せない存在、その名もエラー。",
                    thumbnail: "tmb-engineer-error.jpg",
                    youtube_url:"",
                    state: 0
                    )
ContentVideo.create(number: "300",
                    title: "Engineer編「幸せの瞬間」",
                    description:"あの幸せの瞬間を何度でも味わえます。",
                    thumbnail: "tmb-engineer-lgtm.jpg",
                    youtube_url:"",
                    state: 0
                    )

#Tag.create(name: "テストタグ１")
#Tag.create(name: "テストタグ２")
#Tag.create(name: "テストタグ３")
