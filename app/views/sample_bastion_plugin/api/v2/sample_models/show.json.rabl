object @resource

attributes :id, :name, :description, :number

node :permissions do |sample_model|
  {
    :create_sample_models => sample_model.editable?,
    :view_sample_models => sample_model.readable?,
    :edit_sample_models => sample_model.editable?,
    :destroy_sample_models => sample_model.deletable?
  }
end
