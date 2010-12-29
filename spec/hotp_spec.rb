require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Hotp" do
    it "calculates correct OTP" do
        hotp = Hotp.new("12345678901234567890", 0)
        hotp.calculate.should == 755224
    end
end
