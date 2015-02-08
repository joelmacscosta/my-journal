get '/users' do
	@users = User.all
	erb :"session/show_all"
end

get '/signup' do
  user = User.new
	erb :"session/new"
end

post '/signup' do
  user = User.new(name: params[:user_name], 
  				     email: params[:user_email],
  				     password: params[:user_password],  
               password_confirmation: params[:user_password_confirmation] )
  if user.valid?
  	user.save
    flash[:notice] = "Successfully created user."
    session[:user] = user.id
  	redirect :"users"
  else
    flash[:error] = user.errors.full_messages 
  	redirect :"/signup"
  end
end

get '/logout' do
  session.clear
  redirect "/"
end

get '/login' do
  erb :"session/login"
end

post '/login' do
  user = User.find_by(email: params[:user_email]).try(:authenticate, params[:user_password])  
  if user
    flash[:notice] = "Welcome!"
    session[:user] = user.id
    redirect :"users"
  else
    flash[:error] = "Invalid user or password."
    redirect :"/login"
  end
end