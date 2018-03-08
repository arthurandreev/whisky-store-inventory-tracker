require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('models/bottle')
require_relative('models/distillery')

get '/' do
  erb( :"/homepage" )
end

get '/bottles' do
  @bottles = Bottle.all()
  erb( :"bottles/index" )
end

get '/bottles/new' do
  @distilleries = Distillery.all()
  erb( :"bottles/new" )
end

get '/bottles/:id' do
  @product = Bottle.find(params[:id].to_i)
  erb( :"bottles/show" )
end

post '/bottles' do
  product = Bottle.new( params )
  product.save()
  erb( :"bottles/create" )
end

#edit route
get '/bottles/:id/edit' do
  @product = Bottle.find( params[:id].to_i )
  @distilleries = Distillery.all()
  erb( :"bottles/edit" )
end

#update route
post '/bottles/:id' do
  Bottle.new( params ).update
  redirect to('/bottles')
end

post '/bottles/:id/delete' do
  product = Bottle.find( params[:id].to_i )
  product.delete()
  redirect to('/bottles')
end

get '/distilleries' do
  @distilleries = Distillery.all()
  erb( :"distilleries/index")
end

get '/distilleries/new' do
  erb( :"distilleries/new")
end

get '/distilleries/:id' do
  @distillery = Distillery.find( params[:id].to_i )
  erb( :"distilleries/show" )
end

post '/distilleries' do
  distillery = Distillery.new( params )
  distillery.save()
  erb( :"distilleries/create")
end

get '/distilleries/:id/edit' do
  @distillery = Distillery.find( params[:id].to_i )
  erb( :"distilleries/edit" )
end

post '/distilleries/:id' do
  Distillery.new( params ).update
  redirect to('/distilleries')
end

post '/distilleries/:id/delete' do
  distillery = Distillery.find( params[:id].to_i )
  distillery.delete()
  redirect to('/distilleries')
end
