require('pg')
require_relative('../db/sql_runner.rb')

class Customer

attr_accessor :id, :name, :phone, :address

    def initialize(options)
      @id = options['id'].to_i if options['id']
      @name = options['name']
      @phone = options['phone']
      @address = options['address']
    end


  def save_customer()
    sql = "INSERT INTO customers (name, phone, address) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @phone, @address]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def self.all_customers()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new(customer) }
    return result

  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def update_customer()
    sql = "UPDATE customers SET (name, phone, address) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @phone, @address, @id]
    SqlRunner.run(sql, values)
  end

  def delete_customer()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def stock_rented()
    sql = "SELECT stocklist.* FROM stocklist
    INNER JOIN rentals
    ON rentals.stock_id = stocklist.id
    WHERE customer_id = $1"
    values = [@id]
    stock_items = SqlRunner.run(sql, values)
    result = stock_items.map { |stock| Stock.new(stock) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    customer = SqlRunner.run( sql, values )
    result = Customer.new( customer.first )
    return result
  end


end
