FactoryBot.define do
  factory :version do
    project
    major { 1 }
    minor { 2 }
    patch { 3 }
    git_tag { "v1.2.3" }
    git_sha { "64f7c1e998f0dc07ea5865a6984a7cc33b7fa67f" }
    released_at { 10.days.ago }
    latest { false }
  end
end
