
begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue
  puts "Rubocop not loaded"
end

task :default do
  Rake::Task['rubocop'].execute
end
