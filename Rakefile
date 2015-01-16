require 'rake'
require 'rake/testtask'
require_relative './config/environment'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
end

task default: :test
task spec: :test

namespace :db do
  task :migrate do
    require_relative 'lib/config/migrations'
    HeroPicker::Migration.migrate!
  end
end

namespace :data do
  task :update_heroes do
    require_relative 'lib/commands/hero_fetcher'
    HeroPicker::Command::HeroFetcher.run
  end

  task :update do
    require_relative 'lib/commands/full_data_fetcher'
    HeroPicker::Command::FullDataFetcher.run
  end
end
