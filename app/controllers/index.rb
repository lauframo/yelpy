get '/' do
	p logged_in?
	redirect '/restaurants'
end
