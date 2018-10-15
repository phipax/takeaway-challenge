require './lib/pricelist'

describe Pricelist do

 subject(:Pricelist) {described_class.new()}

  context "Class Pricelist" do
    it "Checks to see if the instance of the class is created" do
      expect(Pricelist.new()).to be_instance_of(Pricelist)
    end
  end

  context "#getprice(dish)" do
    it "Retrieves price of a dish" do
      subject = Pricelist.new()
      expect(subject.getprice("pulaorice")).to eq 5
    end
    it "Throws error when the method is called with no dish (blank or nil)" do
      subject = Pricelist.new()
      dish = ""
      expect{subject.getprice(dish)}.to raise_error {"Not a valid dish"} if dish == ""
    end
    it "Throws error when the method is called with no dish or invalid dish (invalid value)" do
      subject = Pricelist.new()
      dish = "applepie"
      expect{subject.getprice(dish)}.to raise_error {"Not a valid dish"} if !(subject.itemprice.include?(dish))
    end
  end
end
