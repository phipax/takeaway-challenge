require './lib/placeorder'

describe Placeorder do

  let(:takeawaymenu) {double :takeawaymenu, :list => "dish"}
  let(:pricelist)    {double :pricelist, :getprice => 2}
  let(:client)       {double :client}
  let(:sms)          {double :sms, :send => "You should receive confirmation text shortly"}

  subject(:placeholder) {described_class.new(takeawaymenu)}

  context "class Placeorder" do
    it "Checks for the order instance & displays the menulist" do
      expect(Placeorder.new(takeawaymenu,pricelist)).to be_instance_of(Placeorder)
    end

    it "Checks for the menu list" do
      expect(takeawaymenu).to receive(:list)
      subject = Placeorder.new(takeawaymenu,pricelist)
    end
  end

  context "#need('dish','quantity')" do
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
    it "Throws error if quantity is Zero" do
      dish = "pulaorice"
      quantity = 0
      allow(pricelist).to receive(:getprice).with(dish).and_return(1)
      subject = Placeorder.new(takeawaymenu,pricelist)
      expect{subject.need(dish,quantity)}.to raise_error{"Quantity cannot be less than 1"} if quantity == 0
    end
    it "Every need is added to a order hash along with unitprice and quantity" do
      dish = "pulaorice"
      expect(pricelist).to receive(:getprice)
      subject = Placeorder.new(takeawaymenu,pricelist)
      subject.need(dish)
    end
  end

  context "#Review order" do
    it "Review the order" do
      dish = "pulaorice"
      allow(pricelist).to receive(:getprice).with(dish).and_return(5)
      subject = Placeorder.new(takeawaymenu,pricelist)
      subject.need(dish,5)
      expect(subject.review).to eq "Kindly call confirmorder to place the order!"
    end
    it "Raise error if review is invoked when no orders have been made" do
      dish = "pulaorice"
      allow(pricelist).to receive(:getprice).with(dish).and_return(5)
      subject = Placeorder.new(takeawaymenu,pricelist)
      expect{subject.review}.to raise_error{"No Order history please order before review"} if subject.totalprice == 0.00
    end
  end

  context "#Confirm order" do
    it "Confirm the order" do
      subject = Placeorder.new(takeawaymenu,pricelist)
      dish = "pulaorice"
      subject.need(dish,5)
      expect(subject.confirmorder(sms)).to eq "You should receive confirmation text shortly"
    end
    it "Throws error if there is nothing to confirm" do
      subject = Placeorder.new(takeawaymenu,pricelist)
      expect{subject.confirmorder}.to raise_error{"No Order history detected"} if subject.totalprice == 0.0
    end
    it "Calls the sms service" do
      subject = Placeorder.new(takeawaymenu,pricelist)
      dish = "pulaorice"
      subject.need(dish,5)
      expect(sms).to receive(:send).with(no_args) 
      subject.confirmorder(sms)
    end
  end

end
