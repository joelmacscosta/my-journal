require 'faker'

user = User.new(name: "Joelma Costa", email: "joelmacscosta@gmail.com" , password: "pass", password_confirmation: "pass")
user.articles.new(title: "My journal idea", content: "Designed to integrate people and culture. Boost social life")
user.save

15.times do
	password = Faker::Internet.password
	user = User.new(name: Faker::Name.name , email: Faker::Internet.email , password: password, password_confirmation: password)
	user.save

	article = user.articles.new(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph(2, false, 4))
	article.save  

	article = user.articles.new(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph(2, false, 4))
	article.save  
end