module SampleBastionPlugin
  class Api::V2::SamplesController < Api::V2::ApiController
    include Katello::Concerns::FilteredAutoCompleteSearch

    before_filter :find_resource, :only => [:show, :update, :destroy]

    def index
      respond_for_index(:collection => scoped_search(index_relation.uniq, :name, :desc))
    end

    def show
      respond_for_show
    end

    def create
      @sample = Sample.new(sample_params)
      @sample.save!
      respond_for_show
    end

    def update
      @sample.update_attributes!(sample_params)
      respond_for_show
    end

    def destroy
    end

    protected

    def authorized
      User.current.allowed_to?(params.slice(:action, :id).merge(controller: 'api/v2/samples'))
    end

    def resource_class
      SampleBastionPlugin::Sample
    end

    def index_relation
      samples = Sample.readable
      samples = samples.where(:name => params[:name]) if params[:name]
      samples
    end

    private

    def sample_params
      params.require(:sample).permit(:name,
                                     :description,
                                     :number)
    end
  end
end
