class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError

  rescue_from Faraday::TooManyRequestsError do |e|
    seconds = [e.response.dig(:headers, :retry_after).to_i, 5.minutes].min

    Rails.logger.info "Received TooManyRequestsError - Retry in #{seconds} seconds"

    retry_job wait: seconds
  end
end
