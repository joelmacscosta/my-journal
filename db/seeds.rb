user = User.new(name: "Joelma Costa", email: "joelmacscosta@gmail.com" , password: "pass", password_confirmation: "pass")
user.articles.new(title: "My journal idea", content: "Designed to integrate people and culture. Boost social life")
user.save
