class Takeawaymenu
  attr_reader :menu
  attr_reader :ref_menu
  def initialize
    @ref_menu = ""
    @menu = Hash.new
    @menu = {:chinese => {:stirfrynoodles => 5, :stirfryrice => 4,
        :chickendishes => 5},
        :indian =>  {:tikkamasala => 5, :naanbreads => 3, :pulaorice => 5},
        :british => {:cottagepies => 5, :sundayroast => 10, :jacketpotato =>3}}
  end

  def list(cuisine = "all")
    raise "Cuisine not provided (chinese, indian or british)" if cuisine == ""
    raise "Cuisine not available (chinese, indian or british)" unless (@menu.has_key?(cuisine.to_sym) || cuisine == "all")
    @ref_menu = ""
    format_menu(cuisine)
  end

  private

  def format_menu(cuisine)
    if cuisine == "all"
        @menu.each { |cusine,dishes|
        @ref_menu << cusine.to_s.upcase << "\n"
        dishes.each_with_index { |dish,index| format_dishes(dish,index) }
        line }
    else
      @ref_menu = cuisine.upcase + "\n"
      @menu[cuisine.to_sym].each_with_index { |dish,index| format_dishes(dish,index) }
      line
    end
    @ref_menu
  end

  def format_dishes(dish,index)
    @ref_menu << "Item #{index+1}: #{dish[0].to_s.capitalize}\t..... £ #{dish[1]} \n"
  end

  def line
    @ref_menu << "-------------------------------------------------- \n"
  end

end
