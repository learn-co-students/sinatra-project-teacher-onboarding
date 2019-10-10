class UsersController < ApplicationController
  set :views, 'app/views/users'

  get '/users' do
    @users = User.all
    erb :index
  end

  get '/users/new' do
    erb :new
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :show
  end

  post '/users' do
    User.create(params)
    redirect '/users'
  end
end