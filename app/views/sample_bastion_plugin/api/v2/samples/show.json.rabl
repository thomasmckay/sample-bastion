object @resource

attributes :id, :name, :description, :number

node :permissions do |sample|
  {
    :create_samples => sample.editable?,
    :view_samples => sample.readable?,
    :edit_samples => sample.editable?,
    :destroy_samples => sample.deletable?
  }
end
