require('sinatra')
require('sinatra/contrib/all')
require_relative('models/bottle')
require_relative('models/distillery')

get '/' do
  "Welcome to my whisky shop"
  # erb (:home)
end
