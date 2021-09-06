# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

# require_relative "config/application"
#
# Rails.application.load_tasks

task :default do
  puts "Time now: #{Time.zone.now}"
end

desc 'Set timezone'
task set_timezone: :environment do
  ENV['TZ'] = 'UTC'
end

desc 'Show time'
task current_time: :set_timezone do
  puts "Time now: #{Time.zone.now}"
end

namespace :work_with_files do
  task create_directory: :environment do
    mkdir_p('New_directory')
    cd('New_directory')
    touch('Some_file')
  end
end
