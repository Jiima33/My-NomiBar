# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
    email: "admin@admin.com",
    password: "111111"
    )

Area.create([
    { name: "北海道" },
    { name: "東北" },
    { name: "関東" },
    { name: "中部" },
    { name: "近畿" },
    { name: "中国" },
    { name: "四国" },
    { name: "九州" },
    { name: "沖縄" },
  ])

Tag.create([
    { name: "落ち着いた雰囲気" },
    { name: "賑やか" },
    { name: "デートにお勧め" },
    { name: "お一人様歓迎" },
    { name: "お酒が美味しい" },
    { name: "お酒が安い" },
    { name: "LGBTQ歓迎" },
    { name: "その他" },
  ])