require('pg')
require_relative('../db/sql_runner.rb')

class Customer

attr_reader :id, :name, :phone, :address

    def initialize(options)
      @id = options['id'].to_i if options['id']
      @name = options['name']
      @phone = options['phone']
      @address = options['address']
    end




end
