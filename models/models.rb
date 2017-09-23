require 'data_mapper'
require 'dm-migrations'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'sqlite:data/database.sqlite')

class User
  include DataMapper::Resource

  property :id,         Serial
  property :username,   String
  property :password,   String, :length => 128
  property :name,       String
end

DataMapper.finalize
# DataMapper.auto_migrate!
DataMapper.auto_upgrade!
