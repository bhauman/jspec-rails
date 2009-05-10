ActionController::Routing::Routes.draw do |map|
#  map.connect 'jspec/:action/:id', :controller => 'jspec'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
