get '/login' do
  erb :"/sessions/new"
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Incorrect username or password"]
    erb :"/sessions/new"
  end

end

delete '/logout' do
  session.delete(:user_id)
  redirect '/'
end

get '/not_authorized' do
  erb :not_authorized
end
