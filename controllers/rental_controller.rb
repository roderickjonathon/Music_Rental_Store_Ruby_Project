require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/customer.rb')
require_relative('../models/stock.rb')
require_relative('../models/rental.rb')
also_reload('../models/*')


get '/rentals' do
  @rentals = Rental.all_rentals()
  erb(:"rentals/index")
end
