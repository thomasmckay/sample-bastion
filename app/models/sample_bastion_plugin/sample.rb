module SampleBastionPlugin
  class Sample < ActiveRecord::Base

    include Authorization::Sample

    audited :allow_mass_assignment => true

    attr_accessible :name, :description, :number

    scoped_search :on => :name, :complete_value => true, :default_order => true
    scoped_search :on => :description, :complete_value => false
    scoped_search :on => :number, :complete_value => true
  end
end
