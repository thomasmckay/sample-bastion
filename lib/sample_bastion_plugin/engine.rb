require 'bastion'

module SampleBastionPlugin
  class Engine < ::Rails::Engine
    isolate_namespace SampleBastionPlugin

    initializer 'sample_bastion_plugin.assets_dispatcher',
            :before => :build_middleware_stack do |app|
      app.middleware.use ::ActionDispatch::Static,
        "#{SampleBastionPlugin::Engine.root}/app/assets/javascripts/sample_bastion_plugin"
    end

    initializer 'sample_bastion_plugin.engine', :after => :build_middleware_stack do |app|
      app.routes_reloader.paths << "#{SampleBastionPlugin::Engine.root}/config/engine.rb"
    end

    initializer "sample_bastion_plugin.paths" do |app|
      app.routes_reloader.
        paths.unshift("#{SampleBastionPlugin::Engine.root}/config/routes/api/v2.rb")
    end

    initializer "sample_bastion_plugin.assets", :group => :all do |app|
      SETTINGS[:sample_bastion_plugin] = {
        :assets => {
          :precompile => ['sample_bastion_plugin/sample_bastion_plugin.js']
        }
      }

      app.config.assets.precompile += SETTINGS[:sample_bastion_plugin][:assets][:precompile]
    end

    initializer "katello.apipie" do
      Apipie.configuration.checksum_path += ['/sample_bastion_plugin/api/']
      require 'sample_bastion_plugin/apipie/validators'
    end

    initializer "sample_bastion_plugin.load_app_instance_data" do |app|
      app.config.autoload_paths += Dir["#{config.root}/app/lib"]
    end

    config.to_prepare do
      Bastion.register_plugin(:name => 'sample_bastion_plugin',
                              :javascript => 'sample_bastion_plugin/sample_bastion_plugin',
                              :pages => %w(sample_models))
    end

    config.after_initialize do
      require 'sample_bastion_plugin/plugin'
      require 'sample_bastion_plugin/permissions'
    end

    rake_tasks do
      load "#{SampleBastionPlugin::Engine.root}/lib/sample_bastion_plugin/tasks/rubocop.rake"
    end
  end
end
