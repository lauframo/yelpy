get '/users' do
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    p session
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id/restaurants' do
  @user = User.find(params[:id])
  if current_user.id != @user.id
    redirect '/restaurants'
  else
    @restaurants = @user.restaurants
    @reviews = @user.reviews
    erb :'/users/show'
  end
end


