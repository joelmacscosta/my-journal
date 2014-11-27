get '/users' do
	@users = User.all
	erb :"user/show_all"
end

get '/user/new' do
	erb :"user/new"
end

post '/user/new' do
  user = User.new(name: params[:user_name], 
  				     email: params[:user_email],
  				     password: params[:user_password] )
  if user.valid?
  	user.save
  	redirect :"users"
  else
  	redirect :"user/new"
  end
end