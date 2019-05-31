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
 customer1.save()
 customer2 = Customer.new({
   "name" => "Sally Sitar",
   "phone" => "01414296666",
   "address" => "66 Hells Highway"
   })
customer2.save()

stock_item1 = Stock.new({
  "item_name" => "Guitar",
  "item_category" => "String Instruments",
  "price" => 60,
  "quantity" => 4
  })
stock_item1.save()
stock_item2 = Stock.new({
  "item_name" => "Technics Turntable",
  "item_category" => "DJ Equipment",
  "price" => 35,
  "quantity" => 6
  })
stock_item2.save()

rental1 = Rental.new({
  "rental_name" => "Guitar Hire",
  "price" => stock_item1.price,
  "rental_date" => "21/3/19",
  "customer_id" => customer1.id,
  "stock_id" => stock_item1.id
  })

  rental1.save()

  rental2 = Rental.new({
    "rental_name" => "Turntable Hire",
    "price" => stock_item2.price,
    "rental_date" => "02/03/19",
    "customer_id" => customer2.id,
    "stock_id" => stock_item2.id
    })

    rental2.save()

total_price = Stock.total_stock_price



binding.pry
nil
