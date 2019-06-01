require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/customer.rb')
require_relative('../models/stock.rb')
require_relative('../models/rental.rb')
also_reload('../models/*')

get '/customers' do
  @customers = Customer.all_customers
  erb( :"customers/index" )
end

get '/customers/new' do
  @customers = Customer.all_customers
  erb( :"customers/new" )
end

get "/customers/:id/" do
  @customer = Customer.find(params[:id])
  erb(:"customers/index")
end

get "/customers/:id/update" do
  @customer = Customer.find(params[:id])
  erb(:"customers/customer_update")
end

post "/customers/:id/update" do
  @customer = Customer.new(params)
  @customer.update_customer()
  redirect to ("/customers")
end



post '/customers/' do
  customer = Customer.new(params)
  customer.save_customer
  redirect to ("/customers")
end

post '/customers/:id/delete' do
  @customer = Customer.find(params[:id])
  @customer.delete_customer()
  redirect to ("/customers")
end
