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


  def save()
    sql = "INSERT INTO customers (name, phone, address) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @phone, @address]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def self.all()
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

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


end
