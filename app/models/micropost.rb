class Micropost
  include MongoMapper::Document

  key :content, String
  key :user_id, String
  
  belongs_to :user
  validates :content, :length => { :maximum => 140 }
  

end
