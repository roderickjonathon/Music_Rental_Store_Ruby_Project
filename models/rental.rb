require('pg')
require_relative('../db/sql_runner.rb')



class Rental

  attr_accessor :id, :rental_name, :rental_items, :price, :rental_date, :customer_id, :stock_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @rental_name = options['rental_name']
    @rental_items = options['rental_items']
    @price = options['price']
    @rental_date = options['rental_date']
    @customer_id = options['customer_id']
    @stock_id = options['stock_id']

  end

  def save()
    sql = "INSERT into rentals (rental_name, rental_items, price, rental_date, customer_id, stock_id) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@rental_name, @rental_items, @price, @rental_date, @customer_id, @stock_id]
    rental = SqlRunner.run(sql, values).first
    @id = rental['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM rentals"
    rentals = SqlRunner.run(sql)
    result = rentals.map { |rental| Rental.new(rental)  }
  end



  def self.delete_all()
    sql = "DELETE FROM rentals"
    SqlRunner.run(sql)
  end

  def update_rental()
    sql = "UPDATE rentals SET (rental_name, rental_items, price, rental_date, customer_id, stock_id) = ($1, $2, $3, $4, $5, $6) WHERE id =$6"
    values = [@rental_name, @rental_items, @price, @rental_date, @customer_id, @stock_id, @id]
    SqlRunner.run(sql, values)
  end









end
