get '/users' do
	@users = User.all
	erb :"user/show_all"
end

get '/user/new' do
  @user = User.new
	erb :"user/new"
end

post '/user/new' do
  @user = User.new(name: params[:user_name], 
  				     email: params[:user_email],
  				     password: params[:user_password],  
               password_confirmation: params[:user_password_confirmation] )
  if @user.valid?
  	@user.save
    flash[:notice] = "Successfully created user."
  	redirect :"users"
  else
    flash[:error] = @user.errors.full_messages 
  	redirect :"user/new"
  end
end
