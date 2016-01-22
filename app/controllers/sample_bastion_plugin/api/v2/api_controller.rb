module SampleBastionPlugin
  class Api::V2::ApiController < ::Katello::Api::V2::ApiController

    # TODO: allow options[:template] in katello's rendering.rb
    def respond_with_template(action, resource_name, options = {}, &_block)
      yield if block_given?
      status = options[:status] || 200

      render :template => "sample_bastion_plugin/api/v2/#{resource_name}/#{action}",
             :status => status,
             :locals => { :object_name => options[:object_name],
                          :root_name => options[:root_name] },
             :layout => "katello/api/v2/layouts/#{options[:layout]}"
    end
  end
end
