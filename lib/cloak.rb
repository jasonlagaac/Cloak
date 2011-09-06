require 'yaml'
require 'crypt/blowfish'
require 'cloak/entry'
require 'cloak/list'
require 'cloak/version'


## 
# General Functions

module Cloak
  extend self

  def verify_password(password)
    password_file = File.expand_path("~/.cloak_password")
    cloak_password = File.new(password_file, "r")
    password_hash = cloak_password.gets
    hashed_password = BCrypt::Password.new(password_hash)

    return hashed_password == password
  end

end
