# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.create!(
   name: 'テストジャンル',
)

10.times do |n|
  Product.create!(
    genre_id: '1',
    name: 'テスト名前',
    description: 'テスト説明',
    non_taxed_price: '100',
    sales_status: 'true',
    image: File.open('./app/assets/images/142_refileDownloadImage.png')
   )
end