module SampleBastionPlugin
  module Api
    module V2
      class SampleModelsController < Api::V2::ApiController
        include Katello::Concerns::FilteredAutoCompleteSearch

        before_filter :find_resource, :only => [:show, :update, :destroy]

        def_param_group :sample_model do
          param :name, String, :required => true, :desc => N_('Unique Sample Model name')
          param :description, String, :required => false, :desc => N_('Sample Model description')
          param :number, Integer, :required => true,
                :desc => N_('Unique Sample Model number greater than one (1)')
        end

        api :GET, '/sample_models', N_('List Sample Models')
        param_group :search, Katello::Api::V2::ApiController
        def index
          # TODO: Shouldn't the sort field and order be passed in?
          respond_for_index(:collection => scoped_search(index_relation.uniq, :name, :desc))
        end

        api :GET, '/sample_models/:id', N_('Show a Sample Model')
        param :id, :identifier, :desc => N_("Id of the Sample Model"), :required => true
        def show
          respond_for_show
        end

        api :POST, '/sample_models', N_("Create a Sample Model")
        param_group :sample_model
        def create
          @sample_model = SampleModel.new(sample_model_params)
          @sample_model.save!
          respond_for_show
        end

        api :PUT, '/sample_models', N_("Update a Sample Model")
        param :id, :identifier, :desc => N_("Id of the Sample Model"), :required => true
        param_group :sample_model
        def update
          @sample_model.update_attributes!(sample_model_params)
          respond_for_show
        end

        api :DESTROY, '/sample_models', N_("Delete a Sample Model")
        param :id, :identifier, :desc => N_("Id of the Sample Model"), :required => true
        def destroy
          @sample_model.destroy
          respond_for_destroy
        end

        protected

        def authorized
          User.current.allowed_to?(params.slice(:action, :id)
                                     .merge(controller: 'api/v2/sample_models'))
        end

        def resource_class
          SampleBastionPlugin::SampleModel
        end

        def index_relation
          sample_models = SampleModel.readable
          sample_models = sample_models.where(:name => params[:name]) if params[:name]
          sample_models
        end

        private

        def sample_model_params
          params.require(:sample_model).permit(:name,
                                               :description,
                                               :number)
        end
      end
    end
  end
end
