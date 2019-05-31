require('pg')
require_relative('../db/sql_runner.rb')


class Stock

attr_reader :id, :item_name, :item_category, :price, :quantity

def initialize(options)
  @id = options['id'].to_i if options['id']
  @item_name = options['item_name']
  @item_category = options['item_category']
  @price = options['price']
  @quantity = options['quantity']

end





end
