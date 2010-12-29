require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Hotp" do
    it "calculates HMAC SHA1 OTPs with length of 6" do
        otps = [755224, 287082, 359152, 969429, 338314, 254676, 287922, 162583, 399871, 520489]
        0.upto(9) do |i|
            Hotp.new("12345678901234567890", i, 6, 'sha1').otp.should == otps[i]
        end
    end
end
