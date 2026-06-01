module Projects
  module SynchronizeAllVersions
    extend self

    def call
      Project.active.each { |p| Projects::SynchronizeVersionsJob.perform_later(p, full_sync) }
    end

    private

    def full_sync
      @full_sync ||= ActiveModel::Type::Boolean.new.cast(ENV.fetch("FULL_SYNC", "false"))
    end
  end
end
