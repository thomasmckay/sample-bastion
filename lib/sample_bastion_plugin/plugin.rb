Foreman::Plugin.register :roles_plugin do
  requires_foreman '> 1.10'

  menu :top_menu,
       :sample_bastion_plugin,
       :caption => N_('Sample Models'),
       :url => '/sample_models',
       :url_hash => {:controller => 'sample_bastion_plugin/api/sample_models',
                     :action => 'index'},
       :engine => SampleBastionPlugin::Engine,
       :parent => :monitor_menu,
       :after => :dashboard,
       :turbolinks => false

  apipie_documented_controllers(["#{SampleBastionPlugin::Engine.root}"\
                                 "/app/controllers/sample_bastion_plugin/api/v2/*.rb"])
end
