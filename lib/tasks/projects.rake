namespace :projects do
  task _setup: :environment do
    Rails.logger = Logger.new($stdout)
    ActiveRecord::Base.logger = nil
  end

  desc "Update all project versions"
  task update: :_setup do
    full_sync = ActiveModel::Type::Boolean.new.cast(ENV.fetch('FULL_SYNC', 'false'))

    Rails.logger.info "full_sync: #{full_sync}"

    Project.active.each { |p| Projects::SynchronizeVersions.new(p, full_sync: full_sync).call }
  end
end
