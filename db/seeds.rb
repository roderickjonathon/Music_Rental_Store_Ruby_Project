require_relative( "../models/customer.rb" )
require_relative( "../models/rental.rb" )
require_relative( "../models/stock.rb" )
require('pry')

Customer.delete_all
Stock.delete_all
Rental.delete_all

customer1 = Customer.new({
  "name" => "Jimmy McGhee",
  "phone" => "01414295555",
  "address" => "42 Evergreen Terrace"
  })
  customer1.save_customer()
  customer2 = Customer.new({
    "name" => "Sally Sitar",
    "phone" => "01414296666",
    "address" => "66 Hells Highway"
    })
    customer2.save_customer()



    stock_item1 = Stock.new({
      "item_name" => "Guitar",
      "item_category" => "String Instruments",
      "price" => 60,
      "quantity" => 4
      })
      stock_item1.save_stock()
      stock_item2 = Stock.new({
        "item_name" => "Technics Turntable",
        "item_category" => "DJ Equipment",
        "price" => 35,
        "quantity" => 6
        })
        stock_item2.save_stock()
        stock_item3 = Stock.new({
          "item_name" => "DJ Mixer",
          "item_category" => "DJ Equipment",
          "price" => 60,
          "quantity" => 2
          })
          stock_item3.save_stock()

dj_equipment_set = [stock_item2.item_name, stock_item3.item_name]
dj_equipment_set_price = [stock_item2.price, stock_item3.price]



          rental1 = Rental.new({
            "rental_reference" => "REN25677",
            "rental_items" => stock_item1.item_name,
            "rental_price" => stock_item1.price,
            "rental_date" => "2019-01-21",
            "customer_id" => customer1.id,
            "stock_id" => stock_item1.id
            })

            rental1.save_rental()

            rental2 = Rental.new({
              "rental_reference" => "REN13455",
              "rental_items" => stock_item2.item_name,
              "rental_price" => stock_item2.price,
              "rental_date" => "2019-02-11",
              "customer_id" => customer2.id,
              "stock_id" => stock_item2.id
              })

              rental2.save_rental()



              total_price = Stock.total_stock_price

all_customers = Customer.all_customers





                binding.pry
                nil
