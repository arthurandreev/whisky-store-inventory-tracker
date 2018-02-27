require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('models/bottle')
require_relative('models/distillery')

get '/bottles' do
  @bottles = Bottle.all()
  erb ( :"bottles/index" )
end

get '/bottles/new' do
  @distilleries = Distillery.all()
  erb ( :"bottles/new" )
end

get '/bottles/:id' do
  @product = Bottle.find(params[:id])
  erb( :"bottles/show" )
end

post '/bottles' do
  product = Bottle.new( params )
  product.save()
  erb( :"bottles/create" )
end

post '/bottles/:id/delete' do
  product = Bottle.find( params[:id] )
  product.delete()
  redirect to('/bottles')
end

get '/distilleries' do
  @distilleries = Distillery.all()
  erb ( :"distilleries/index")
end

get '/distilleries/new' do
  erb ( :"distilleries/new")
end

get '/distilleries/:id' do
  @distillery = Distillery.find(params[:id])
  erb( :"distilleries/show" )
end

post '/distilleries' do
  distillery = Distillery.new( params )
  distillery.save()
  erb( :"distilleries/create")
end

post '/distilleries/:id/delete' do
  distillery = Distillery.find( params[:id] )
  distillery.delete()
  redirect to('/distilleries')
end

# post '/bottles/:id' do
#   erb (:update)
# end
