require './lib/takeawaymenu'
require './lib/pricelist'
class Placeorder
  attr_reader :menu, :plist, :dishlist, :totalprice
  def initialize (twm = Takeawaymenu.new, pl = Pricelist.new)
    @menu = twm
    @plist = pl
    @totalprice = 0
    @dishlist = Hash.new
    @menu.list
  end
  def need(dish,quantity = 1)
    raise "No dish specified" if !dish
    puts @totalprice
    puts @plist.getprice(dish)
    @totalprice += (@plist.getprice(dish) * quantity)
    puts "after compute #{@totalprice}"
    #@dishlist[dish] = unitprice
    #@dishlist[dish] = quantity
    "Order accepted"
  end
end
