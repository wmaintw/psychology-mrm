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

class Lead
  include DataMapper::Resource

  property :id,                     Serial
  property :mobile,                 String, :length => 18
  property :initial_contact_at      DateTime
  property :name,                   String, :length => 12
  property :gender,                 String, :length => 4
  property :statement_by_visitor    Text
  property :initial_problem         Text
  property :respond_to_problem      Text
  property :affected_by_problem     Text

  property :age,                    Integer
  property :marital_status,         String
  property :has_children,           String
  property :ethnic                  String
  property :occupation              String
  property :education               String

  property :referral                Boolean, :default => false
  property :referral_comments       Text
  property :comments                Text

  property :booking_sms_sent        Boolean, :default => false
  property :status                  String
  property :active                  Boolean, :default => true
end

DataMapper.finalize

# This will drop existing table schema first, so that data will be wiped.
# DataMapper.auto_migrate!

# This just update table schema, add new tables or columns, but do nothing about modify columns.
DataMapper.auto_upgrade!
