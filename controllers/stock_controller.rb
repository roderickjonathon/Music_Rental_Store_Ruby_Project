require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/customer.rb')
require_relative('../models/stock.rb')
require_relative('../models/rental.rb')
also_reload('../models/*')

get '/stock' do
  @stock = Stock.new
  erb(:"stock/index")
end


get '/stock/new' do
  @stock = Stock.all_stock
  erb(:"stock/new")
end


get "/stock/:id/" do
  @stock = Stock.find(params[:id])
  erb (:"stock/index")
end
