get '/users' do
	@users = User.all
	erb :"user/show_all"
end

get '/user/new' do
	erb :"user/new"
end