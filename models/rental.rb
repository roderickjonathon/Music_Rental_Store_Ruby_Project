require('pg')
require_relative('../db/sql_runner.rb')



class Rental

  attr_reader :id, :name, :price, :rental_date, :customer_id, :stock_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @price = options['price']
    @rental_date = options['rental_date']
    @customer_id = options['customer_id']
    @stock_id = options['stock_id']

  end





end
