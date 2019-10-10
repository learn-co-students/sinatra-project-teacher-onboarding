class RestaurantsController < ApplicationController
  set :views, 'app/views/restaurants'

  get '/restaurants' do
    @restaurants = Restaurant.all
    erb :index
  end

  get '/restaurants/new' do
    erb :new
  end

  get '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @users = User.all
    erb :show
  end

  post '/restaurants' do
    Restaurant.create(params)
    redirect '/restaurants'
  end

  patch '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @user = User.find(params[:user_id])
    @restaurant.users << @user
    redirect "/restaurants/#{params[:id]}"
  end
end