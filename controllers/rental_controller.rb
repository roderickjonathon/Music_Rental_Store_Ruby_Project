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
  @customer = Customer.all_customers()
  @stock = Stock.all_stock()
  erb(:"rentals/index")
end

get '/rentals/new' do
  @rentals = Rental.all_rentals
  @customer = Customer.all_customers()
  @stock = Stock.all_stock()

  erb( :"rentals/new" )
end

get "/rentals/:id/" do
  @rental = Rental.find(params[:id])
  erb(:"rentals/index")
end

get "/rentals/:id/update" do
  @rental = Rental.find(params[:id])
  erb(:"rentals/customer_update")
end

post "/rentals/:id/update" do
  @rental = Rental.new(params)
  @rental.update_rental()
  redirect to ("/rentals")
end



post '/rentals/' do
  rental = Rental.new(params)
  rental.save_rental
  redirect to ("/rentals")
end

post '/rentals/:id/delete' do
  @rental = Rental.find(params[:id])
  @rental.delete_rental()
  redirect to ("/rentals")
end
