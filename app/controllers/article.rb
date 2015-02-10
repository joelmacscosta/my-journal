get '/articles' do
	@articles = Article.all
	erb :'article/show_all' 
end

get '/article/new' do
  if session[:user]
    erb :"article/new"
  else
    erb :"session/login"
  end
end

post '/article/new' do
  user = User.find_by(id: session[:user])
  article = user.articles.new(title: params[:article_title], 
  				              content: params[:article_content])
  if article.valid?
  	article.save
    flash[:notice] = "Successfully created article."
    redirect "/articles"
  else
    flash[:error] = article.errors.full_messages 
  	redirect "/article/new"
  end
end

get '/article/:id' do
  @article = Article.find(params[:id])
  erb :'article/show'
end
