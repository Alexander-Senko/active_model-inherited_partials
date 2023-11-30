module ActiveModel
  module InheritedPartials
    class Engine < ::Rails::Engine
      isolate_namespace ActiveModel::InheritedPartials
    end
  end
end
