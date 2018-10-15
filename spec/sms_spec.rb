require './lib/sms'

describe "Class Sms" do

  let(:client) {double :client, :new => client_klass}
  let(:client_klass) {double :client, :messages => messages}
  let(:messages)     {double :mock_msg, :create => "Hello"}

  context "Initialize Sms class" do
    it "#Init: To validate the object" do
      expect(Sms.new(client)).to be_instance_of(Sms)
    end
    it "Fetches the environment variables" do
      subject = Sms.new(client)
      expect(subject.to).to eq(ENV['MYNUMBER'])
    end
  end
  context "#Send Method" do
    it "Checks for return value" do
      allow(client).to receive(:client_klass) {client_klass}
      allow(client_klass).to receive(:message) {messages}
      allow(messages).to receive(:create) {"Hello"}
      subject = Sms.new(client)
      expect(subject.send).to eq "Complete"
    end
    it "Checks for the call to Twilio API" do
      allow(client).to receive(:client_klass) {client_klass}
      allow(client_klass).to receive(:message) {messages}
      allow(messages).to receive(:create) {"Hello"}
      subject = Sms.new(client)
      expect(messages).to receive(:create)
      subject.send
    end
  end
end
