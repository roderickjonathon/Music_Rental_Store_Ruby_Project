require('pg')
require_relative('../db/sql_runner.rb')
require_relative('./rental.rb')
require_relative('./customer.rb')


class Stock

  attr_accessor :id, :item_name, :item_category, :price, :quantity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @item_name = options['item_name']
    @item_category = options['item_category']
    @price = options['price']
    @quantity = options['quantity']

  end


  def save_stock()
    sql = "INSERT INTO stocklist (item_name, item_category, price, quantity ) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@item_name, @item_category, @price, @quantity]
    stock_item = SqlRunner.run(sql, values).first
    @id = stock_item['id'].to_i
  end


  def self.all_stock()
    sql = "SELECT * FROM stocklist"
    stocklist = SqlRunner.run(sql)
    result = stocklist.map { |stock| Stock.new(stock) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM stocklist"
    SqlRunner.run(sql)
  end

  def update_stock_item()
    sql = "UPDATE stocklist SET (item_name, item_category, price, quantity) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@item_name, @item_category, @price, @quantity, @id]
    SqlRunner.run(sql, values)
  end

  def delete_item()
    sql = "DELETE FROM stocklist WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.total_stock_price
    sql = "SELECT sum (price) as total_stock_price from stocklist"
    result = SqlRunner.run(sql)
    return result.first['total_stock_price'].to_i
  end

  def self.find( id )
    sql = "SELECT * FROM stocklist WHERE id = $1"
    values = [id]
    stock = SqlRunner.run( sql, values )
    result = Stock.new( stock.first )
    return result
  end


  def customers_renting
    sql = "SELECT customers.* FROM customers
    INNER JOIN rentals
    ON rentals.customer_id = customers.id
    WHERE stock_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    result = customers.map { |customer| Customer.new(customer) }
    return result
  end


  def is_available?
    if self.quantity > 0
      return true
    end

  end

  # def rent_out(item)
  #   if item.is_available == true
  #     item.quantity - 1
  #   end
  # end













end
