require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/spaces'
require './database_connection_setup.rb'
require_relative 'lib/database_connection'


class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  get '/spaces' do
    @spaces = Spaces.all
    erb :'spaces/index'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    Spaces.create(name: params[:name], des: params[:des], price: params[:price])
    redirect '/spaces'
  end


  run! if app_file == $0
end