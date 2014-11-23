get '/users' do
	@users = User.all
	erb :"user/show_all"
end