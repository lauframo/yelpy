get '/' do
	p logged_in?
	p session[:user_id]
	redirect '/restaurants'
end
