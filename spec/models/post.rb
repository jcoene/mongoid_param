class Post
  include Mongoid::Document
  include Mongoid::Param
  
  field :year
  field :month
  field :day
  field :title
  
  param :year, :month, :day, :title
end
