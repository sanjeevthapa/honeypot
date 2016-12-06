# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

title=['Hey Job Seeker, It’s Time To Get Up And Get Hired','How to "Woo" a Recruiter and Land Your Dream Job','11 Tips to Help You Get New Clients Through Cold Calling']
image=['blog-post-01.jpg','blog-post-02.jpg','blog-post-03.jpg']
3.times do |i;title;image|
article=Article.find_or_initialize_by(title: title[i])
article.content='Nam nisl lacus, dignissim ac tristique ut, scelerisque eu massa. Vestibulum ligula nunc, rutrum in malesuada vitae, tempus sed augue. Curabitur quis lectus quis augue dapibus facilisis. Vivamus tincidunt orci est, in vehicula nisi eleifend ut. Vestibulum sagittis varius orci vitae.'
article.image=image[i]
artile.save!
end

[' Accounting / Finance',' Automotive Jobs',' Construction / Facilities',' Education Training',' Healthcare',' Restaurant / Food Service'].each do |category|
  Category.find_or_initialize_by(name: category)
end
