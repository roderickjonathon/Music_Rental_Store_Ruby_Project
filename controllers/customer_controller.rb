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

post '/customers/' do
  customer = Customer.new(params)
  customer.save_customer
  redirect to ("/customers")
end


post '/customers/:id/delete' do
  Customer.delete_customer(params[:id])
  redirect to ("/customers")
end
