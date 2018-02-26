require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('models/bottle')
require_relative('models/distillery')

get '/bottles' do
  @bottles = Bottle.all()
  erb (:index)
end

get'/bottles/new' do
  
  erb (:new)
end
