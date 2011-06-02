class User
  include MongoMapper::Document

  key :name, String
  key :email, String
  
  has_many :microposts

end
