class Setting::SampleBastionPlugin < ::Setting
  def self.load_defaults
    return unless super
    self.transaction do
      [
        self.set('sample_bastion_plugin_number',
                 N_('Number to get started with'),
                 2)
      ].each { |s| self.create! s.update(:category => 'Setting::SampleBastionPlugin') }
    end
    true
  end
end
