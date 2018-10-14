1. User story to look at list of dishes and their prices.

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

This would be a class just to display menus and prices. Takes in Cuisine object.
Retrieves all dishes pertaining to the cuisine and the corresponding prices.

CHINESE
Item 1: Stirfrynoodles  ..... £ 5
Item 2: Stirfryrice     ..... £ 4
Item 3: Chickendishes   ..... £ 5
--------------------------------------------------
INDIAN
Item 1: Tikkamasala     ..... £ 5
Item 2: Naanbreads      ..... £ 3
Item 3: Pulaorice       ..... £ 5
--------------------------------------------------

BRITISH
Item 1: Cottagepies     ..... £ 5
Item 2: Sundayroast     ..... £ 10
Item 3: Jacketpotato    ..... £ 3
--------------------------------------------------

 2. User story to make an order

 As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

This would be an Order class that accepts orders from a user. User will specify
dishes from cuisine or dishes across cuisine. User will specify quantity for each dishes.

- Call the need method by passing the name of the dish from above and quantity (optional)
- Call the review method to review all orders

in IRB:
-------
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

you should see something like this..

2.5.0 :004 > puts menu.list("all")
CHINESE
Item 1: Stirfrynoodles  ..... £ 5
Item 2: Stirfryrice     ..... £ 4
Item 3: Chickendishes   ..... £ 5
--------------------------------------------------
INDIAN
Item 1: Tikkamasala     ..... £ 5
Item 2: Naanbreads      ..... £ 3
Item 3: Pulaorice       ..... £ 5

--------------------------------------------------
BRITISH
Item 1: Cottagepies     ..... £ 5
Item 2: Sundayroast     ..... £ 10
Item 3: Jacketpotato    ..... £ 3
--------------------------------------------------

2.5.0 :005 > puts menu.list("chinese")
CHINESE
Item 1: Stirfrynoodles  ..... £ 5
Item 2: Stirfryrice     ..... £ 4
Item 3: Chickendishes   ..... £ 5
--------------------------------------------------

2.5.0 :017 > puts order.review

Details of your Order:
----------------------
#               Dish            Qty - UnitPrice         ItemTotal(£)
1:              Pulaorice               1x5.0           5.0
2:              Stirfryrice             3x4.0           12.0
3:              Stirfrynoodles          4x5.0           20.0
4:              Naanbreads              5x3.0           15.0
5:              Tikkamasala             4x5.0           20.0
6:              Cottagepies             10x5.0          50.0
7:              Sundayroast             10x10.0         100.0
8:              Jacketpotato            1x3.0           3.0
----------      ------------            -----           -----
Final Bill                                              225.0
----------      ------------            -----           -----
