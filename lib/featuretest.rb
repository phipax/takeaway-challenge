require './lib/takeawaymenu'
menu = Takeawaymenu.new
menu.list("all")
menu.list("chinese")

require './lib/placeorder'
order = Placeorder.new
menu = Takeawaymenu.new
puts menu.list("all")
puts menu.list("chinese")
# should display all the dishes available - each order contains a dish
order.need("pulaorice")
order.need("stirfryrice",3)
order.need("stirfrynoodles",4)
order.need("naanbreads",5)
order.need("tikkamasala",4)
order.need("cottagepies",10)
order.need("sundayroast",10)
order.need("jacketpotato")

#Displays all dishes added to the order
puts order.review

#Confirm orders & view the total
order.confirm
