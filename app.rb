require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('models/bottle')
require_relative('models/distillery')

get '/bottles' do
  @bottles = Bottle.all()
  erb ( :index )
end

get '/bottles/new' do
  erb ( :new )
end

# get '/bottles/:id' do
#   @product = Bottle.find(
#   params[:id] )
#   erb( :show )
# end
#
# post '/bottles' do
#   @product = Bottle.new( params )
#   @product.save()
#   erb( :create )
# end

# get '/bottles/:id' do
#   erb (:show)
# end

# post '/bottles/:id' do
#   erb (:update)
# end
