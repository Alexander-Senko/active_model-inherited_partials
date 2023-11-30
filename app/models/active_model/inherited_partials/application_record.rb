module ActiveModel
  module InheritedPartials
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
