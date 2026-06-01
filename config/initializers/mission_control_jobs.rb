Rails.application.configure do
  MissionControl::Jobs.http_basic_auth_user = ENV.fetch("MISSION_CONTROL_JOBS_USER")
  MissionControl::Jobs.http_basic_auth_password = ENV.fetch("MISSION_CONTROL_JOBS_PASSWORD")
end
