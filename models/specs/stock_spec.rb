require('Minitest/autorun')
require('Minitest/rg')
require_relative('../stock.rb')
require_relative('../rentals.rb')
require_relative('../customer.rb')



def StockTest < Minitest::Test

  def setup

    @stocklist = [

      @Stock_Item1 = Stock.new({
        "item_name" => "Electric Guitar",
        "item_category" => "String Instrument",
        "price" => 60,
        "quantity" => 3

        }),

        @Stock_Item2 = Stock.new({
          "item_name" => "Technics Turntable",
          "item_category" => "DJ equipment",
          "price" => 55,
          "quantity" => 4
          })
        ]
      end


      def test_total_stock_price
        assert_equal(105, @stocklist.total_price)
      end



    end
