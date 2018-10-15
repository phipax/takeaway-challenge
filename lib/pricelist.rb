class Pricelist
  attr_reader :itemprice

  def initialize
    @itemprice = {:stirfrynoodles => 5, :stirfryrice => 4,
        :chickendishes => 5, :tikkamasala => 5, :naanbreads => 3,
        :pulaorice => 5, :cottagepies => 5, :sundayroast => 10,
        :jacketpotato =>3}
  end

  def getprice(dish)
    raise "Not a valid dish" if dish == "" || dish == nil
    raise "Not a valid dish" if (!@itemprice.include?(dish.to_sym))
     @itemprice[dish.to_sym].to_f
  end
end
