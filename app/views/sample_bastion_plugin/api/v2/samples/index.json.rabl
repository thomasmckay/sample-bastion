object false

extends "katello/api/v2/common/metadata"

child @collection[:results] => :results do
  extends("sample_bastion_plugin/api/v2/samples/show")
end
