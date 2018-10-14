class Pricelist
  def getprice(dish)
    itemprice = {:stirfrynoodles => 5, :stirfryrice => 4,
        :chickendishes => 5, :tikkamasala => 5, :naanbreads => 3,
        :pulaorice => 5, :cottagepies => 5, :sundayroast => 10,
        :jacketpotato =>3}
     itemprice[dish.to_sym].to_f
  end
end
