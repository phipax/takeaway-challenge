require './lib/placeorder'

describe Placeorder do

  let(:takeawaymenu) {double :takeawaymenu, :list => "dish"}
  let(:pricelist)    {double :pricelist, :getprice => 2}
  subject(:Placeholder) {described_class.new(takeawaymenu)}

  context "class Placeorder" do
    it "Checks for the order instance & displays the menulist" do
      expect(Placeorder.new(takeawaymenu,pricelist)).to be_instance_of(Placeorder)
    end

    it "Checks for the menu list" do
      expect(takeawaymenu).to receive(:list)
      subject = Placeorder.new(takeawaymenu,pricelist)
    end
  end

  context "#order('dish','quantity')" do
    it "Confirms the order" do
      dish = "stirfryrice"
      allow(pricelist).to receive(:getprice).with(dish).and_return(1)
      subject = Placeorder.new(takeawaymenu,pricelist)
      expect(subject.need(dish,1)).to eq "Order accepted"
    end
    it "Throws error if dish is not provided" do
      dish = nil
      allow(pricelist).to receive(:getprice).with(dish).and_return(1)
      subject = Placeorder.new(takeawaymenu,pricelist)
      expect{subject.need(dish,5)}.to raise_error{"No dish specified"} if !dish
    end
    it "Every need is added to a order hash along with unitprice and quantity" do
      dish = "pulaorice"
      expect(pricelist).to receive(:getprice)
      subject = Placeorder.new(takeawaymenu,pricelist)
      subject.need(dish)
    end
  end

end
