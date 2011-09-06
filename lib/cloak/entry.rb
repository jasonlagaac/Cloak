module Cloak
  class Entry 

    ##
    # Password in clear
    attr_accessor :password

    ##
    # Description
    attr_accessor :description

    ##
    # Initialise with secret
    def initialize(description = nil)
      @password = nil
      @description = description or raise 'Please enter a description of your entry'
    end

    def encrypt(password_data, key)
      blowfish = Crypt::Blowfish.new(key)
      @password = blowfish.encrypt_string(password_data)
      @password.force_encoding("BINARY")
    end

    def decrypt(key)
      blowfish = Crypt::Blowfish.new(key)
      blowfish.decrypt_string(@password)
    end
  end
end
