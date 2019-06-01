require('pg')
require_relative('../db/sql_runner.rb')
require_relative('./stock.rb')
require_relative('./customer.rb')
require('pry')




class Rental

  attr_accessor :id, :rental_reference, :rental_items, :rental_price, :rental_date, :customer_id, :stock_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @rental_reference = options['rental_reference']
    @rental_items = options['rental_items']
    @rental_price = options['rental_price']
    @rental_date = options['rental_date']
    @customer_id = options['customer_id']
    @stock_id = options['stock_id']

  end

  def save_rental()
    sql = "INSERT into rentals (rental_reference, rental_items, rental_price, rental_date, customer_id, stock_id) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@rental_reference, @rental_items, @rental_price, @rental_date, @customer_id, @stock_id]
    rental = SqlRunner.run(sql, values).first
    @id = rental['id'].to_i
  end

  def delete_rental()
    sql = "DELETE FROM rentals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all_rentals()
    sql = "SELECT * FROM rentals"
    rentals = SqlRunner.run(sql)
    result = rentals.map { |rental| Rental.new(rental)  }
  end



  def self.delete_all()
    sql = "DELETE FROM rentals"
    SqlRunner.run(sql)
  end

  def self.find( id )
    sql = "SELECT * FROM rentals WHERE id = $1"
    values = [id]
    rental = SqlRunner.run( sql, values )
    result = Rental.new( rental.first )
    return result
  end

  def update_rental()
    sql = "UPDATE rentals SET (rental_reference, rental_items, rental_price, rental_date, customer_id, stock_id) = ($1, $2, $3, $4, $5, $6) WHERE id =$6"
    values = [@rental_reference, @rental_items, @rental_price, @rental_date, @customer_id, @stock_id, @id]
    SqlRunner.run(sql, values)
  end



  def reference_gen()
    num = rand 500000
    return "REN#{num}"
  end


  # binding.pry
  # nil

















end
