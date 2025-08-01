require "rails_helper"

class DummyJob < ApplicationJob
  def perform
    raise Faraday::TooManyRequestsError, status: "429", headers: { retry_after: "600" }
  end
end

RSpec.describe ApplicationJob do
  include ActiveJob::TestHelper

  before do
    ActiveJob::Base.queue_adapter = :test
  end

  describe "#perform" do
    it "re-enqueues the job with a wait time based on the provided header" do
      perform_enqueued_jobs do
        expect_any_instance_of(DummyJob).to receive(:retry_job).with(wait: 5.minutes)

        DummyJob.perform_later
      end
    end
  end
end
