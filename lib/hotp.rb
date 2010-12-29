#!/usr/bin/env ruby
#
# HOTP - One Time Passwords 
# An implementation of RFC 4226
#

require 'openssl'

class Hotp
    attr_reader :otp
    def initialize(secret, count, digits=6, digest="sha1")
        hmac_result = OpenSSL::HMAC.digest( OpenSSL::Digest::Digest.new(digest),
                                            secret,
                                            [count.chr].pack('a8').reverse
                                          )
        offset = hmac_result[19] & 0xf
        bin_code = (hmac_result[offset] & 0x7f) << 24 |
            (hmac_result[offset + 1] & 0xff) << 16 |
            (hmac_result[offset + 2] & 0xff) << 8 |
            (hmac_result[offset + 3] & 0xff)
        @otp = bin_code % 10 ** digits
    end
end
