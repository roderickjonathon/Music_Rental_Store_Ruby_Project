require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/customer.rb')
require_relative('../models/stock.rb')
require_relative('../models/rental.rb')
also_reload('../models/*')

get '/stock' do
  @stock = Stock.all_stock
  
  @stockitem = Stock.new(params)
  erb(:"stock/index")
end

get '/stock/new' do
  @stock = Stock.all_stock
  erb(:"stock/new")
end

get "/stock/:id/show" do
  @stock = Stock.find(params[:id])
  erb (:"stock/show")
end

get "/stock/:id/update" do
  @stock = Stock.find(params[:id])
  erb (:"stock/stock_update")
end

post "/stock/:id/update" do
  @stock = Stock.new(params)
  @stock.update_stock_item()
  redirect to ("/stock")
end




post '/stock/' do
  stock = Stock.new(params)
  stock.save_stock()
  redirect to ("/stock")
end

post '/stock/:id/delete' do
  @stock = Stock.find(params[:id])
  @stock.delete_item()
  redirect to ("/stock")
end
