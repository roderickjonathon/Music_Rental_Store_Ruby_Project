require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/customer.rb')
require_relative('../models/stock.rb')
require_relative('../models/rental.rb')
also_reload('../models/*')


get '/rentals' do
  @rental = Rental.new(params)
  @rentals = Rental.all_rentals()
  @customers = Customer.all_customers()
  @customer = Customer.new(params)
  @stock = Stock.all_stock()
  erb(:"rentals/index")
end

get '/rentals/new' do
  @rental = Rental.new(params)
  @rentals = Rental.all_rentals
  @customer = Customer.all_customers()
  @customers = Customer.new(params)
  @stock = Stock.all_stock()
  @stockitem = Stock.new(params)
  # binding.pry

  erb( :"rentals/new" )
end

get "/rentals/:id/show" do
  @rental = Rental.find(params[:id].to_i)
  erb(:"rentals/show")
end

get "/rentals/:id/update" do
  @stock = Stock.all_stock()
  @customer = Customer.all_customers
  @rental = Rental.find(params[:id])
  erb(:"rentals/rental_update")
end

post "/rentals/show/:id/update" do
  @customer = Customer.all
  @rental = Rental.new(params)
  @rental.update_rental()
  redirect to ("/rentals")
end



post '/rentals/' do
  @rental = Rental.new(params)
  @rental.save_rental

  @stock = Stock.find(params['stock_id'])

  @stock.quantity -= 1
  @stock.update_stock_item
  redirect to ("/rentals")
end



post '/rentals/:id/delete' do
  @rental = Rental.new(params)
  @rental.delete_rental()

  redirect to ("/rentals")
end



get '/rentals/:id/return' do
  @rental = Rental.find(params[:id])

  @stock = Stock.find(@rental.stock_id)
  @stock.quantity += 1
  @stock.update_stock_item()
  @rental.delete_rental

  redirect to ("/rentals")
end
