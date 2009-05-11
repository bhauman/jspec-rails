ActionController::Routing::Routes.draw do |map|
  map.connect 'jspec/:action/:id', :controller => 'jspec'
end
