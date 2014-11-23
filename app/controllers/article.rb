get '/articles' do
	@articles = Article.all
	erb :'article/show_all' 
end

