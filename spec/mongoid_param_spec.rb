require "spec_helper"

describe Mongoid::Param do
  
  context "user" do
    
    before(:each) do
      @bob = User.create(:username => 'Bob', :dob => Date.today)
      @nancy = User.create(:username => 'Nancy', :dob => Date.today)
    end
    
    it "generates param" do
      @bob.to_param.should eql 'bob'
    end
    
    it "updates the param" do
      @bob.update_attributes :username => 'Bobby'
      @bob.to_param.should eql 'bobby'
    end
    
    it "requires a unique param" do
      @bob.update_attributes :username => 'Nancy'
      @bob.errors['_param'].include?('is already taken').should eql true
    end
    
    it "finds by param" do
      u = User.find_by_param('bob')
      u.blank?.should eql false
    end
    
    it "does not find nonexistent things" do
      u = User.find_by_param('someone')
      u.blank?.should eql true
    end
    
    it "junks bad characters" do
      u = User.create(:username => '(Alien) Cyborg Warfare #3')
      u.to_param.should eql 'alien_cyborg_warfare_3'
    end
    
  end
  
  context "post" do
    
    before(:each) do
      @big = Post.create(:year => 2010, :month => 06, :day => 21, :title => 'Big Announcement')
      @big_two = Post.create(:year => 2011, :month => 06, :day => 21, :title => 'Big Announcement')
      @little = Post.create(:year => 2009, :month => 02, :day => 04, :title => 'Little Announcement')
    end
    
    it "has the proper entires" do
      Post.count.should eql 3
    end
    
    it "has globbed params" do
      @big.to_param.should eql "2010_6_21_big_announcement"
      @big_two.to_param.should eql "2011_6_21_big_announcement"
      @little.to_param.should eql "2009_2_4_little_announcement"
    end
    
    it "requires a unique param" do
      @big_two.update_attributes :year => 2010
      @big_two.errors['_param'].include?('is already taken').should eql true
    end
    
    it "finds by param" do
      p = Post.find_by_param('2010_6_21_big_announcement')
      p.blank?.should eql false
    end
    
    it "does not find nonexistent things" do
      p = Post.find_by_param('2010_5_3_some_post')
      p.blank?.should eql true
    end
    
  end
  
end

      