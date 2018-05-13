require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('models/bottle')
require_relative('models/distillery')

get '/' do
  erb( :"/homepage" )
end

#bottle routes
get '/bottles' do
  @bottles = Bottle.all()
  erb( :"bottles/stocklist" )
end

get '/bottles/new' do
  @distilleries = Distillery.all()
  erb( :"bottles/new" )
end

get '/bottles/:id' do
  @product = Bottle.find(params[:id])
  @distilleries = Distillery.all()
  erb( :"bottles/show" )
end

#save route
post '/bottles' do
  product = Bottle.new( params )
  product.save()
  erb( :"bottles/create" )
end

#update route
post '/bottles/:id' do
  Bottle.new( params ).update
  redirect to('/bottles')
end

#delete route
post '/bottles/:id/delete' do
  product = Bottle.find( params[:id] )
  product.delete()
  redirect to('/bottles')
end

#distillery routes
get '/distilleries' do
  @distilleries = Distillery.all()
  erb( :"distilleries/stocklist")
end

get '/distilleries/new' do
  erb( :"distilleries/new")
end

get '/distilleries/:id' do
  @distillery = Distillery.find(params[:id])
  erb( :"distilleries/show" )
end

#save route
post '/distilleries' do
  distillery = Distillery.new( params )
  distillery.save()
  erb( :"distilleries/create")
end

#update route
post '/distilleries/:id' do
  Distillery.new( params ).update
  redirect to('/distilleries')
end

#delete route
post '/distilleries/:id/delete' do
  distillery = Distillery.find( params[:id] )
  distillery.delete()
  redirect to('/distilleries')
end
