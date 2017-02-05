get '/restaurants' do
  @restaurants = Restaurant.all
  erb :'/restaurants/index'
end

get '/restaurants/new' do
  authenticate!
  erb :'/restaurants/new'
end

post '/restaurants' do
  @restaurant = Restaurant.new(params[:restaurant])
  if @restaurant.save
    redirect "/restaurants/#{@restaurant.id}"
  else
    @errors = @restaurant.errors.full_messages
    erb :'/restaurants/new'
  end
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  @reviews = @restaurant.reviews
  erb :'/restaurants/show'
end

post '/restaurants/:restaurant_id/reviews' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  @reviews = @restaurant.reviews
  @review = Review.new(params[:review])
  if @review.save
    redirect "/restaurants/#{params[:restaurant_id]}"
  else
    @errors = @review.errors.full_messages
    erb :'/restaurants/show'
  end
end

get '/restaurants/:id/edit' do
  authenticate!
  @restaurant = Restaurant.find(params[:id])
  erb :'/restaurants/edit'
end


put '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  @restaurant.assign_attributes(params[:restaurant])
  if @restaurant.save
    redirect "/restaurants/#{@restaurant.id}"
  else
    @errors = @restaurant.errors.full_messages
    erb :"/restaurants/edit"
  end
end


delete '/restaurants/:id' do
 @restaurant = Restaurant.find(params[:id])
 @restaurant.destroy
 redirect '/restaurants'
end

