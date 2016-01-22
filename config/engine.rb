Foreman::Application.routes.draw do
  mount SampleBastionPlugin::Engine, :at => '/', :as => 'sample_bastion_plugin'
end
