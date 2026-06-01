namespace :projects do
  task _setup: :environment do
    Rails.logger = Logger.new($stdout)
    ActiveRecord::Base.logger = nil
  end

  desc "Update all project versions"
  task update: :_setup do
    Projects::SynchronizeAllVersions.call
  end
end
