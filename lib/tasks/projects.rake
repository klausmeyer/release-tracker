namespace :projects do
  task _setup: :environment do
    Rails.logger = Logger.new($stdout)
    ActiveRecord::Base.logger = nil
  end

  desc "Update all project versions"
  task update: :_setup do
    full_sync = ActiveModel::Type::Boolean.new.cast(ENV.fetch("FULL_SYNC", "false"))

    Project.active.each { |p| Projects::SynchronizeVersionsJob.perform_later(p, full_sync) }
  end
end
