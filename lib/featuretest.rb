require './lib/takeawaymenu'
menu = Takeawaymenu.new
menu.list("all")
menu.list("chinese")

require './lib/placeorder'
order = Placeorder.new
# should display all the dishes available - each order contains a dish
order.need(dish,quantity)
order.need("pulaorice")
order.need("stirfryrice",3)
#Displays all dishes added to the order
order.review

#Confirm orders & view the total
order.confirm
