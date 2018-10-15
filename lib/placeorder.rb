require './lib/takeawaymenu'
require './lib/pricelist'
require './lib/sms'

class Placeorder
  attr_reader :menu, :plist, :dishlist, :totalprice

  def initialize (twm = Takeawaymenu.new, pl = Pricelist.new)
    @menu = twm
    @plist = pl
    @totalprice = 0.00
    @dishlist = Hash.new
    @invoice =  "Details of your Order: \n"
    @invoice << "---------------------- \n"
    @invoice << "#\t\tDish\t\tQty - UnitPrice\t\tItemTotal(£)\n"
    @inv_ctr = 1
    @menu.list
  end

  def need(dish,quantity = 1)
    raise "No dish specified" if !dish
    raise "Quantity cannot be less than 1" if quantity == 0
    #puts @plist.getprice(dish)
    @totalprice += (@plist.getprice(dish).to_f * quantity).to_f
    @invoice << "#{@inv_ctr}:\t\t#{dish.capitalize}\t\t#{quantity}x#{@plist.getprice(dish)}\t\t#{(quantity*@plist.getprice(dish)).to_f}\n"
    @inv_ctr +=1
    "Order accepted"
  end

  def review
    raise "No Order history please order before review" if @totalprice == 0.00
    @invoice << "----------\t------------\t\t-----\t\t-----\n"
    @invoice << "Final Bill\t\t\t\t\t\t#{@totalprice}\n"
    @invoice << "----------\t------------\t\t-----\t\t-----\n"
    "Kindly call confirmorder to place the order!"
    #@totalprice
  end

  # Need a method to reset the order
  #def cancel
  #end

  def confirmorder (sms = Sms.new)
    raise "No Order history detected" if @totalprice == 0.0
    sms.send
    "You should receive confirmation text shortly"
  end
end
