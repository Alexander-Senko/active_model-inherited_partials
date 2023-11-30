Rails.application.routes.draw do
  mount ActiveModel::InheritedPartials::Engine => "/active_model-inherited_partials"
end
