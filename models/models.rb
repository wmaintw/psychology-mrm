require 'data_mapper'
require 'dm-migrations'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'sqlite:data/database.sqlite')

class User
  include DataMapper::Resource

  property :id,         Serial
  property :username,   String, :length => 32
  property :password,   String, :length => 128
  property :name,       String
end

DataMapper.finalize

# This will drop existing table schema first, so that data will be wiped.
# DataMapper.auto_migrate!

# This just update table schema, add new tables or columns, but do nothing about modify columns.
DataMapper.auto_upgrade!
