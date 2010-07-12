# Generates and allows you to query against a human-friendly name for your records.
module Mongoid
  
  module Param
  
    def self.included(base)
      base.send :extend, ClassMethods
    end
  
    module ClassMethods
    
      def param(*on_fields)
        cattr_accessor :param_fields
        self.param_fields = on_fields
        field :_param, :type => String
        index :_param, :unique => true
        scope :param_is, lambda {|p| where(:_param => p) }
        validates :_param, :presence => true, :uniqueness => true,
          :format => { :with => /[-a-z0-9_]+/ },
          :exclusion => { :in => %w[index show new create edit update destroy delete] }
        before_validation :make_param
        
        send :include, InstanceMethods
      end
      
      def find_by_param(value)
        where(:_param => value).first
      end
      
    end
  
    module InstanceMethods
      def make_param
        p = (self.param_fields.collect { |f| self.send(f) }.join(" ") || self._id).gsub(/('|")/, '')
        self._param = p.parameterize('_')
      end
      
      def to_param
        _param_was || _param
      end
    end
    
  end
end