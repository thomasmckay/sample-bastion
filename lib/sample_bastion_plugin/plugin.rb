Foreman::Plugin.register :roles_plugin do
  requires_foreman '> 1.10'

  menu :top_menu,
       :sample_bastion_plugin,
       :caption => N_('Samples'),
       :url => '/samples',
       :url_hash => {:controller => 'sample_bastion_plugin/api/samples',
                     :action => 'index'},
       :engine => SampleBastionPlugin::Engine,
       :parent => :monitor_menu,
       :after => :dashboard,
       :turbolinks => false
end
