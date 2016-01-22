require File.expand_path("../engine", File.dirname(__FILE__))

namespace :sample_bastion_plugin do

  desc "Runs Rubocop style checker on Sample Bastion Plugin code"
  task :rubocop do
    system("cd #{SampleBastionPlugin::Engine.root} && bundle exec rubocop")
  end

  desc "Runs Rubocop style checker with xml output for Jenkins"
  task 'rubocop:jenkins' do
    system("cd #{SampleBastionPlugin::Engine.root} && bundle exec rubocop \
            --require rubocop/formatter/checkstyle_formatter \
            --format RuboCop::Formatter::CheckstyleFormatter \
            --no-color --out rubocop.xml")
    exit($?.exitstatus)
  end

end
