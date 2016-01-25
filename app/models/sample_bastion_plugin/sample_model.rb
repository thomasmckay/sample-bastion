module SampleBastionPlugin
  class SampleModel < ActiveRecord::Base
    include Authorization::SampleModel

    audited :allow_mass_assignment => true

    attr_accessible :name, :description, :number

    validates_lengths_from_database
    validates :name, presence: true, uniqueness: true
    validates :number, presence: true, uniqueness: true
    # TODO: validate number range

    scoped_search :on => :name, :complete_value => true, :default_order => true
    scoped_search :on => :description, :complete_value => false
    scoped_search :on => :number, :complete_value => true
  end
end
