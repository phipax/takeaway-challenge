require './lib/takeawaymenu'

describe Takeawaymenu do
  subject(:menu) {described_class.new}

  context "Check class existence" do
    it "Takeawaymenu Class" do
      expect(Takeawaymenu.new).to be_instance_of(Takeawaymenu)
    end
  end

  context "Create a menu listing" do
    it "#listallmenu" do
      expect(menu.list("all")).to eq menu.ref_menu
    end
    it "#list dishes for a specific cuisine" do
      cus = "chinese"
      str = "CHINESE\nItem 1: Stirfrynoodles\t..... £ 5 \nItem 2: Stirfryrice\t..... £ 4 \nItem 3: Chickendishes\t..... £ 5 \n-------------------------------------------------- \n"
      expect(menu.list(cus)).to eq str 
    end
    it "Raise error if list is invoked with no cuisine" do
      expect{menu.list("")}.to raise_error{"Cuisine not provided (chinese, indian or british)"}
    end
    it "Raise error if list is invoked with unknown cuisine" do
      expect{menu.list(:italian)}.to raise_error{"Cuisine not available (chinese, indian or british)"}
    end
  end
end
