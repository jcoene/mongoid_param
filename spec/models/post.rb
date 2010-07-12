class Post
  include Mongoid::Document
  include Mongoid::Param
  
  field :year
  field :month
  field :day
  field :title
  field :active, :type => Boolean, :default => true
  
  param :year, :month, :day, :title
  
  scope :active, where(:active => true)
  scope :inactive, where(:active => false)
  
end
