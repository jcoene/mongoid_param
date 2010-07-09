class User
  include Mongoid::Document
  include Mongoid::Param
  
  field :username
  field :dob, :type => Date
  
  param :username
end
